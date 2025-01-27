import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:url_launcher/url_launcher.dart';

/// The project settings tab.
class ProjectSettingsTab extends ConsumerWidget {
  /// Create an instance.
  const ProjectSettingsTab({super.key});

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final project = ref.watch(projectProvider);
    return ListView(
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
        IntListTile(
          value: project.pauseSoundsVolumeReduction,
          onChanged: (final value) {
            project.pauseSoundsVolumeReduction = value;
            _saveProject(ref, project);
          },
          title: 'Pause menu sound volume reduction',
          min: 1,
        ),
        TextListTile(
          value: project.pauseMenuTitle,
          onChanged: (final value) {
            project.pauseMenuTitle = value;
            _saveProject(ref, project);
          },
          header: 'Pause menu title',
        ),
        ListTile(
          title: const Text('Sounds directory'),
          subtitle: Text(projectContext.soundsDirectory.path),
          onTap: () {
            final uri = Uri.parse(projectContext.soundsDirectory.path);
            launchUrl(uri);
          },
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
