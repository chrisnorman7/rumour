import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The room settings tab.
class RoomSettingsTab extends ConsumerWidget {
  /// Create an instance.
  const RoomSettingsTab({required this.roomId, super.key});

  /// The ID of the room to edit.
  final int roomId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final roomsManager = database.managers.rooms;
    final query = roomsManager.filter((final f) => f.id.equals(roomId));
    final value = ref.watch(roomProvider(roomId));
    return value.simpleWhen(
      (final room) => ListView(
        shrinkWrap: true,
        children: [
          TextListTile(
            value: room.name,
            onChanged: (final value) async {
              await query.update((final f) => f(name: Value(value)));
              invalidateProviders(ref);
            },
            header: 'Name',
            autofocus: true,
            labelText: 'Room name',
            title: 'Rename Room',
          ),
          TextListTile(
            value: room.description,
            onChanged: (final value) async {
              await query.update((final f) => f(description: Value(value)));
              invalidateProviders(ref);
            },
            header: 'Description',
            labelText: 'Description',
            title: 'Describe Room',
          ),
          SoundReferenceListTile(
            soundReferenceId: room.ambianceId,
            onChanged: (final id) async {
              await query.update((final f) => f(ambianceId: Value(id)));
              invalidateProviders(ref);
            },
            title: 'Ambiance',
            looping: true,
          ),
          IntListTile(
            value: room.maxX,
            onChanged: (final value) async {
              await query.update((final f) => f(maxX: Value(value)));
              invalidateProviders(ref);
            },
            title: 'Maximum x coordinate',
            min: 1,
          ),
          IntListTile(
            value: room.maxY,
            onChanged: (final value) async {
              await query.update((final f) => f(maxY: Value(value)));
              invalidateProviders(ref);
            },
            title: 'Maximum y coordinate',
            min: 1,
          ),
        ],
      ),
    );
  }

  /// Invalidate providers.
  void invalidateProviders(final WidgetRef ref) =>
      ref
        ..invalidate(roomsProvider)
        ..invalidate(roomProvider(roomId));
}
