import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// The command game stats tab.
class CommandGameStatsTab extends ConsumerWidget {
  /// Create an instance.
  const CommandGameStatsTab({required this.commandId, super.key});

  /// The ID of the command to edit.
  final int commandId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(gameStatsProvider);
    final database = ref.watch(databaseProvider);
    final manager = database.managers.commandGameStats;
    return value.simpleWhen((final stats) {
      final provider = commandGameStatsProvider(commandId);
      final value = ref.watch(provider);
      return value.simpleWhen(
        (final commandGameStats) => ListView.builder(
          itemBuilder: (final context, final index) {
            final stat = stats[index];
            final commandGameStatIndex = commandGameStats.indexWhere(
              (final e) => e.gameStatId == stat.id,
            );
            final autofocus = index == 0;
            if (commandGameStatIndex == -1) {
              return ListTile(
                autofocus: autofocus,
                title: Text(stat.name),
                subtitle: const Text(unsetMessage),
                onTap: () async {
                  await manager.createReturning(
                    (final o) => o(commandId: commandId, gameStatId: stat.id),
                  );
                  ref.invalidate(provider);
                },
              );
            }
            final commandGameStat = commandGameStats[commandGameStatIndex];
            final query = manager.filter(
              (final f) => f.id.equals(commandGameStat.id),
            );
            return PerformableActionsListTile(
              actions: [
                PerformableAction(
                  name: 'Increase value',
                  invoke: () async {
                    await query.update(
                      (final o) => o(
                        amount: Value(
                          commandGameStat.amount +
                              (commandGameStat.mathematicalOperator ==
                                          MathematicalOperator.divide &&
                                      commandGameStat.amount == -1
                                  ? 2
                                  : 1),
                        ),
                      ),
                    );
                    ref.invalidate(provider);
                  },
                  activator: moveUpShortcut,
                ),
                PerformableAction(
                  name: 'Decrease value',
                  invoke: () async {
                    await query.update(
                      (final o) => o(
                        amount: Value(
                          commandGameStat.amount -
                              (commandGameStat.mathematicalOperator ==
                                          MathematicalOperator.divide &&
                                      commandGameStat.amount == 1
                                  ? 2
                                  : 1),
                        ),
                      ),
                    );
                    ref.invalidate(provider);
                  },
                  activator: moveDownShortcut,
                ),
                ...MathematicalOperator.values.map(
                  (final operator) => PerformableAction(
                    name: operator.name.titleCase,
                    invoke: () async {
                      await query.update(
                        (final o) => o(
                          mathematicalOperator: Value(operator),
                          amount:
                              operator == MathematicalOperator.divide &&
                                      commandGameStat.amount == 0
                                  ? const Value(1)
                                  : const Value.absent(),
                        ),
                      );
                      ref.invalidate(provider);
                    },
                    checked: commandGameStat.mathematicalOperator == operator,
                  ),
                ),
                PerformableAction(
                  name: 'Delete',
                  invoke: () async {
                    await query.delete();
                    ref.invalidate(provider);
                  },
                  activator: deleteShortcut,
                ),
              ],
              autofocus: autofocus,
              title: Text(stat.name),
              subtitle: Text(
                // ignore: lines_longer_than_80_chars
                '${commandGameStat.mathematicalOperator.name.titleCase} ${commandGameStat.amount}',
              ),
              onTap: () {},
            );
          },
          itemCount: stats.length,
          shrinkWrap: true,
        ),
      );
    });
  }
}
