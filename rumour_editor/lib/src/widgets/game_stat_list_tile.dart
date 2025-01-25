import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// A [ListTile] which allows selecting a new game stat.
class GameStatListTile extends ConsumerWidget {
  /// Create an instance.
  const GameStatListTile({
    required this.gameStatId,
    required this.title,
    required this.onChanged,
    this.autofocus = false,
    super.key,
  });

  /// The ID of the game stat to show.
  final int? gameStatId;

  /// The title of the [ListTile].
  final String title;

  /// The function to call when the game stat changes.
  final ValueChanged<GameStat?> onChanged;

  /// Whether the [ListTile] should be autofocused.
  final bool autofocus;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(gameStatsProvider);
    return value.when(
      data: (final gameStats) {
        final id = gameStatId;
        final gameStat =
            id == null
                ? null
                : gameStats.firstWhere((final stat) => stat.id == id);
        return PerformableActionsBuilder(
          actions:
              gameStats
                  .map(
                    (final stat) => PerformableAction(
                      name: '${stat.name}: ${stat.description}',
                      invoke: () => onChanged(stat),
                      checked: stat.id == id,
                    ),
                  )
                  .toList(),
          builder:
              (final builderContext, final controller) => ListTile(
                autofocus: autofocus,
                title: Text(title),
                subtitle: Text(gameStat?.name ?? unsetMessage),
                onTap: controller.toggle,
              ),
        );
      },
      error: ErrorListTile.withPositional,
      loading:
          () => ListTile(
            autofocus: autofocus,
            title: Text(title),
            subtitle: const CircularProgressIndicator(
              semanticsLabel: 'Loading...',
            ),
            onTap: () {},
          ),
    );
  }
}
