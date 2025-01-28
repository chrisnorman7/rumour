import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_player/src/widgets/player_stat_list_tile.dart';

/// The player stats tab.
class PlayerStatsTab extends ConsumerWidget {
  /// Create an instance.
  const PlayerStatsTab({
    required this.playerId,
    super.key,
  });

  /// The ID of the game player context to use.
  final String playerId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(visibleGameStatsProvider);
    return value.simpleWhen(
      (final stats) => ListView.builder(
        itemBuilder: (final context, final index) {
          final stat = stats[index];
          return PlayerStatListTile(
            autofocus: index == 0,
            playerId: playerId,
            gameStatId: stat.id,
          );
        },
        itemCount: stats.length,
        shrinkWrap: true,
      ),
    );
  }
}
