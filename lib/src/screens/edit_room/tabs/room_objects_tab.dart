import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../extensions/async_value_x.dart';
import '../../../providers.dart';
import '../../../widgets/play_sound_reference_semantics.dart';
import 'room_tile.dart';

/// The room objects tab.
class RoomObjectsTab extends ConsumerWidget {
  /// Create an instance.
  const RoomObjectsTab({
    required this.roomId,
    super.key,
  });

  /// The ID of the room to edit.
  final int roomId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final roomValue = ref.watch(roomProvider(roomId));
    return roomValue.simpleWhen(
      (final room) {
        final roomSurfaceValue = ref.watch(roomSurfaceProvider(room.surfaceId));
        return roomSurfaceValue.simpleWhen(
          (final surface) {
            final columns = room.maxX;
            final rows = room.maxY;
            return FocusTraversalGroup(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                ),
                itemBuilder: (final context, final index) {
                  final x = index % columns;
                  final y = rows - 1 - (index ~/ columns);
                  return PlaySoundReferenceSemantics(
                    soundReferenceId: surface.footstepSoundId,
                    child: Card(
                      elevation: 5.0,
                      child: RoomTile(roomId: roomId, coordinates: Point(x, y)),
                    ),
                  );
                },
                itemCount: rows * columns,
              ),
            );
          },
        );
      },
    );
  }
}
