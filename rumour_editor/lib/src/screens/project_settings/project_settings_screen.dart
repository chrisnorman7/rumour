import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_text_style_settings/flutter_text_style_settings.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The project settings screen.
class ProjectSettingsScreen extends ConsumerWidget {
  /// Create an instance.
  const ProjectSettingsScreen({super.key});

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final project = ref.watch(projectProvider);
    return Cancel(
      child: TabbedScaffold(
        tabs: [
          const TabbedScaffoldTab(
            title: 'Menus',
            icon: Text('Settings for game menus'),
            child: ProjectMenuSettingsTab(),
          ),
          TabbedScaffoldTab(
            title: 'Text',
            icon: const Text(
              'The font size and other settings for use when playing your game',
            ),
            child: TextStyleSettingsPage(
              project.textStyleSettings,
              onChanged: onChanged,
            ),
          ),
          const TabbedScaffoldTab(
            title: 'Settings',
            icon: Text('Project settings'),
            child: ProjectSettingsTab(),
          ),
        ],
      ),
    );
  }
}
