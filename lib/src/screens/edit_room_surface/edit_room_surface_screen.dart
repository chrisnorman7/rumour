import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../extensions/async_value_x.dart';
import '../../providers.dart';
import '../../widgets/sound_reference_list_tile.dart';

/// A screen for editing a room surface.
class EditRoomSurfaceScreen extends ConsumerWidget {
  /// Create an instance.
  const EditRoomSurfaceScreen({
    required this.roomSurfaceId,
    super.key,
  });

  /// The ID of the room surface to edit.
  final int roomSurfaceId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final query = projectContext.database.managers.roomSurfaces.filter(
      (final f) => f.id.equals(roomSurfaceId),
    );
    final value = ref.watch(roomSurfaceProvider(roomSurfaceId));
    return Cancel(
      child: SimpleScaffold(
        title: 'Edit Room Surface',
        body: value.simpleWhen(
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
                  await query
                      .update((final f) => f(footstepSoundId: Value(id)));
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
            ],
          ),
        ),
      ),
    );
  }

  /// Invalidate providers.
  void invalidateProviders(final WidgetRef ref) => ref
    ..invalidate(roomSurfacesProvider)
    ..invalidate(roomSurfaceProvider(roomSurfaceId));
}
