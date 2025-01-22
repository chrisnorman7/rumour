import 'dart:math';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_player/rumour_player.dart';
import 'package:time/time.dart';

/// A screen to play a given [room].
class PlayRoomScreen extends ConsumerStatefulWidget {
  /// Create an instance.
  const PlayRoomScreen({
    required this.playerId,
    super.key,
  });

  /// The ID of the player to play.
  final String playerId;

  /// Create state for this widget.
  @override
  PlayRoomScreenState createState() => PlayRoomScreenState();
}

/// State for [PlayRoomScreen].
class PlayRoomScreenState extends ConsumerState<PlayRoomScreen> {
  /// An error object.
  Object? _error;

  /// A stack trace to show.
  StackTrace? _stackTrace;

  /// The timed commands state to use.
  late TimedCommandsState timedCommandsState;

  /// The project context to use.
  late ProjectContext projectContext;

  /// The project loaded from [projectContext].
  Project get project => projectContext.project;

  /// The game player context to use.
  late GamePlayerContext _gamePlayerContext;

  /// The player to play.
  GamePlayer get _player => _gamePlayerContext.gamePlayer;

  /// The room where the player is.
  Room get _room => _gamePlayerContext.room;

  /// The [zone] music.
  SoundReference? get _zoneMusic => _gamePlayerContext.zoneMusic;

  /// The maximum x coordinate supported by the move system.
  Point<int> get maxCoordinates => Point(_room.maxX - 1, _room.maxY - 1);

  /// Returns `true` if [coordinates] are valid coordinates for this [_room].
  bool validCoordinates(final Point<int> coordinates) =>
      coordinates.x >= 0 &&
      coordinates.y >= 0 &&
      coordinates.x <= maxCoordinates.x &&
      coordinates.y <= maxCoordinates.y;

  /// The [_room] surface.
  RoomSurface get _roomSurface => _gamePlayerContext.roomSurface;

  /// The footsteps to use when moving.
  SoundReference? get _footsteps => _gamePlayerContext.footsteps;

  /// The wall sound to use.
  SoundReference? get _wallSound => _gamePlayerContext.wallSound;

  /// The current coordinates of the player.
  Point<int> get coordinates => _gamePlayerContext.gamePlayer.coordinates;

  /// The direction the player is moving in.
  MovingDirection? movingDirection;

  /// Get a sound reference with the given [id].
  ///
  /// If [id] is `null`, then `null` will be returned.
  Future<SoundReference?> getSoundReference(final int? id) async {
    if (id == null) {
      return null;
    }
    return projectContext.database.managers.soundReferences
        .filter(
          (final f) => f.id.equals(id),
        )
        .getSingle();
  }

  /// Get a [Sound] from [soundReference].
  ///
  /// If [soundReference] is `null`, then `null` will be returned.
  Sound? getSound({
    required final SoundReference? soundReference,
    required final bool destroy,
    final bool looping = false,
    final Duration loopingStart = Duration.zero,
    final bool paused = false,
    final SoundPosition position = unpanned,
  }) {
    if (soundReference == null) {
      return null;
    }
    return projectContext.getSound(
      soundReference: soundReference,
      destroy: destroy,
      looping: looping,
      loopingStart: loopingStart,
      paused: paused,
      position: position,
    );
  }

  /// Get nearby objects.
  Future<List<RoomObject>> getNearbyRoomObjects() =>
      ref.read(roomObjectsProvider(_room.id, coordinates).future);

