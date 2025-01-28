import 'dart:math';

import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// A widget to edit a room exit.
class EditRoomExitScreen extends ConsumerWidget {
  /// Create an instance.
  const EditRoomExitScreen({required this.roomExitId, super.key});

  /// The ID of the room exit to edit.
  final int roomExitId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final query = database.managers.roomExits.filter(
      (final f) => f.id.equals(roomExitId),
    );
    final provider = roomExitProvider(roomExitId);
    final roomObjectValue = ref.watch(provider);
    return Cancel(
      child: SimpleScaffold(
        title: 'Edit Exit',
        body: roomObjectValue.simpleWhen((final roomExit) {
          final destinationRoomValue = ref.watch(roomProvider(roomExit.roomId));
          return destinationRoomValue.simpleWhen(
            (final room) => ListView(
              shrinkWrap: true,
              children: [
                SoundReferenceListTile(
                  soundReferenceId: roomExit.useSoundId,
                  onChanged: (final value) async {
                    await query.update(
                      (final o) => o(useSoundId: Value(value)),
                    );
                    ref.invalidate(provider);
                  },
                  title: 'Use sound',
                  autofocus: true,
                ),
                RoomListTile(
                  roomId: roomExit.roomId,
                  onChanged: (final value) async {
                    await query.update((final o) => o(roomId: Value(value.id)));
                    ref.invalidate(provider);
                  },
                  title: 'Destination room',
                ),
                PointListTile(
                  point: Point(roomExit.x, roomExit.y),
                  onChanged: (final point) async {
                    await query.update(
                      (final o) => o(x: Value(point.x), y: Value(point.y)),
                    );
                    ref.invalidate(provider);
                  },
                  title: 'Destination coordinates',
                  max: Point(room.maxX, room.maxY),
                  min: const Point(0, 0),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
