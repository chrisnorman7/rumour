import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

import '../../project_context.dart';
import 'play_room_screen.dart';

/// The screen to play the given [projectContext].
class PlayProjectScreen extends StatelessWidget {
  /// Create an instance.
  const PlayProjectScreen({
    required this.projectContext,
    super.key,
  });

  /// The project context to play.
  final ProjectContext projectContext;

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final project = projectContext.project;
    final music = project.mainMenuMusic;
    final selectSound = project.menuSelectSound;
    final activateSound = project.menuActivateSound;
    return AudioGameMenu(
      title: project.name,
      menuItems: [
        AudioGameMenuItem(
          title: 'Play game',
          onActivate: (final innerContext) async {
            final rooms = await projectContext.database.managers.rooms.get();
            if (innerContext.mounted) {
              await innerContext.fadeMusicAndPushWidget(
                (final _) => PlayRoomScreen(
                  projectContext: projectContext,
                  room: rooms.first,
                ),
              );
            }
          },
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
  }
}