  /// Maybe play [soundReference].
  ///
  /// If [soundReference] is `null`, then nothing will happen.
  Future<SoundHandle?> maybePlaySoundReference({
    required final SoundReference? soundReference,
    required final bool destroy,
    final bool looping = false,
    final Duration loopingStart = Duration.zero,
    final bool paused = false,
    final SoundPosition position = unpanned,
  }) {
    if (mounted) {
      return context.maybePlaySound(
        getSound(
          soundReference: soundReference,
          destroy: destroy,
          looping: looping,
          loopingStart: loopingStart,
          paused: paused,
          position: position,
        ),
      );
    }
    return Future.value();
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final error = _error;
    if (error != null) {
      return Cancel(
        child: ErrorScreen(
          error: error,
          stackTrace: _stackTrace,
        ),
      );
    }
    projectContext = ref.watch(projectContextProvider);
    final fadeIn = project.mainMenuMusicFadeIn;
    final fadeOut = project.mainMenuMusicFadeOut;
    final shortcuts = [
      GameShortcut(
        title: 'Walk north',
        shortcut: GameShortcutsShortcut.keyW,
        onStart: (final innerContext) => startPlayerMoving(
          MovingDirection.forwards,
        ),
        onStop: (final innerContext) => stopPlayerMoving(),
      ),
      GameShortcut(
        title: 'Walk east',
        shortcut: GameShortcutsShortcut.keyD,
        onStart: (final innerContext) => startPlayerMoving(
          MovingDirection.right,
        ),
        onStop: (final innerContext) => stopPlayerMoving(),
      ),
      GameShortcut(
        title: 'Walk south',
        shortcut: GameShortcutsShortcut.keyS,
        onStart: (final innerContext) => startPlayerMoving(
          MovingDirection.backwards,
        ),
        onStop: (final innerContext) => stopPlayerMoving(),
      ),
      GameShortcut(
        title: 'Walk west',
        shortcut: GameShortcutsShortcut.keyA,
        onStart: (final innerContext) => startPlayerMoving(
          MovingDirection.left,
        ),
        onStop: (final innerContext) => stopPlayerMoving(),
      ),
      GameShortcut(
        title: 'Activate nearby object',
        shortcut: GameShortcutsShortcut.enter,
        onStart: (final innerContext) async {
          final objects = await getNearbyRoomObjects();
          if (objects.isEmpty) {
            return;
          }
          stopPlayerMoving();
          if (objects.length > 1) {
            if (innerContext.mounted) {
              await innerContext.pushWidgetBuilder(
                (final _) => SelectObject(
                  objects: objects,
                  onObjectSelect: activateObject,
                ),
              );
            }
          } else {
            await activateObject(objects.single);
          }
        },
      ),
      GameShortcut(
        title: 'Speak coordinates',
        shortcut: GameShortcutsShortcut.keyC,
        onStart: (final innerContext) =>
            innerContext.announce('${coordinates.x}, ${coordinates.y}.'),
      ),
      GameShortcut(
        title: 'Save player',
        shortcut: GameShortcutsShortcut.f4,
        onStart: (final innerContext) {
          _gamePlayerContext.save();
          innerContext.announce('${_player.name} Saved.');
        },
      ),
    ];
    final value = ref.watch(gamePlayerContextProvider(widget.playerId));
    return value.when(
      data: (final gamePlayerContext) {
        _gamePlayerContext = gamePlayerContext;
        return MaybeMusic(
          music: getSound(
            soundReference: _zoneMusic,
            destroy: false,
            looping: true,
          ),
          fadeInTime: fadeIn,
          fadeOutTime: fadeOut,
          builder: (final context) => RoomAmbiances(
            roomId: _room.id,
            error: ErrorScreen.withPositional,
            child: TimedCommands(
              builder: (final context, final state) {
                timedCommandsState = state;
                state.registerCommand(
                  walkPlayer,
                  _roomSurface.moveInterval.milliseconds,
                );
                return SimpleScaffold(
                  title: _room.name,
                  body: GameShortcuts(
                    shortcuts: [
                      ...shortcuts,
                      GameShortcut(
                        title: 'Shortcut help',
                        shortcut: GameShortcutsShortcut.slash,
                        shiftKey: true,
                        onStart: (final innerContext) =>
                            innerContext.fadeMusicAndPushWidget(
                          (final _) => GameShortcutsHelpScreen(
                            shortcuts: shortcuts,
                          ),
                        ),
                      ),
                    ],
                    child: Text(_room.name),
                  ),
                );
              },
            ),
          ),
        );
      },
      error: ErrorScreen.withPositional,
      loading: LoadingScreen.new,
    );
  }

  /// Handle an error.
  void handleError(final Object error, final StackTrace stackTrace) =>
      setState(() {
        _error = error;
        _stackTrace = stackTrace;
      });

  /// Set the player [coordinates].
  void setPlayerCoordinates(final Point<int> destination) {
    _gamePlayerContext.gamePlayer.coordinates = destination;
    SoLoud.instance.set3dListenerPosition(
      destination.x.toDouble(),
      destination.y.toDouble(),
      0.0,
    );
  }

  /// Start player moving.
  void startPlayerMoving(final MovingDirection direction) {
    movingDirection = direction;
    timedCommandsState.startCommand(walkPlayer);
  }

  /// Stop the player moving.
  void stopPlayerMoving() {
    timedCommandsState.stopCommand(walkPlayer);
    movingDirection = null;
  }

  /// Walk the player.
  Future<void> walkPlayer() async {
    final direction = movingDirection;
    if (direction == null) {
      return;
    }
    final newCoordinates = switch (direction) {
      MovingDirection.forwards => coordinates.north,
      MovingDirection.backwards => coordinates.south,
      MovingDirection.left => coordinates.west,
      MovingDirection.right => coordinates.east,
    };
    if (!validCoordinates(newCoordinates)) {
      await maybePlaySoundReference(soundReference: _wallSound, destroy: true);
      return;
    }
    setPlayerCoordinates(newCoordinates);
    await maybePlaySoundReference(soundReference: _footsteps, destroy: true);
  }

  /// Activate the given [object].
  Future<void> activateObject(final RoomObject object) async {
    final exitId = object.roomExitId;
    if (exitId != null) {
      final exit = await ref.read(roomExitProvider(exitId).future);
      await maybePlaySoundReference(
        soundReference: await getSoundReference(exit.useSoundId),
        destroy: true,
      );
      final destinationObject = await ref.read(
        roomObjectProvider(exit.destinationObjectId).future,
      );
      _player
        ..roomId = destinationObject.roomId
        ..x = destinationObject.x
        ..y = destinationObject.y;
      _gamePlayerContext.save();
      stopPlayerMoving();
      setPlayerCoordinates(Point(destinationObject.x, destinationObject.y));
      ref.invalidate(gamePlayerContextProvider(widget.playerId));
    }
  }
}
