import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The player class game stats tab.
class PlayerClassGameStatsTab extends ConsumerWidget {
  /// Create an instance.
  const PlayerClassGameStatsTab({required this.playerClassId, super.key});

  /// The ID of the player class to use.
  final int playerClassId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final manager = projectContext.database.managers.playerClassGameStats;
    return GameStatsListView(
      itemBuilder: (final context, final index, final stat) {
        final provider = playerClassGameStatProvider(playerClassId, stat.id);
        final value = ref.watch(provider);
        final autofocus = index == 0;
        return value.when(
          data: (final playerClassStat) {
            if (playerClassStat == null) {
              return IntListTile(
                autofocus: autofocus,
                value: stat.defaultValue,
                onChanged: (final value) async {
                  await manager.createReturning(
                    (final o) => o(
                      defaultValue: value,
                      gameStatId: stat.id,
                      playerClassId: playerClassId,
                    ),
                  );
                  ref.invalidate(provider);
                },
                title: stat.name,
                subtitle: '$unsetMessage (${stat.defaultValue})',
              );
            }
            return IntListTile(
              value: playerClassStat.defaultValue,
              onChanged: (final value) async {
                final query = manager.filter(
                  (final f) => f.id.equals(playerClassStat.id),
                );
                if (value == stat.defaultValue) {
                  await query.delete();
                } else {
                  await query.update(
                    (final o) => o(defaultValue: Value(value)),
                  );
                }
                ref.invalidate(provider);
              },
              title: stat.name,
              autofocus: autofocus,
            );
          },
          error: ErrorListTile.withPositional,
          loading:
              () => ListTile(
                autofocus: autofocus,
                title: Text(stat.name),
                subtitle: const CircularProgressIndicator(
                  semanticsLabel: 'Loading...',
                ),
              ),
        );
      },
    );
  }
}
