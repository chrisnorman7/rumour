import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers.dart';
import '../../widgets/close_project.dart';
import '../edit_room_surface/edit_room_surface_screen.dart';
import '../edit_zone/edit_zone_screen.dart';
import 'tabs/project_player_classes_tab.dart';
import 'tabs/project_room_surfaces_tab.dart';
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
            TabbedScaffoldTab(
              title: 'Room Surfaces',
              icon: const Text('Share footstep and wall sounds between rooms.'),
              builder: (final _) => CommonShortcuts(
                newCallback: () => _createRoomSurface(ref),
                child: const ProjectRoomSurfacesTab(),
              ),
              floatingActionButton: NewButton(
                onPressed: () => _createRoomSurface(ref),
                tooltip: 'New room surface',
              ),
            ),
            TabbedScaffoldTab(
              title: 'Player Classes',
              icon: const Text('Classes which new players can choose from'),
              builder: (final context) => const ProjectPlayerClassesTab(),
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

  /// Create a new room surface.
  Future<void> _createRoomSurface(final WidgetRef ref) async {
    final projectContext = ref.read(projectContextProvider);
    final surface =
        await projectContext.database.managers.roomSurfaces.createReturning(
      (final f) => f(
        name: 'Untitled Room Surface',
        description: 'An unremarkable room surface.',
      ),
    );
    ref.invalidate(roomSurfaceProvider);
    final context = ref.context;
    if (context.mounted) {
      await context.pushWidgetBuilder(
        (final _) => EditRoomSurfaceScreen(roomSurfaceId: surface.id),
      );
    }
  }
}
