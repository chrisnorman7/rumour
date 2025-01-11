import 'package:backstreets_widgets/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

import '../../database/database.dart';
import '../../json/project.dart';
import '../../project_context.dart';

/// The screen to play the given [projectContext].
class PlayProjectScreen extends StatefulWidget {
  /// Create an instance.
  const PlayProjectScreen({
    required this.projectContext,
    super.key,
  });

  /// The project context to play.
  final ProjectContext projectContext;

  /// Create state for this widget.
  @override
  PlayProjectScreenState createState() => PlayProjectScreenState();
}

/// State for [PlayProjectScreen].
class PlayProjectScreenState extends State<PlayProjectScreen> {
  /// The project context to use.
  ProjectContext get projectContext => widget.projectContext;

  /// The project to use.
  Project get project => projectContext.project;

  /// The database to work with.
  AppDatabase get database => projectContext.database;

  /// The managers to use.
  $AppDatabaseManager get managers => database.managers;

  /// The current room to play.
  Room? _room;

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final room = _room;
    if (room == null) {
      final music = project.mainMenuMusic;
      final selectSound = project.menuSelectSound;
      final activateSound = project.menuActivateSound;
      return AudioGameMenu(
        title: project.name,
        menuItems: [
          AudioGameMenuItem(
            title: 'Play game',
            onActivate: (final innerContext) async {
              final rooms = await managers.rooms.get();
              if (mounted) {
                setState(() {
                  _room = rooms.first;
                });
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
    return SimpleScaffold(
      title: room.name,
      body: const Focus(
        autofocus: true,
        child: Text('Works.'),
      ),
    );
  }
}
