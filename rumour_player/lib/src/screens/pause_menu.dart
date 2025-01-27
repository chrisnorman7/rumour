import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_player/rumour_player.dart';
import 'package:rumour_player/src/widgets/pause_menu_tabs/player_stats_tab.dart';

/// The pause menu.
class PauseMenu extends ConsumerWidget {
  /// Create an instance.
  const PauseMenu({
    required this.playerId,
    super.key,
  });

  /// The ID of the game player context to use.
  final String playerId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final project = projectContext.project;
    return Cancel(
      child: MaybeMusic(
        music: projectContext.maybeGetSound(
          soundReference: project.pauseMenuMusic
              ?.getSoundReference(loadMode: LoadMode.disk),
          destroy: false,
          looping: true,
        ),
        fadeInTime: project.mainMenuMusicFadeIn,
        fadeOutTime: project.mainMenuMusicFadeOut,
        builder: (final context) => TabbedScaffold(
          tabs: [
            TabbedScaffoldTab(
              title: project.pauseMenuTitle,
              icon: const Icon(Icons.pause),
              builder: (final _) => PauseMenuTab(playerId: playerId),
            ),
            TabbedScaffoldTab(
              title: 'Stats',
              icon: const Icon(Icons.insert_chart_outlined),
              builder: (final _) => PlayerStatsTab(playerId: playerId),
            ),
          ],
        ),
      ),
    );
  }
}
