import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The game stats tab.
class ProjectGameStatsTab extends ConsumerWidget {
  /// Create an instance.
  const ProjectGameStatsTab({super.key});

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final manager = database.managers.gameStats;
    final value = ref.watch(gameStatsProvider);
    return value.simpleWhen(
      (final stats) => ListView.builder(
        itemBuilder: (final context, final index) {
          final stat = stats[index];
          final query = manager.filter((final f) => f.id.equals(stat.id));
          return PerformableActionsListTile(
            actions: [
              RenameAction(
                context: context,
                oldName: stat.name,
                onRename: (final name) async {
                  await query.update((final o) => o(name: Value(name)));
                  invalidateProviders(ref, stat.id);
                },
                title: 'Rename Stat',
              ),
              DescribeAction(
                context: context,
                oldDescription: stat.description,
                onDescribe: (final description) async {
                  await query.update(
                    (final o) => o(description: Value(description)),
                  );
                  invalidateProviders(ref, stat.id);
                },
                title: 'Describe Stat',
              ),
              PerformableAction(
                name: 'Visible in stats menu',
                invoke: () async {
                  await query.update(
                    (final o) => o(isVisible: Value(!stat.isVisible)),
                  );
                  invalidateProviders(ref, stat.id);
                },
                checked: stat.isVisible,
              ),
              PerformableAction(
                name: 'Delete',
                invoke:
                    () => context.showConfirmMessage(
                      message: 'Really delete ${stat.name}?',
                      title: confirmDeleteTitle,
                      yesCallback: () async {
                        await query.delete();
                        ref.invalidate(gameStatsProvider);
                      },
                    ),
                activator: deleteShortcut,
              ),
            ],
            autofocus: index == 0,
            title: Text(stat.name),
            subtitle: Text(stat.description),
            onTap:
                () => context.pushWidgetBuilder(
                  (_) => EditGameStatScreen(gameStatId: stat.id),
                ),
          );
        },
        itemCount: stats.length,
        shrinkWrap: true,
      ),
    );
  }

  /// Invalidate providers.
  void invalidateProviders(final WidgetRef ref, final int id) =>
      ref
        ..invalidate(gameStatsProvider)
        ..invalidate(gameStatContextProvider(id));
}
