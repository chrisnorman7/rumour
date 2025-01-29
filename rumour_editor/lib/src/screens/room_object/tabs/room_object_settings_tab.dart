import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The room object settings tab.
class RoomObjectSettingsTab extends ConsumerWidget {
  /// Create an instance.
  const RoomObjectSettingsTab({required this.roomObjectId, super.key});

  /// The ID of the object to edit.
  final int roomObjectId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final query = database.managers.roomObjects.filter(
      (final f) => f.id.equals(roomObjectId),
    );
    final value = ref.watch(roomObjectProvider(roomObjectId));
    return value.simpleWhen(
      (final object) => ListView(
        shrinkWrap: true,
        children: [
          TextListTile(
            value: object.name,
            onChanged: (final name) async {
              await query.update((final o) => o(name: Value(name)));
              invalidateProviders(ref, object);
            },
            header: 'Name',
            autofocus: true,
            labelText: 'Object name',
            title: 'Rename Object',
          ),
          TextListTile(
            value: object.description,
            onChanged: (final description) async {
              await query.update(
                (final o) => o(description: Value(description)),
              );
              invalidateProviders(ref, object);
            },
            header: 'Description',
            labelText: 'Object description',
            title: 'Describe Object',
          ),
          SoundReferenceListTile(
            soundReferenceId: object.ambianceId,
            onChanged: (final value) async {
              await query.update((final o) => o(ambianceId: Value(value)));
              invalidateProviders(ref, object);
            },
            title: 'Ambiance',
            looping: true,
          ),
        ],
      ),
    );
  }

  /// Invalidate providers.
  void invalidateProviders(final WidgetRef ref, final RoomObject object) =>
      ref
        ..invalidate(roomObjectsProvider(object.roomId, object.coordinates))
        ..invalidate(roomObjectProvider(roomObjectId));
}
