import 'package:backstreets_widgets/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

import '../../providers.dart';
import 'new_player_screen.dart';
import 'play_saved_player_screen.dart';

/// The screen to play the given [projectContext].
class PlayProjectScreen extends ConsumerWidget {
  /// Create an instance.
  const PlayProjectScreen({
    super.key,
  });

  /// Build a widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final value = ref.watch(gameOptionsContextProvider);
    return value.when(
      data: (final gameOptionsContext) {
        final project = projectContext.project;
        final music = project.mainMenuMusic;
        final selectSound = project.menuSelectSound;
        final activateSound = project.menuActivateSound;
        return AudioGameMenu(
          title: project.name,
          menuItems: [
            AudioGameMenuItem(
              title: 'Create new player',
              onActivate: (final innerContext) =>
                  innerContext.fadeMusicAndPushWidget(
                (final _) => const NewPlayerScreen(),
              ),
            ),
            if (gameOptionsContext.gameOptions.players.isNotEmpty)
              AudioGameMenuItem(
                title: 'Play saved player',
                onActivate: (final innerContext) =>
                    innerContext.fadeMusicAndPushWidget(
                  (final _) => const PlaySavedPlayerScreen(),
                ),
              ),
          ],
          activateItemSound: activateSound == null
              ? null
              : projectContext.getSound(
                  soundReference: activateSound.getSoundReference(),
                  destroy: true,
                ),
          selectItemSound: selectSound == null
              ? null
              : projectContext.getSound(
                  soundReference: selectSound.getSoundReference(),
                  destroy: false,
                ),
          music: music == null
              ? null
              : projectContext.getSound(
                  soundReference: music.getSoundReference(
                    loadMode: LoadMode.disk,
                  ),
                  destroy: false,
                  looping: true,
                ),
          musicFadeInTime: project.mainMenuMusicFadeIn,
          musicFadeOutTime: project.mainMenuMusicFadeOut,
        );
      },
      error: ErrorScreen.withPositional,
      loading: LoadingScreen.new,
    );
  }
}
