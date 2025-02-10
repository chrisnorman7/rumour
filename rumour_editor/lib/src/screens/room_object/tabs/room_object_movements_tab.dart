import 'dart:math';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';
import 'package:rumour_editor/src/screens/room_object_movement/edit_room_object_movement.dart';

/// The room object movements tab.
class RoomObjectMovementsTab extends ConsumerWidget {
  /// Create an instance.
  const RoomObjectMovementsTab({required this.roomObjectId, super.key});

  /// The ID of the room object to work with.
  final int roomObjectId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final roomObjectValue = ref.watch(roomObjectProvider(roomObjectId));
    final roomObjectMovementsValue = ref.watch(
      roomObjectMovementsProvider(roomObjectId),
    );
    return roomObjectValue.simpleWhen(
      (final object) => roomObjectMovementsValue.simpleWhen((final movements) {
        if (movements.isEmpty) {
          return const NothingToSee();
        }
        return ListView.builder(
          itemBuilder: (final context, final index) {
            final coordinates = <Point<int>>[object.coordinates];
            final movement = movements[index];
            for (var i = 0; i <= index; i++) {
              final previousMovement = movements[i];
              for (var j = 0; j < previousMovement.distance; j++) {
                final previousCoordinates = coordinates.last;
                final newCoordinates = switch (previousMovement.direction) {
                  MovingDirection.forwards => previousCoordinates.north,
                  MovingDirection.backwards => previousCoordinates.south,
                  MovingDirection.left => previousCoordinates.west,
                  MovingDirection.right => previousCoordinates.east,
                };
                coordinates.add(newCoordinates);
              }
            }
            final query = database.managers.roomObjectMovements.filter(
              (final f) => f.id.equals(movement.id),
            );
            final distance = movement.distance;
            final units = '$distance ${distance.pluralise("unit")}';
            final point = coordinates.last;
            final String pointString;
            if (point == object.coordinates) {
              pointString = 'start';
            } else {
              pointString = '${point.x}, ${point.y}';
            }
            return PerformableActionsListTile(
              autofocus: index == 0,
              actions: [
                PerformableAction(
                  name: 'Increase distance',
                  invoke: () async {
                    await query.update(
                      (final o) => o(distance: Value(distance + 1)),
                    );
                    invalidateProviders(ref, movement.id);
                  },
                  activator: moveUpShortcut,
                ),
                if (distance > 1)
                  PerformableAction(
                    name: 'Decrease distance',
                    invoke: () async {
                      await query.update(
                        (final o) => o(distance: Value(distance - 1)),
                      );
                      invalidateProviders(ref, movement.id);
                    },
                    activator: moveDownShortcut,
                  ),
                for (final direction in MovingDirection.values)
                  PerformableAction(
                    name: direction.name,
                    invoke: () async {
                      await query.update(
                        (final o) => o(direction: Value(direction)),
                      );
                      invalidateProviders(ref, movement.id);
                    },
                    checked: movement.direction == direction,
                  ),
                PerformableAction(
                  name: 'Delete',
                  invoke:
                      () => context.showConfirmMessage(
                        title: confirmDeleteTitle,
                        yesCallback: () async {
                          await query.delete();
                          ref.invalidate(
                            roomObjectMovementsProvider(roomObjectId),
                          );
                        },
                      ),
                  activator: deleteShortcut,
                ),
              ],
              title: Text(movement.direction.name),
              subtitle: Text('$units to $pointString'),
              onTap:
                  () => context.pushWidgetBuilder(
                    (_) => EditRoomObjectMovement(
                      roomObjectMovementId: movement.id,
                    ),
                  ),
            );
          },
          itemCount: movements.length,
          shrinkWrap: true,
        );
      }),
    );
  }

  /// Invalidate providers.
  void invalidateProviders(final WidgetRef ref, final int movementId) =>
      ref
        ..invalidate(roomObjectMovementsProvider(roomObjectId))
        ..invalidate(roomObjectMovementProvider(movementId));
}
