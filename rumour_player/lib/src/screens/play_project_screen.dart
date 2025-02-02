import 'package:backstreets_widgets/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final project = projectContext.project;
    final music = projectContext.maybeGetSound(
      soundReference: project.mainMenuMusic?.getSoundReference(),
      destroy: false,
    );
    final selectSound = projectContext.maybeGetSound(
      soundReference: project.menuSelectSound?.getSoundReference(),
      destroy: false,
    );
    final activateSound = projectContext.maybeGetSound(
      soundReference: project.menuActivateSound?.getSoundReference(),
      destroy: true,
    );
    final newPlayerEarcon = projectContext.maybeGetSound(
      soundReference: project.newPlayerEarcon?.getSoundReference(),
      destroy: false,
    );
    final savedPlayersEarcon = projectContext.maybeGetSound(
      soundReference: project.savedPlayersEarcon?.getSoundReference(),
      destroy: false,
    );
    final value = ref.watch(gamePlayersProvider);
    final textStyle = ref.watch(projectTextStyleProvider);
    return DefaultTextStyle(
      style: textStyle,
      child: value.when(
        data: (final players) => AudioGameMenu(
          title: project.name,
          menuItems: [
            AudioGameMenuItem(
              title: project.newPlayerLabel,
              onActivate: (final innerContext) =>
                  innerContext.fadeMusicAndPushWidget(
                (final _) => const NewPlayerScreen(),
              ),
              earcon: newPlayerEarcon,
            ),
            if (players.isNotEmpty)
              AudioGameMenuItem(
                title: project.savedPlayersLabel,
                onActivate: (final innerContext) =>
                    innerContext.fadeMusicAndPushWidget(
                  (final _) => const PlaySavedPlayerScreen(),
                ),
                earcon: savedPlayersEarcon,
              ),
          ],
          activateItemSound: activateSound,
          selectItemSound: selectSound,
          music: music,
          musicFadeInTime: project.mainMenuMusicFadeIn,
          musicFadeOutTime: project.mainMenuMusicFadeOut,
        ),
        error: ErrorScreen.withPositional,
        loading: LoadingScreen.new,
      ),
    );
  }
}
