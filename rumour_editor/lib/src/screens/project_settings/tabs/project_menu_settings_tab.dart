import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The project menu settings tab.
class ProjectMenuSettingsTab extends ConsumerWidget {
  /// Create an instance.
  const ProjectMenuSettingsTab({super.key});

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final project = ref.watch(projectProvider);
    final music = project.mainMenuMusic;
    return ListView(
      shrinkWrap: true,
      children: [
        SerializableSoundReferenceListTile(
          soundReference: music,
          onChanged: (final value) {
            project.mainMenuMusic = value;
            _saveProject(ref, project);
          },
          title: 'Main menu music',
          autofocus: true,
        ),
        DurationListTile(
          duration: project.mainMenuMusicFadeIn ?? Duration.zero,
          onChanged: (final value) {
            project.mainMenuMusicFadeIn = value == Duration.zero ? null : value;
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
          value: project.newPlayerLabel,
          onChanged: (final value) {
            project.newPlayerLabel = value;
            _saveProject(ref, project);
          },
          header: 'New player label',
        ),
        SerializableSoundReferenceListTile(
          soundReference: project.newPlayerEarcon,
          onChanged: (final value) {
            project.newPlayerEarcon = value;
            _saveProject(ref, project);
          },
          title: 'New player earcon',
        ),
        TextListTile(
          value: project.savedPlayersLabel,
          onChanged: (final value) {
            project.savedPlayersLabel = value;
            _saveProject(ref, project);
          },
          header: 'Saved players label',
        ),
        SerializableSoundReferenceListTile(
          soundReference: project.savedPlayersEarcon,
          onChanged: (final value) {
            project.savedPlayersEarcon = value;
            _saveProject(ref, project);
          },
          title: 'Saved players earcon',
        ),
      ],
    );
  }

  /// Invalidate providers.
  void _saveProject(final WidgetRef ref, final Project project) {
    ref.read(projectContextProvider).save(project);
    ref
      ..invalidate(recentFilesProvider)
      ..invalidate(projectProvider);
  }
}
