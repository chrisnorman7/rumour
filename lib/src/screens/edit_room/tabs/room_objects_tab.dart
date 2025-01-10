import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../extensions/async_value_x.dart';
import '../../../providers.dart';
import '../../../widgets/play_sound_reference_semantics.dart';
import 'room_tile.dart';

/// The room objects tab.
class RoomObjectsTab extends ConsumerStatefulWidget {
  /// Create an instance.
  const RoomObjectsTab({
    required this.roomId,
    super.key,
  });

  /// The ID of the room to use.
  final int roomId;

  /// Create state for this widget.
  @override
  RoomObjectsTabState createState() => RoomObjectsTabState();
}

/// State for [RoomObjectsTab].
class RoomObjectsTabState extends ConsumerState<RoomObjectsTab> {
  /// Initialise state.
  @override
  void initState() {
    super.initState();
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final roomValue = ref.watch(roomProvider(widget.roomId));
    return roomValue.simpleWhen(
      (final room) {
        final roomSurfaceValue = ref.watch(roomSurfaceProvider(room.surfaceId));
        return roomSurfaceValue.simpleWhen(
          (final surface) {
            final columns = room.maxX;
            final rows = room.maxY;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
              ),
              itemBuilder: (final context, final index) {
                final x = index % columns;
                final y = index ~/ columns;
                return PlaySoundReferenceSemantics(
                  soundReferenceId: surface.footstepSoundId,
                  child: Card(
                    margin: const EdgeInsets.all(4.0),
                    elevation: 2.0,
                    child: RoomTile(
                      autofocus: index == 0,
                      roomId: widget.roomId,
                      coordinates: Point(x, y),
                    ),
                  ),
                );
              },
              itemCount: rows * columns,
              reverse: true,
            );
          },
        );
      },
    );
  }
}
