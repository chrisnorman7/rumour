import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The player classes tab.
class ProjectPlayerClassesTab extends ConsumerWidget {
  /// Create an instance.
  const ProjectPlayerClassesTab({super.key});

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final manager = projectContext.database.managers.playerClasses;
    final value = ref.watch(playerClassesProvider);
    return value.simpleWhen(
      (final playerClasses) => ListView.builder(
        itemBuilder: (final context, final index) {
          final playerClass = playerClasses[index];
          final query = manager.filter(
            (final f) => f.id.equals(playerClass.id),
          );
          void invalidateProviders() =>
              ref
                ..invalidate(playerClassesProvider)
                ..invalidate(playerClassProvider(playerClass.id));
          return PerformableActionsListTile(
            actions: [
              RenameAction(
                context: context,
                oldName: playerClass.name,
                onRename: (final name) async {
                  await query.update((final o) => o(name: Value(name)));
                  invalidateProviders();
                },
                title: 'Rename Player Class',
              ),
              DescribeAction(
                context: context,
                oldDescription: playerClass.description,
                onDescribe: (final description) async {
                  await query.update(
                    (final o) => o(description: Value(description)),
                  );
                  invalidateProviders();
                },
                title: 'Describe Player Class',
              ),
              PerformableAction(
                name: 'Set start room',
                invoke:
                    () => context.pushWidgetBuilder(
                      (final _) => SelectRoomScreen(
                        onChanged: (final value) async {
                          await query.update(
                            (final o) => o(roomId: Value(value.id)),
                          );
                          invalidateProviders();
                        },
                      ),
                    ),
                activator: moveShortcut,
              ),
              PerformableAction(
                name: 'Delete',
                invoke:
                    () => context.confirm(
                      message: 'Really delete ${playerClass.name}?',
                      title: confirmDeleteTitle,
                      yesCallback: () async {
                        Navigator.pop(context);
                        await query.delete();
                        ref.invalidate(playerClassesProvider);
                      },
                    ),
                activator: deleteShortcut,
              ),
            ],
            autofocus: index == 0,
            title: Text(playerClass.name),
            subtitle: Text(playerClass.description),
            onTap:
                () => context.pushWidgetBuilder(
                  (final _) =>
                      EditPlayerClassScreen(playerClassId: playerClass.id),
                ),
          );
        },
        itemCount: playerClasses.length,
        shrinkWrap: true,
      ),
    );
  }
}
