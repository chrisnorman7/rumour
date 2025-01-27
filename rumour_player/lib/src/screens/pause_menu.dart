import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_player/src/widgets/audio_game_menu_list_view.dart';

/// The pause menu.
class PauseMenu extends ConsumerWidget {
  /// Create an instance.
  const PauseMenu({
    super.key,
  });

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
        builder: (final context) => SimpleScaffold(
          title: project.pauseMenuTitle,
          body: const AudioGameMenuListView(
            menuItems: [
              AudioGameMenuItem(
                title: 'Return to game',
                onActivate: Navigator.pop,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
