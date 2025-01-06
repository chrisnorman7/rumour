import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants.dart';
import '../../../extensions/async_value_x.dart';
import '../../../providers.dart';
import '../../../widgets/nothing_to_see.dart';
import '../../../widgets/play_sound_reference_semantics.dart';
import '../../edit_room_surface/edit_room_surface_screen.dart';

/// The room surfaces tab.
class ProjectRoomSurfacesTab extends ConsumerWidget {
  /// Create an instance.
  const ProjectRoomSurfacesTab({
    super.key,
  });

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final managers = projectContext.database.managers;
    final roomSurfacesManager = managers.roomSurfaces;
    final value = ref.watch(roomSurfacesProvider);
    return value.simpleWhen((final roomSurfaces) {
      if (roomSurfaces.isEmpty) {
        return const NothingToSee(
          message: "You haven't created any room surfaces yet.",
        );
      }
      return ListView.builder(
        itemBuilder: (final context, final index) {
          final roomSurface = roomSurfaces[index];
          final query = roomSurfacesManager.filter(
            (final f) => f.id.equals(roomSurface.id),
          );
          return PlaySoundReferenceSemantics(
            soundReferenceId: roomSurface.footstepSoundId,
            child: Builder(
              builder: (final builderContext) => PerformableActionsListTile(
                actions: [
                  PerformableAction(
                    name: 'Rename',
                    activator: renameShortcut,
                    invoke: () => builderContext.pushWidgetBuilder(
                      (final _) => GetText(
                        onDone: (final value) async {
                          Navigator.pop(builderContext);
                          await query.update(
                            (final f) => f(name: Value(value)),
                          );
                          ref
                            ..invalidate(roomSurfacesProvider)
                            ..invalidate(roomSurfaceProvider(roomSurface.id));
                        },
                        labelText: 'Name',
                        text: roomSurface.name,
                        title: 'Rename Room Surface',
                      ),
                    ),
                  ),
                  PerformableAction(
                    name: 'Delete',
                    activator: deleteShortcut,
                    invoke: () => builderContext.confirm(
                      message:
                          'Really delete the ${roomSurface.name} room surface?',
                      title: confirmDeleteTitle,
                      yesCallback: () async {
                        Navigator.pop(builderContext);
                        final rooms = await managers.rooms
                            .filter(
                              (final f) =>
                                  f.surfaceId.id.equals(roomSurface.id),
                            )
                            .count();
                        if (rooms == 0) {
                          await query.delete();
                          ref.invalidate(roomSurfacesProvider);
                        } else if (builderContext.mounted) {
                          await builderContext.showMessage(
                            message:
                                // ignore: lines_longer_than_80_chars
                                'You cannot delete this room surface because it is being used by $rooms ${rooms == 1 ? "room" : "rooms"}.',
                          );
                        }
                      },
                    ),
                  ),
                ],
                autofocus: index == 0,
                title: Text(roomSurface.name),
                subtitle: Text(roomSurface.description),
                onTap: () => builderContext
                  ..stopPlaySoundSemantics()
                  ..pushWidgetBuilder(
                    (final _) =>
                        EditRoomSurfaceScreen(roomSurfaceId: roomSurface.id),
                  ),
              ),
            ),
          );
        },
        itemCount: roomSurfaces.length,
        shrinkWrap: true,
      );
    });
  }
}
