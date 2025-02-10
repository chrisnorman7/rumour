import 'dart:async';
import 'dart:math';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
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

  /// The ID's of objects which have had their `onApproach` command ran, but not
  /// their `onLeave` one.
  late final List<int> _approachedObjectIds;

  /// The timed commands state to use.
  late TimedCommandsState timedCommandsState;

  /// The project context to use.
  late ProjectContext projectContext;

  /// The project loaded from [projectContext].
  Project get project => projectContext.project;

  /// The database to query.
  AppDatabase get database => projectContext.database;

  /// The game player context to use.
  late GamePlayerContext _gamePlayerContext;

  /// The player to play.
  GamePlayer get _player => _gamePlayerContext.gamePlayer;

  /// The room where the player is.
  Room get _room => _gamePlayerContext.room;

  /// The ambiance handle for [_room].
  SoundHandle? _roomAmbianceHandle;

  /// The states for objects in [_room].
  late final List<RoomObjectState> _roomObjectStates;

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
  Future<List<RoomObject>> _getNearbyRoomObjects() =>
      ref.read(roomObjectsProvider(_room.id, coordinates).future);

  /// Get visible objects in this room.
  Future<List<RoomObject>> _getVisibleObjects() async {
    final objects = await database.managers.roomObjects
        .filter(
          (final f) => f.roomId.id.equals(_room.id) & f.visible.equals(true),
        )
        .get();
    objects.sort(
      (final a, final b) {
        final distanceComparison = a.coordinates
            .distanceTo(coordinates)
            .compareTo(b.coordinates.distanceTo(coordinates));
        if (distanceComparison == 0) {
          // They are the same. Compare by name instead.
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        }
        return distanceComparison;
      },
    );
    return objects;
  }

  /// The ID of the last object which was examined.
  int? _lastExaminedObjectIndex;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    _firstLoad = true;
    _paused = false;
    _roomObjectStates = [];
    _approachedObjectIds = [];
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
    final project = projectContext.project;
    final value = ref.watch(gamePlayerContextProvider(widget.playerId));
    return value.when(
      data: (final gamePlayerContext) {
        _gamePlayerContext = gamePlayerContext;
        if (_firstLoad) {
          setPlayerCoordinates(gamePlayerContext.gamePlayer.coordinates);
        }
        return PlayerContextSounds(
          gamePlayerContext: _gamePlayerContext,
          getPaused: () => _paused,
          error: ErrorScreen.withPositional,
          loading: LoadingScreen.new,
          builder: (
            final builderContext,
            final roomAmbianceHandle,
            final roomObjectStates,
          ) {
            _roomAmbianceHandle = roomAmbianceHandle;
            _roomObjectStates.clear();
            roomObjectStates.forEach(_roomObjectStates.add);
            return TimedCommands(
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
                          onStart: (final innerContext) => switchObjects(
                            TurningDirection.left,
                          ),
                        ),
                        TouchSurfaceBuilderCommand(
                          title: 'Examine next command',
                          shortcut: GameShortcutsShortcut.bracketRight,
                          onStart: (final innerContext) => switchObjects(
                            TurningDirection.right,
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
                            final objects = await _getNearbyRoomObjects();
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
            );
          },
          key: ValueKey(widget.playerId),
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
      await ref.maybePlaySoundReference(
        soundReference: _wallSound,
        destroy: true,
      );
      return;
    }
    final objects = await ref.read(objectsInRoomProvider(_room.id).future);
    final nearby = <RoomObject>[];
    final distant = <RoomObject>[];
    for (final object in objects) {
      if (object.isNearby(coordinates)) {
        nearby.add(object);
      } else {
        distant.add(object);
      }
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
    setPlayerCoordinates(newCoordinates);
    await ref.maybePlaySoundReference(
      soundReference: _footsteps,
      destroy: true,
    );
    for (final object in nearby) {
      if (!object.isNearby(newCoordinates)) {
        // `object` is no longer nearby.
        if (_approachedObjectIds.contains(object.id)) {
          _approachedObjectIds.remove(object.id);
        }
        unawaited(ref.maybeRunCommandCaller(object.onLeaveCommandCallerId));
      }
    }
    for (final object in distant) {
      if (object.isNearby(newCoordinates)) {
        // `object` is no longer distant.
        _approachedObjectIds.add(object.id);
        unawaited(ref.maybeRunCommandCaller(object.onApproachCommandCallerId));
      }
    }
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
          performAction: () => handleRoomExit(exit),
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

  /// Move the player through [exit].
  FutureOr<void> handleRoomExit(final RoomExit exit) async {
    await ref.maybePlaySoundReferenceId(
      id: exit.useSoundId,
      destroy: true,
    );
    final destinationRoom = await ref.read(
      roomProvider(exit.roomId).future,
    );
    if (exit.roomId != _room.id) {
      unawaited(ref.maybeRunCommandCaller(_room.onExitCommandCallerId));
      unawaited(
        ref.maybeRunCommandCaller(destinationRoom.onEnterCommandCallerId),
      );
    } else {
      unawaited(ref.maybeRunCommandCaller(_room.onTeleportCommandCallerId));
    }
    _player.roomId = destinationRoom.id;
    _gamePlayerContext.save();
    stopPlayerMoving();
    _roomAmbianceHandle = null;
    _roomObjectStates.clear();
    _approachedObjectIds.clear();
    setPlayerCoordinates(exit.coordinates);
    ref.invalidate(gamePlayerContextProvider(widget.playerId));
  }

  /// Pause the game and push a widget [builder] on [innerContext].
  Future<void> pauseGameAndPushWidgetBuilder(
    final BuildContext innerContext,
    final WidgetBuilder builder,
  ) async {
    final fadeOut = project.mainMenuMusicFadeOut;
    final roomAmbianceHandle = _roomAmbianceHandle;
    if (roomAmbianceHandle != null) {
      roomAmbianceHandle.maybeFade(fadeTime: fadeOut, to: 0.0);
    }
    for (final roomObjectState in _roomObjectStates) {
      final handle = roomObjectState.ambianceHandle;
      if (handle != null) {
        handle.maybeFade(fadeTime: fadeOut, to: 0.0);
      }
    }
    _paused = true;
    await innerContext.fadeMusicAndPushWidget(
      builder,
      restartMusic: false,
    );
    final fadeIn = project.mainMenuMusicFadeIn;
    final roomAmbiance = _gamePlayerContext.roomAmbiance;
    if (roomAmbianceHandle != null) {
      roomAmbianceHandle.maybeFade(
        fadeTime: fadeIn,
        to: roomAmbiance!.volume,
      );
    }
    for (final roomObjectState in _roomObjectStates) {
      final volume = roomObjectState.ambiance?.volume;
      if (volume != null) {
        roomObjectState.ambianceHandle!.maybeFade(fadeTime: fadeIn, to: volume);
      }
    }
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

  /// Examine an object.
  Future<void> examineObject(final RoomObject object) async {
    _lastExaminedObjectIndex = object.id;
    final string = projectContext.renderString(
      rumourTemplate: RumourTemplate.roomObjectTemplate,
      string: project.examineRoomObjectFormat,
      value: RoomObjectLocation(
        roomObject: object,
        playerCoordinates: coordinates,
      ),
    );
    context.announce(string);
    await ref.maybePlaySoundReference(
      soundReference:
          await projectContext.maybeGetSoundReference(object.earconId),
      destroy: true,
    );
  }

  /// Switch to the next object in [direction].
  Future<void> switchObjects(final TurningDirection direction) async {
    final objects = await _getVisibleObjects();
    if (objects.isEmpty) {
      return;
    }
    final oldId = _lastExaminedObjectIndex;
    if (oldId == null) {
      switch (direction) {
        case TurningDirection.left:
          return examineObject(objects.last);
        case TurningDirection.right:
          return examineObject(objects.first);
      }
    }
    for (var i = 0; i < objects.length; i++) {
      final object = objects[i];
      if (object.id == oldId) {
        switch (direction) {
          case TurningDirection.left:
            if (i == 0) {
              return examineObject(objects.last);
            } else {
              return examineObject(objects[i - 1]);
            }
          case TurningDirection.right:
            if (i + 1 == objects.length) {
              return examineObject(objects.first);
            } else {
              return examineObject(objects[i + 1]);
            }
        }
      }
    }
    if (mounted) {
      context.announce(
        'There is an error in `switchObjects` which should be reported.',
      );
    }
  }
}
