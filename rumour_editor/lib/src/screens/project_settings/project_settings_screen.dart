import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The project settings screen.
class ProjectSettingsScreen extends ConsumerWidget {
  /// Create an instance.
  const ProjectSettingsScreen({super.key});

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) => const Cancel(
    child: TabbedScaffold(
      tabs: [
        TabbedScaffoldTab(
          title: 'Menus',
          icon: Text('Settings for game menus'),
          child: ProjectMenuSettingsTab(),
        ),
        TabbedScaffoldTab(
          title: 'Settings',
          icon: Text('Project settings'),
          child: ProjectSettingsTab(),
        ),
      ],
    ),
  );
}
