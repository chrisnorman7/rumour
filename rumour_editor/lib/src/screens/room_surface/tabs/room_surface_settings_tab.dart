import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The room surface settings tab.
class RoomSurfaceSettingsTab extends ConsumerWidget {
  /// Create an instance.
  const RoomSurfaceSettingsTab({required this.roomSurfaceId, super.key});

  /// The ID of the room surface to edit.
  final int roomSurfaceId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final query = database.managers.roomSurfaces.filter(
      (final f) => f.id.equals(roomSurfaceId),
    );
    final value = ref.watch(roomSurfaceProvider(roomSurfaceId));
    return value.simpleWhen(
      (final roomSurface) => ListView(
        shrinkWrap: true,
        children: [
          TextListTile(
            value: roomSurface.name,
            onChanged: (final value) async {
              await query.update((final f) => f(name: Value(value)));
              invalidateProviders(ref);
            },
            header: 'Name',
            autofocus: true,
            labelText: 'Name',
            title: 'Rename Room Surface',
          ),
          TextListTile(
            value: roomSurface.description,
            onChanged: (final value) async {
              await query.update((final f) => f(description: Value(value)));
              invalidateProviders(ref);
            },
            header: 'Description',
            labelText: 'Description',
            title: 'Describe Room Surface',
          ),
          SoundReferenceListTile(
            soundReferenceId: roomSurface.footstepSoundId,
            onChanged: (final id) async {
              await query.update((final f) => f(footstepSoundId: Value(id)));
              invalidateProviders(ref);
            },
            title: 'Footsteps',
          ),
          SoundReferenceListTile(
            soundReferenceId: roomSurface.wallSoundI,
            onChanged: (final id) async {
              await query.update((final f) => f(wallSoundI: Value(id)));
              invalidateProviders(ref);
            },
            title: 'Wall Sound',
          ),
          IntListTile(
            value: roomSurface.moveInterval,
            onChanged: (final value) async {
              await query.update((final o) => o(moveInterval: Value(value)));
              invalidateProviders(ref);
            },
            title: 'Move interval',
            min: 100,
            modifier: 10,
            subtitle: '${roomSurface.moveInterval} ms',
          ),
        ],
      ),
    );
  }

  /// Invalidate providers.
  void invalidateProviders(final WidgetRef ref) =>
      ref
        ..invalidate(roomSurfacesProvider)
        ..invalidate(roomSurfaceProvider(roomSurfaceId));
}
