import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The project quests tab.
class ProjectQuestsTab extends ConsumerWidget {
  /// Create an instance.
  const ProjectQuestsTab({super.key});

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final manager = database.managers.quests;
    final value = ref.watch(questsProvider);
    return value.simpleWhen((final quests) {
      if (quests.isEmpty) {
        return const NothingToSee();
      }
      return ListView.builder(
        itemBuilder: (final context, final index) {
          final quest = quests[index];
          final query = manager.filter((final f) => f.id.equals(quest.id));
          return PerformableActionsListTile(
            autofocus: index == 0,
            actions: [
              RenameAction(
                context: context,
                oldName: quest.name,
                onRename: (final name) async {
                  await query.update((final o) => o(name: Value(name)));
                  ref.invalidate(questsProvider);
                },
                title: 'Rename Quest',
              ),
              DescribeAction(
                context: context,
                oldDescription: quest.description,
                onDescribe: (final description) async {
                  await query.update(
                    (final o) => o(description: Value(description)),
                  );
                  ref.invalidate(questsProvider);
                },
                title: 'Describe Quest',
              ),
              PerformableAction(
                name: 'Delete',
                invoke:
                    () => context.showConfirmMessage(
                      message: 'Really delete ${quest.name}?',
                      title: confirmDeleteTitle,
                      yesCallback: () async {
                        await database.managers.questStages
                            .filter((final f) => f.questId.id.equals(quest.id))
                            .delete();
                        await query.delete();
                        ref.invalidate(questsProvider);
                      },
                    ),
                activator: deleteShortcut,
              ),
            ],
            title: Text(quest.name),
            subtitle: Text(quest.description),
            onTap: () {},
          );
        },
        itemCount: quests.length,
        shrinkWrap: true,
      );
    });
  }
}
