import 'dart:math';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:time/time.dart';

import '../../database/database.dart';
import '../../json/project.dart';
import '../../project_context.dart';
import '../../providers.dart';
import 'select_object.dart';

/// A screen to play a given [room].
class PlayRoomScreen extends StatefulWidget {
  /// Create an instance.
  const PlayRoomScreen({
    required this.projectContext,
    required this.room,
    this.initialCoordinates = const Point(0, 0),
    super.key,
  });

  /// The project context to use.
  final ProjectContext projectContext;

  /// The room to play.
  final Room room;

  /// The coordinates to start at.
  final Point<int> initialCoordinates;

  /// Create state for this widget.
  @override
  PlayRoomScreenState createState() => PlayRoomScreenState();
}

/// State for [PlayRoomScreen].
class PlayRoomScreenState extends State<PlayRoomScreen> {
  /// An error object.
  Object? _error;

  /// A stack trace to show.
  StackTrace? _stackTrace;

  /// The timed commands state to use.
  late TimedCommandsState timedCommandsState;

  /// The zone that [room] is part of.
  Zone? _zone;

  /// The [zone] music.
  SoundReference? zoneMusic;

  /// The project context to use.
  ProjectContext get projectContext => widget.projectContext;

  /// The project to work with.
  Project get project => projectContext.project;

  /// The database to work with.
  AppDatabase get database => projectContext.database;

  /// The managers to use.
  $AppDatabaseManager get managers => database.managers;

  /// The objects query to use.
  Future<List<RoomObject>> getNearbyRoomObjects() => managers.roomObjects
      .filter(
        (final f) =>
            f.roomExitId.id.equals(room.id) &
            f.x.equals(coordinates.x) &
            f.y.equals(coordinates.y),
      )
      .orderBy(
        (final o) => o.name.asc(),
      )
      .get();

  /// The room to play.
  late Room room;

  /// The maximum x coordinate supported by the move system.
  Point<int> get maxCoordinates => Point(room.maxX - 1, room.maxY - 1);

  /// Returns `true` if [coordinates] are valid coordinates for this [room].
  bool validCoordinates(final Point<int> coordinates) =>
      coordinates.x >= 0 &&
      coordinates.y >= 0 &&
      coordinates.x <= maxCoordinates.x &&
      coordinates.y <= maxCoordinates.y;

  /// The ambiances for [room].
  late final List<Sound> roomAmbiances;

  /// The [room] surface.
  late RoomSurface roomSurface;

  /// The footsteps to use when moving.
  SoundReference? footsteps;

  /// The wall sound to use.
  SoundReference? wallSound;

  /// The current coordinates of the player.
  late Point<int> coordinates;

  /// The direction the player is moving in.
  MovingDirection? movingDirection;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    room = widget.room;
    roomAmbiances = [];
    setPlayerCoordinates(widget.initialCoordinates);
  }

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
    final zone = _zone;
    if (zone == null) {
      loadThings().onError(handleError);
      return const LoadingScreen();
    }
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
    ];
    return TimedCommands(
      builder: (final context, final state) {
        timedCommandsState = state;
        state.registerCommand(
          walkPlayer,
          roomSurface.moveInterval.milliseconds,
        );
        return MaybeMusic(
          music: getSound(
            soundReference: zoneMusic,
            destroy: false,
            looping: true,
          ),
          fadeInTime: fadeIn,
          fadeOutTime: fadeOut,
          builder: (final context) => AmbiancesBuilder(
            ambiances: roomAmbiances,
            fadeInTime: fadeIn,
            fadeOutTime: fadeOut,
            builder: (final context, final handles) {
              Future<void>.delayed(
                100.milliseconds,
                () => setPlayerCoordinates(coordinates),
              );
              return SimpleScaffold(
                title: room.name,
                body: GameShortcuts(
                  shortcuts: shortcuts,
                  child: const Text('Keyboard area'),
                ),
              );
            },
            error: ErrorScreen.withPositional,
            loading: LoadingScreen.new,
          ),
        );
      },
    );
  }

  /// Handle an error.
  void handleError(final Object error, final StackTrace stackTrace) =>
      setState(() {
        _error = error;
        _stackTrace = stackTrace;
      });

  /// Load the [zone].
  Future<void> loadThings() async {
    final zone = await managers.zones
        .filter(
          (final f) => f.id.equals(room.zoneId),
        )
        .getSingle();
    _zone = zone;
    zoneMusic = await getSoundReference(zone.musicId);
    roomAmbiances.clear();
    final roomAmbianceReference = await getSoundReference(room.ambianceId);
    final roomAmbiance = getSound(
      soundReference: roomAmbianceReference,
      destroy: false,
      looping: true,
    );
    if (roomAmbiance != null) {
      roomAmbiances.add(roomAmbiance);
    }
    final objects = await managers.roomObjects
        .filter(
          (final f) => f.roomId.id.equals(room.id),
        )
        .get();
    for (final object in objects) {
      final objectAmbiance = getSound(
        soundReference: await getSoundReference(object.ambianceId),
        destroy: false,
        looping: true,
        position: SoundPosition3d(
          object.x.toDouble(),
          object.y.toDouble(),
          0.0,
        ),
      );
      if (objectAmbiance != null) {
        roomAmbiances.add(objectAmbiance);
      }
    }
    roomSurface = await managers.roomSurfaces
        .filter(
          (final f) => f.id.equals(room.surfaceId),
        )
        .getSingle();
    footsteps = await getSoundReference(roomSurface.footstepSoundId);
    wallSound = await getSoundReference(roomSurface.wallSoundI);
    if (mounted) {
      setState(() {});
    }
  }

  /// Set the player [coordinates].
  void setPlayerCoordinates(final Point<int> destination) {
    coordinates = destination;
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
      await maybePlaySoundReference(soundReference: wallSound, destroy: true);
      return;
    }
    setPlayerCoordinates(newCoordinates);
    await maybePlaySoundReference(soundReference: footsteps, destroy: true);
  }

  /// Activate the given [object].
  Future<void> activateObject(final RoomObject object) async {
    final exitId = object.roomExitId;
    if (exitId != null) {
      final exit = await managers.roomExits
          .filter((final f) => f.id.equals(exitId))
          .getSingle();
      await maybePlaySoundReference(
        soundReference: await getSoundReference(exit.useSoundId),
        destroy: true,
      );
      final destinationObject = await managers.roomObjects
          .filter((final f) => f.id.equals(exit.destinationObjectId))
          .getSingle();
      room = await managers.rooms
          .filter((final f) => f.id.equals(destinationObject.roomId))
          .getSingle();
      stopPlayerMoving();
      setPlayerCoordinates(Point(destinationObject.x, destinationObject.y));
      if (mounted) {
        setState(() {
          _zone = null;
        });
      }
    }
  }
}
