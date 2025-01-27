import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// A [ListView] which builds with game stats.
class GameStatsListView extends ConsumerWidget {
  /// Create an instance.
  const GameStatsListView({required this.itemBuilder, super.key});

  /// A function to build a [ListTile].
  final Widget Function(BuildContext context, int index, GameStat stat)
  itemBuilder;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(gameStatsProvider);
    return value.simpleWhen(
      (final stats) => ListView.builder(
        itemBuilder:
            (final context, final index) =>
                itemBuilder(context, index, stats[index]),
        itemCount: stats.length,
        shrinkWrap: true,
      ),
    );
  }
}
