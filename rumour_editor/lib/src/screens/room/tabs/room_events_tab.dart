import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/src/widgets/possible_command_caller_list_tile.dart';

/// The room events tab.
class RoomEventsTab extends ConsumerWidget {
  /// Create an instance.
  const RoomEventsTab({required this.roomId, super.key});

  /// The ID of the room to edit.
  final int roomId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final query = database.managers.rooms.filter(
      (final f) => f.id.equals(roomId),
    );
    final provider = roomProvider(roomId);
    final value = ref.watch(provider);
    return value.simpleWhen(
      (final room) => ListView(
        shrinkWrap: true,
        children: [
          PossibleCommandCallerListTile(
            title: 'Player enters',
            onChanged: (final value) async {
              await query.update(
                (final o) => o(onEnterCommandCallerId: Value(value)),
              );
              ref.invalidate(provider);
            },
            autofocus: true,
            commandCallerId: room.onEnterCommandCallerId,
          ),
          PossibleCommandCallerListTile(
            title: 'Player exits',
            onChanged: (final value) async {
              await query.update(
                (final o) => o(onExitCommandCallerId: Value(value)),
              );
              ref.invalidate(provider);
            },
            commandCallerId: room.onExitCommandCallerId,
          ),
        ],
      ),
    );
  }
}
