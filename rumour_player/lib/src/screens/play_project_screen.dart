import 'package:backstreets_widgets/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_player/rumour_player.dart';

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
    final value = ref.watch(gamePlayersProvider);
    return value.when(
      data: (final players) {
        final project = projectContext.project;
        final music = project.mainMenuMusic;
        final selectSound = project.menuSelectSound;
        final activateSound = project.menuActivateSound;
        return AudioGameMenu(
          title: project.name,
          menuItems: [
            AudioGameMenuItem(
              title: project.newPlayerLabel,
              onActivate: (final innerContext) =>
                  innerContext.fadeMusicAndPushWidget(
                (final _) => const NewPlayerScreen(),
              ),
              earcon: projectContext.maybeGetSound(
                soundReference: project.newPlayerEarcon?.getSoundReference(),
                destroy: false,
              ),
            ),
            if (players.isNotEmpty)
              AudioGameMenuItem(
                title: project.savedPlayersLabel,
                onActivate: (final innerContext) =>
                    innerContext.fadeMusicAndPushWidget(
                  (final _) => const PlaySavedPlayerScreen(),
                ),
                earcon: projectContext.maybeGetSound(
                  soundReference:
                      project.savedPlayersEarcon?.getSoundReference(),
                  destroy: false,
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
