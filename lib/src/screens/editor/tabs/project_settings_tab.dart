import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../providers.dart';
import '../../../widgets/serializable_sound_reference_list_tile.dart';

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
    return ListView(
      shrinkWrap: true,
      children: [
        TextListTile(
          value: project.name,
          onChanged: (final value) {
            project.name = value;
            projectContext.save(project);
            ref.invalidate(projectProvider);
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
            projectContext.save(project);
            ref
              ..invalidate(projectProvider)
              ..invalidate(recentFilesProvider);
          },
          title: 'Main menu music',
        ),
        DurationListTile(
          duration: project.mainMenuMusicFadeIn ?? Duration.zero,
          onChanged: (final value) {
            project.mainMenuMusicFadeIn = value == Duration.zero ? null : value;
            projectContext.save(project);
            ref.invalidate(projectProvider);
          },
          title: 'Music fade in',
        ),
        DurationListTile(
          duration: project.mainMenuMusicFadeOut ?? Duration.zero,
          onChanged: (final value) {
            project.mainMenuMusicFadeOut =
                value == Duration.zero ? null : value;
            projectContext.save(project);
            ref.invalidate(projectProvider);
          },
          title: 'Music fade out',
        ),
      ],
    );
  }
}
