import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers.dart';
import '../../widgets/close_project.dart';
import '../edit_zone/edit_zone_screen.dart';
import 'tabs/project_settings_tab.dart';
import 'tabs/project_zones_tab.dart';

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
              builder: (final _) => CommonShortcuts(
                newCallback: () => _createZone(ref),
                child: const ProjectZonesTab(),
              ),
              floatingActionButton: NewButton(
                onPressed: () => _createZone(ref),
                tooltip: 'New zone',
              ),
            ),
          ],
        ),
      );

  /// Create a new zone.
  Future<void> _createZone(final WidgetRef ref) async {
    final projectContext = ref.read(projectContextProvider);
    final zone = await projectContext.database.managers.zones.createReturning(
      (final f) => f(
        name: 'Untitled Zone',
        description: 'This is a new zone.',
      ),
    );
    ref.invalidate(zonesProvider);
    final context = ref.context;
    if (context.mounted) {
      await context
          .pushWidgetBuilder((final _) => EditZoneScreen(zoneId: zone.id));
    }
  }
}
