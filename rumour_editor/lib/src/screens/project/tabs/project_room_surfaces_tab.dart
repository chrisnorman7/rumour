import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The room surfaces tab.
class ProjectRoomSurfacesTab extends ConsumerWidget {
  /// Create an instance.
  const ProjectRoomSurfacesTab({super.key});

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
              builder:
                  (final builderContext) => PerformableActionsListTile(
                    actions: [
                      RenameAction(
                        context: builderContext,
                        oldName: roomSurface.name,
                        onRename: (final name) async {
                          await query.update((final o) => o(name: Value(name)));
                          ref
                            ..invalidate(roomSurfacesProvider)
                            ..invalidate(roomSurfaceProvider(roomSurface.id));
                        },
                        title: 'Rename Room Surface',
                      ),
                      DescribeAction(
                        context: builderContext,
                        oldDescription: roomSurface.description,
                        onDescribe: (final description) async {
                          await query.update(
                            (final o) => o(description: Value(description)),
                          );
                          ref
                            ..invalidate(roomSurfacesProvider)
                            ..invalidate(roomSurfaceProvider(roomSurface.id));
                        },
                        title: 'Describe Surface',
                      ),
                      PerformableAction(
                        name: 'Delete',
                        activator: deleteShortcut,
                        invoke:
                            () => builderContext.confirm(
                              message: 'Really delete ${roomSurface.name}?',
                              title: confirmDeleteTitle,
                              yesCallback: () async {
                                Navigator.pop(builderContext);
                                final rooms =
                                    await managers.rooms
                                        .filter(
                                          (final f) => f.surfaceId.id.equals(
                                            roomSurface.id,
                                          ),
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
                    onTap:
                        () =>
                            builderContext
                              ..stopPlaySoundSemantics()
                              ..pushWidgetBuilder(
                                (final _) => EditRoomSurfaceScreen(
                                  roomSurfaceId: roomSurface.id,
                                ),
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
