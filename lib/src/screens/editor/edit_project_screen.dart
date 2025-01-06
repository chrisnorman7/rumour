import 'package:backstreets_widgets/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/close_project.dart';
import 'tabs/project_settings_tab.dart';
import 'tabs/zones_tab.dart';

/// Edit a project context.
class EditProjectScreen extends ConsumerWidget {
  /// Create an instance.
  const EditProjectScreen({
    super.key,
  });

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) => CloseProject(
        child: TabbedScaffold(
          tabs: [
            TabbedScaffoldTab(
              title: 'Settings',
              icon: const Text('Project settings'),
              builder: (final _) => const ProjectSettingsTab(),
            ),
            TabbedScaffoldTab(
              title: 'Zones',
              icon: const Text('Share settings between multiple rooms'),
              builder: (final _) => const ZonesTab(),
            ),
          ],
        ),
      );
}
