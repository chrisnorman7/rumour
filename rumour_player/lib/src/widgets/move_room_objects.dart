import 'package:backstreets_widgets/typedefs.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_player/rumour_player.dart';
import 'package:time/time.dart';

/// A widget for moving the objects in a room.
class MoveRoomObjects extends ConsumerWidget {
  /// Create an instance.
  const MoveRoomObjects({
    required this.playerId,
    required this.roomId,
    required this.roomObjectStates,
    required this.loading,
    required this.error,
    required this.child,
    super.key,
  });

  /// The ID of the player whose stats will be altered by object movement
  /// commands.
  final String playerId;

  /// The room whose objects will be moved.
  final int roomId;

  /// The room object states to work with.
  final List<RoomObjectState> roomObjectStates;

  /// The function to call to show an error.
  final ErrorWidgetCallback error;

  /// The function to call to show a loading screen.
  final Widget Function() loading;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final soLoud = SoLoud.instance;
    final roomObjectMovementsValue = ref.watch(
      ObjectMovementsInRoomProvider(roomId),
    );
    final roomValue = ref.watch(roomProvider(roomId));
    return roomValue.when(
      data: (final room) {
        final roomSurfaceValue = ref.watch(roomSurfaceProvider(room.surfaceId));
        return roomSurfaceValue.when(
          data: (final surface) => roomObjectMovementsValue.when(
            data: (final movements) {
              final indexes =
                  List<int>.generate(movements.length, (final _) => 0);
              return RandomTasks(
                tasks: [
                  for (var i = 0; i < movements.length; i++)
                    if (movements[i].isNotEmpty)
                      RandomTask(
                        getDuration: () {
                          final index = indexes[i];
                          final movement = movements[i][index];
                          final minDelay = movement.minDelay;
                          final seed =
                              random.nextInt(movement.maxDelay - minDelay) +
                                  minDelay;
                          return seed.milliseconds;
                        },
                        onTick: () {
                          final index = indexes[i];
                          final movement = movements[i][index];
                          final state = roomObjectStates[i];
                          for (var j = 0; j < movement.distance; j++) {
                            state.coordinates = switch (movement.direction) {
                              MovingDirection.forwards =>
                                state.coordinates.north,
                              MovingDirection.backwards =>
                                state.coordinates.south,
                              MovingDirection.left => state.coordinates.west,
                              MovingDirection.right => state.coordinates.east,
                            };
                          }
                          final coordinates = state.coordinates;
                          final ambianceHandle = state.ambianceHandle;
                          final position = coordinates.soundPosition;
                          if (ambianceHandle != null) {
                            soLoud.set3dSourcePosition(
                              ambianceHandle,
                              position.x,
                              position.y,
                              position.z,
                            );
                          }
                          ref
                            ..maybePlaySoundReferenceId(
                              id: surface.footstepSoundId,
                              destroy: true,
                              position: position,
                            )
                            ..maybeRunCommandCaller(
                              commandCallerId: movement.onMoveCommandCallerId,
                              playerId: playerId,
                              position: position,
                            );
                          indexes[i]++;
                          if (indexes[i] >= movements[i].length) {
                            indexes[i] = 0;
                          }
                        },
                      ),
                ],
                child: child,
              );
            },
            error: error,
            loading: loading,
          ),
          error: error,
          loading: loading,
        );
      },
      error: error,
      loading: loading,
    );
  }
}
