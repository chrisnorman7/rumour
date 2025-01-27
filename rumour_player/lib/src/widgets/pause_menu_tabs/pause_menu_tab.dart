import 'package:backstreets_widgets/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_player/rumour_player.dart';

/// The pause menu tab.
class PauseMenuTab extends ConsumerWidget {
  /// Create an instance.
  const PauseMenuTab({
    required this.playerId,
    super.key,
  });

  /// The game player context to use.
  final String playerId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(gamePlayerContextProvider(playerId));
    return value.simpleWhen(
      (final gamePlayerContext) => AudioGameMenuListView(
        menuItems: [
          AudioGameMenuItem(
            title: 'Save player',
            onActivate: (final innerContext) {
              gamePlayerContext.save();
              innerContext.announce('Saved.');
            },
          ),
          const AudioGameMenuItem(
            title: 'Return to game',
            onActivate: Navigator.pop,
          ),
          AudioGameMenuItem(
            title: 'Exit game',
            onActivate: (final innerContext) {
              for (var i = 0; i < 3; i++) {
                Navigator.pop(innerContext);
              }
            },
          ),
        ],
      ),
    );
  }
}
