import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The room object events tab.
class RoomObjectEventsTab extends ConsumerWidget {
  /// Create an instance.
  const RoomObjectEventsTab({required this.roomObjectId, super.key});

  /// The ID of the object to work with.
  final int roomObjectId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final query = database.managers.roomObjects.filter(
      (final f) => f.id.equals(roomObjectId),
    );
    final provider = roomObjectProvider(roomObjectId);
    final value = ref.watch(provider);
    return value.simpleWhen(
      (final object) => ListView(
        shrinkWrap: true,
        children: [
          PossibleCommandCallerListTile(
            title: 'Player approaches',
            onChanged: (final value) async {
              await query.update(
                (final o) => o(onApproachCommandCallerId: Value(value)),
              );
              ref.invalidate(provider);
            },
            autofocus: true,
            commandCallerId: object.onApproachCommandCallerId,
          ),
          PossibleCommandCallerListTile(
            title: 'Player moves away',
            onChanged: (final value) async {
              await query.update(
                (final o) => o(onLeaveCommandCallerId: Value(value)),
              );
              ref.invalidate(provider);
            },
            commandCallerId: object.onLeaveCommandCallerId,
          ),
        ],
      ),
    );
  }
}
