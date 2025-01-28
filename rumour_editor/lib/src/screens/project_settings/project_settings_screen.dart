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
  Widget build(final BuildContext context, final WidgetRef ref) => Cancel(
    child: TabbedScaffold(
      tabs: [
        TabbedScaffoldTab(
          title: 'Menus',
          icon: const Text('Settings for game menus'),
          builder: (final context) => const ProjectMenuSettingsTab(),
        ),
        TabbedScaffoldTab(
          title: 'Settings',
          icon: const Text('Project settings'),
          builder: (final context) => const ProjectSettingsTab(),
        ),
      ],
    ),
  );
}
