import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';
import 'package:rumour_editor/src/widgets/game_stat_list_tile.dart';

/// A screen to edit a game stat.
class EditGameStatScreen extends ConsumerWidget {
  /// Create an instance.
  const EditGameStatScreen({required this.gameStatId, super.key});

  /// The ID of the game stat to edit.
  final int gameStatId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final query = projectContext.database.managers.gameStats.filter(
      (final f) => f.id.equals(gameStatId),
    );
    final provider = gameStatProvider(gameStatId);
    final value = ref.watch(provider);
    return Cancel(
      child: SimpleScaffold(
        title: 'Edit Stat',
        body: value.simpleWhen((final gameStatContext) {
          final stat = gameStatContext.gameStat;
          return ListView(
            shrinkWrap: true,
            children: [
              TextListTile(
                value: stat.name,
                onChanged: (final value) async {
                  await query.update((final o) => o(name: Value(value)));
                  invalidateProviders(ref);
                },
                header: 'Name',
                autofocus: true,
              ),
              TextListTile(
                value: stat.description,
                onChanged: (final value) async {
                  await query.update((final o) => o(description: Value(value)));
                  invalidateProviders(ref);
                },
                header: 'Description',
              ),
              IntListTile(
                value: stat.defaultValue,
                onChanged: (final value) async {
                  await query.update(
                    (final o) => o(defaultValue: Value(value)),
                  );
                  ref.invalidate(provider);
                },
                title: 'Default value',
              ),
              CheckboxListTile(
                value: stat.isVisible,
                onChanged: (final value) async {
                  await query.update(
                    (final o) => o(isVisible: Value(!stat.isVisible)),
                  );
                  invalidateProviders(ref);
                },
                title: const Text('Visible in stats menu'),
              ),
              GameStatListTile(
                gameStatId: stat.maxGameStatId,
                title: 'Max value game stat',
                onChanged: (final value) async {
                  await query.update(
                    (final o) => o(maxGameStatId: Value(value?.id)),
                  );
                  invalidateProviders(ref);
                },
              ),
              EnumListTile(
                title: 'Max value mathematical operator',
                values: MathematicalOperator.values,
                onChanged: (final value) async {
                  await query.update(
                    (final o) => o(mathematicalOperator: Value(value!)),
                  );
                  invalidateProviders(ref);
                },
                nullable: false,
                getEnumValueName: (final value) => value!.name.titleCase,
                value: stat.mathematicalOperator,
              ),
              IntListTile(
                value: stat.maxValueMultiplier,
                onChanged: (final value) async {
                  await query.update(
                    (final o) => o(maxValueMultiplier: Value(value)),
                  );
                  invalidateProviders(ref);
                },
                title: 'Max value multiplier',
              ),
            ],
          );
        }),
      ),
    );
  }

  /// Invalidate providers.
  void invalidateProviders(final WidgetRef ref) =>
      ref
        ..invalidate(gameStatsProvider)
        ..invalidate(gameStatProvider(gameStatId));
}
