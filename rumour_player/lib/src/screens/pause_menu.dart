import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_player/rumour_player.dart';

/// The pause menu.
class PauseMenu extends ConsumerWidget {
  /// Create an instance.
  const PauseMenu({
    required this.playerId,
    required this.shortcuts,
    super.key,
  });

  /// The ID of the game player context to use.
  final String playerId;

  /// The keyboard shortcuts to show.
  final List<GameShortcut> shortcuts;

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
              child: PauseMenuTab(
                playerId: playerId,
                shortcuts: shortcuts,
              ),
            ),
            TabbedScaffoldTab(
              title: 'Stats',
              icon: const Icon(Icons.insert_chart_outlined),
              child: PlayerStatsTab(playerId: playerId),
            ),
          ],
        ),
      ),
    );
  }
}
