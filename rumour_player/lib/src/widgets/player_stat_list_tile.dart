import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// A [ListTile] which shows a player stat.
class PlayerStatListTile extends ConsumerWidget {
  /// Create an instance.
  const PlayerStatListTile({
    required this.playerId,
    required this.gameStatId,
    this.autofocus = false,
    super.key,
  });

  /// The ID of the player to load.
  final String playerId;

  /// The ID of the game stat to use.
  final int gameStatId;

  /// Whether the [ListTile] should be autofocused.
  final bool autofocus;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(gameStatProvider(gameStatId));
    return value.when(
      data: (final gameStatContext) {
        final gameStat = gameStatContext.gameStat;
        final value = ref.watch(gameStatValueProvider(playerId, gameStatId));
        return value.when(
          data: (final value) {
            final maxValue = value.maxValue;
            return ListTile(
              autofocus: autofocus,
              title: Text(gameStat.name),
              subtitle: Text(
                '${value.value}${maxValue == null ? "" : " / $maxValue"}',
              ),
              onTap: () {},
            );
          },
          error: ErrorListTile.withPositional,
          loading: () => ListTile(
            autofocus: autofocus,
            title: Text(gameStat.name),
            subtitle: const CircularProgressIndicator(
              semanticsLabel: 'Loading...',
            ),
            onTap: () {},
          ),
        );
      },
      error: ErrorListTile.withPositional,
      loading: () => ListTile(
        autofocus: autofocus,
        title: const CircularProgressIndicator(
          semanticsLabel: 'Loading...',
        ),
        onTap: () {},
      ),
    );
  }
}
