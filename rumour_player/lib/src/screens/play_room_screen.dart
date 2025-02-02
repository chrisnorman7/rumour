import 'dart:math';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_audio_games/touch.dart';
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
  /// Whether this is the first load.
  late bool _firstLoad;

  /// Whether the game is paused.
  late bool _paused;

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

  /// Get nearby objects.
  Future<List<RoomObject>> getNearbyRoomObjects() =>
      ref.read(roomObjectsProvider(_room.id, coordinates).future);

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    _firstLoad = true;
    _paused = false;
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    movingDirection = null;
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
    final project = projectContext.project;
    final value = ref.watch(gamePlayerContextProvider(widget.playerId));
    return value.when(
      data: (final gamePlayerContext) {
        _gamePlayerContext = gamePlayerContext;
        if (_firstLoad) {
          setPlayerCoordinates(gamePlayerContext.gamePlayer.coordinates);
        }
        return PlayerContextSounds(
          playerId: widget.playerId,
          getPaused: () => _paused,
          error: ErrorScreen.withPositional,
          loading: LoadingScreen.new,
          builder: (final context) => TimedCommands(
            builder: (final context, final state) {
              timedCommandsState = state;
              state.registerCommand(
                walkPlayer,
                _roomSurface.moveInterval.milliseconds,
              );
              return Semantics(
                label: project.name,
                child: TouchSurfaceBuilder(
                  commands: [
                    [
                      TouchSurfaceBuilderCommand(
                        title: 'Walk north',
                        shortcut: GameShortcutsShortcut.keyW,
                        onStart: (final innerContext) => startPlayerMoving(
                          MovingDirection.forwards,
                        ),
                        onStop: (final innerContext) => stopPlayerMoving(),
                      ),
                      TouchSurfaceBuilderCommand(
                        title: 'Examine previous object',
                        shortcut: GameShortcutsShortcut.bracketLeft,
                        onStart: (final innerContext) => innerContext.announce(
                          'Previous object.',
                        ),
                      ),
                      TouchSurfaceBuilderCommand(
                        title: 'Examine next command',
                        shortcut: GameShortcutsShortcut.bracketRight,
                        onStart: (final innerContext) => innerContext.announce(
                          'Next object.',
                        ),
                      ),
                      TouchSurfaceBuilderCommand(
                        title: 'Pause menu',
                        shortcut: GameShortcutsShortcut.escape,
                        onStart: (final innerContext) async {
                          if (innerContext.mounted) {
                            final shortcuts = innerContext
                                    .dependOnInheritedWidgetOfExactType<
                                        InheritedGameShortcuts>()
                                    ?.shortcuts ??
                                [];
                            await pauseGameAndPushWidgetBuilder(
                              innerContext,
                              (final _) => PauseMenu(
                                playerId: widget.playerId,
                                shortcuts: shortcuts,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                    [
                      TouchSurfaceBuilderCommand(
                        title: 'Walk south',
                        shortcut: GameShortcutsShortcut.keyS,
                        onStart: (final innerContext) => startPlayerMoving(
                          MovingDirection.backwards,
                        ),
                        onStop: (final innerContext) => stopPlayerMoving(),
                      ),
                      TouchSurfaceBuilderCommand(
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
                                  onObjectSelect: (final object) =>
                                      _activateObject(innerContext, object),
                                ),
                              );
                            }
                          } else {
                            if (innerContext.mounted) {
                              await _activateObject(
                                innerContext,
                                objects.single,
                              );
                            }
                          }
                        },
                      ),
                      TouchSurfaceBuilderCommand(
                        title: 'Walk west',
                        shortcut: GameShortcutsShortcut.keyA,
                        onStart: (final innerContext) => startPlayerMoving(
                          MovingDirection.left,
                        ),
                        onStop: (final innerContext) => stopPlayerMoving(),
                      ),
                      TouchSurfaceBuilderCommand(
                        title: 'Walk east',
                        shortcut: GameShortcutsShortcut.keyD,
                        onStart: (final innerContext) => startPlayerMoving(
                          MovingDirection.right,
                        ),
                        onStop: (final innerContext) => stopPlayerMoving(),
                      ),
                    ],
                  ],
                  extraShortcuts: [
                    GameShortcut(
                      title: 'Speak coordinates',
                      shortcut: GameShortcutsShortcut.keyC,
                      onStart: (final innerContext) => innerContext.announce(
                        '${coordinates.x}, ${coordinates.y}',
                      ),
                    ),
                    GameShortcut(
                      title: 'Speak room name',
                      shortcut: GameShortcutsShortcut.keyR,
                      onStart: (final innerContext) => innerContext.announce(
                        _room.name,
                      ),
                    ),
                    GameShortcut(
                      title: 'Shortcut help',
                      shortcut: GameShortcutsShortcut.slash,
                      shiftKey: true,
                      onStart: (final innerContext) {
                        final shortcuts = innerContext
                                .dependOnInheritedWidgetOfExactType<
                                    InheritedGameShortcuts>()
                                ?.shortcuts ??
                            [];
                        innerContext.fadeMusicAndPushWidget(
                          (final _) => GameShortcutsHelpScreen(
                            shortcuts: shortcuts,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
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
    final costs = await ref.read(
      roomSurfaceCostsProvider(_roomSurface.id).future,
    );
    final alteredStats = <int, int>{};
    for (final cost in costs) {
      final stat = await ref.read(
        gamePlayerStatProvider(widget.playerId, cost.gameStatId).future,
      );
      if (cost.surfaceCost > 0 && stat < cost.surfaceCost) {
        await ref.maybePlaySoundReference(
          soundReference: await projectContext.maybeGetSoundReference(
            cost.exhaustedSoundId,
          ),
          destroy: true,
        );
        stopPlayerMoving();
        return;
      }
      alteredStats[cost.gameStatId] = stat - cost.surfaceCost;
    }
    final stats = await ref.read(
      gamePlayerStatsProvider(widget.playerId).future,
    );
    for (final MapEntry(key: gameStatId, value: value)
        in alteredStats.entries) {
      stats[gameStatId] = value;
    }
    final newCoordinates = switch (direction) {
      MovingDirection.forwards => coordinates.north,
      MovingDirection.backwards => coordinates.south,
      MovingDirection.left => coordinates.west,
      MovingDirection.right => coordinates.east,
    };
    if (!validCoordinates(newCoordinates)) {
      await ref.maybePlaySoundReference(
        soundReference: _wallSound,
        destroy: true,
      );
      return;
    }
    setPlayerCoordinates(newCoordinates);
    await ref.maybePlaySoundReference(
      soundReference: _footsteps,
      destroy: true,
    );
  }

  /// Provide a list of player actions which can be performed on a room object.
  Future<List<PlayerAction>> getRoomObjectPlayerActions(
    final RoomObject roomObject,
  ) async {
    final roomExitId = roomObject.roomExitId;
    final exit = roomExitId == null
        ? null
        : await ref.read(roomExitProvider(roomExitId).future);
    final commands = await ref.read(
      roomObjectCommandCallersProvider(roomObject.id).future,
    );
    return <PlayerAction>[
      if (exit != null)
        PlayerAction(
          name: exit.label,
          performAction: () async {
            await ref.maybePlaySoundReference(
              soundReference:
                  await projectContext.maybeGetSoundReference(exit.useSoundId),
              destroy: true,
            );
            final destinationRoom = await ref.read(
              roomProvider(exit.roomId).future,
            );
            _player
              ..roomId = destinationRoom.id
              ..x = exit.x
              ..y = exit.y;
            stopPlayerMoving();
            setPlayerCoordinates(exit.coordinates);
            ref.invalidate(gamePlayerContextProvider(widget.playerId));
          },
          earcon: await projectContext.maybeGetSoundFromSoundReferenceId(
            id: exit.earconId,
            destroy: false,
          ),
        ),
      for (final command in commands)
        PlayerAction(
          name: command.name,
          performAction: () => ref.runCommandCaller(
            command.commandCallerId,
          ),
          earcon: await projectContext.maybeGetSoundFromSoundReferenceId(
            id: command.earconId,
            destroy: false,
          ),
        ),
    ];
  }

  /// Pause the game and push a widget [builder] on [innerContext].
  Future<void> pauseGameAndPushWidgetBuilder(
    final BuildContext innerContext,
    final WidgetBuilder builder,
  ) async {
    final state = innerContext.findAncestorStateOfType<RoomAmbiancesState>();
    _paused = true;
    state?.fadeOut();
    await innerContext.fadeMusicAndPushWidget(
      builder,
      restartMusic: false,
    );
    state?.fadeIn();
    _paused = false;
  }

  /// Activate the given [object].
  Future<void> _activateObject(
    final BuildContext innerContext,
    final RoomObject object,
  ) async {
    final actions = await getRoomObjectPlayerActions(object);
    if (actions.isEmpty) {
      return;
    }
    if (actions.length == 1) {
      return actions.single.performAction();
    }
    if (innerContext.mounted) {
      return innerContext.pushWidgetBuilder(
        (final _) =>
            PlayerActionsScreen(title: object.name, playerActions: actions),
      );
    }
  }
}
