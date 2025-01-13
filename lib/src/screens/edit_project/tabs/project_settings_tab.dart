import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';
import '../../../json/project.dart';
import '../../../providers.dart';
import '../../../widgets/serializable_sound_reference_list_tile.dart';
import '../../play_project/play_project_screen.dart';

/// The project settings tab.
class ProjectSettingsTab extends ConsumerWidget {
  /// Create an instance.
  const ProjectSettingsTab({
    super.key,
  });

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final project = ref.watch(projectProvider);
    final music = project.mainMenuMusic;
    return CallbackShortcuts(
      bindings: {playShortcut: () => _playProject(ref)},
      child: ListView(
        shrinkWrap: true,
        children: [
          TextListTile(
            value: project.name,
            onChanged: (final value) {
              project.name = value;
              _saveProject(ref, project);
            },
            autofocus: true,
            header: 'Name',
            title: 'Rename Project',
            labelText: 'Project name',
          ),
          ListTile(
            title: const Text('Sounds directory'),
            subtitle: Text(projectContext.soundsDirectory.path),
            onTap: () {
              final uri = Uri.parse(projectContext.soundsDirectory.path);
              launchUrl(uri);
            },
          ),
          SerializableSoundReferenceListTile(
            soundReference: music,
            onChanged: (final value) {
              project.mainMenuMusic = value;
              _saveProject(ref, project);
            },
            title: 'Main menu music',
          ),
          DurationListTile(
            duration: project.mainMenuMusicFadeIn ?? Duration.zero,
            onChanged: (final value) {
              project.mainMenuMusicFadeIn =
                  value == Duration.zero ? null : value;
              _saveProject(ref, project);
            },
            title: 'Music fade in',
          ),
          DurationListTile(
            duration: project.mainMenuMusicFadeOut ?? Duration.zero,
            onChanged: (final value) {
              project.mainMenuMusicFadeOut =
                  value == Duration.zero ? null : value;
              _saveProject(ref, project);
            },
            title: 'Music fade out',
          ),
          SerializableSoundReferenceListTile(
            soundReference: project.menuSelectSound,
            onChanged: (final value) {
              project.menuSelectSound = value;
              _saveProject(ref, project);
            },
            title: 'Menu select sound',
          ),
          SerializableSoundReferenceListTile(
            soundReference: project.menuActivateSound,
            onChanged: (final value) {
              project.menuActivateSound = value;
              _saveProject(ref, project);
            },
            title: 'Menu activate sound',
          ),
          TextListTile(
            value: project.organisationName,
            onChanged: (final value) {
              project.organisationName = value;
              _saveProject(ref, project);
            },
            header: 'Organisation name',
          ),
          TextListTile(
            value: project.appName,
            onChanged: (final value) {
              project.appName = value;
              _saveProject(ref, project);
            },
            header: 'App name',
          ),
        ],
      ),
    );
  }

  /// Play the current project.
  void _playProject(final WidgetRef ref) {
    ref.context.pushWidgetBuilder((final builderContext) {
      builderContext.stopPlaySoundSemantics();
      return const PlayProjectScreen();
    });
  }

  /// Invalidate providers.
  void _saveProject(final WidgetRef ref, final Project project) {
    ref.read(projectContextProvider).save(project);
    ref
      ..invalidate(recentFilesProvider)
      ..invalidate(projectProvider);
  }
}
