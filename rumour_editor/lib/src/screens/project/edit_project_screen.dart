import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';
import 'package:rumour_player/rumour_player.dart';
import 'package:url_launcher/url_launcher.dart';

/// Edit a project context.
class EditProjectScreen extends ConsumerWidget {
  /// Create an instance.
  const EditProjectScreen({super.key});

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final actions = [
      PerformableAction(
        name: 'Play project',
        invoke: () => _playProject(ref),
        activator: playShortcut,
      ),
      PerformableAction(
        name: 'Build project',
        invoke: () => _buildProject(ref),
        activator: buildShortcut,
      ),
      PerformableAction(
        name: 'Project settings',
        invoke: () => _projectSettings(ref),
        activator: preferencesShortcut,
      ),
      PerformableAction(
        name: 'Open sounds directory',
        invoke: () => _projectSoundsDirectory(ref),
        activator: soundsDirectoryShortcut,
      ),
    ];
    return CloseProject(
      child: TabbedScaffold(
        tabs: [
          PerformableActionsTabbedScaffoldTab(
            performableActions: actions,
            title: 'Zones',
            icon: const Text('Share settings between multiple rooms'),
            builder:
                (final _) => CommonShortcuts(
                  newCallback: () => _createZone(ref),
                  child: const ProjectZonesTab(),
                ),
            floatingActionButton: NewButton(
              onPressed: () => _createZone(ref),
              tooltip: 'New zone',
            ),
          ),
          PerformableActionsTabbedScaffoldTab(
            performableActions: actions,
            title: 'Room Surfaces',
            icon: const Text('Share footstep and wall sounds between rooms.'),
            builder:
                (final _) => CommonShortcuts(
                  newCallback: () => _createRoomSurface(ref),
                  child: const ProjectRoomSurfacesTab(),
                ),
            floatingActionButton: NewButton(
              onPressed: () => _createRoomSurface(ref),
              tooltip: 'New room surface',
            ),
          ),
          PerformableActionsTabbedScaffoldTab(
            performableActions: actions,
            title: 'Player Classes',
            icon: const Text('Classes which new players can choose from'),
            builder: (final context) => const ProjectPlayerClassesTab(),
          ),
          PerformableActionsTabbedScaffoldTab(
            performableActions: actions,
            title: 'Stats',
            icon: const Text("Stats for players, NPC's and objects"),
            builder:
                (final context) => CommonShortcuts(
                  newCallback: () => _createGameStat(ref),
                  child: const ProjectGameStatsTab(),
                ),
            floatingActionButton: NewButton(
              onPressed: () => _createGameStat(ref),
            ),
          ),
        ],
      ),
    );
  }

  /// Play the current project.
  void _playProject(final WidgetRef ref) => ref.context.pushWidgetBuilder(
    (final builderContext) => const PlayProjectScreen(),
  );

  /// Build the project into a single project which can be compiled.
  void _buildProject(final WidgetRef ref) {
    ref.invalidate(buildProjectProvider);
    ref.context.pushWidgetBuilder((final _) => const BuildProjectScreen());
  }

  /// Load the sounds directory.
  void _projectSoundsDirectory(final WidgetRef ref) {
    final projectContext = ref.read(projectContextProvider);
    final uri = Uri.parse(projectContext.soundsDirectory.path);
    launchUrl(uri);
  }

  /// Show project settings.
  Future<void> _projectSettings(final WidgetRef ref) => ref.context
      .pushWidgetBuilder((final context) => const ProjectSettingsScreen());

  /// Create a new zone.
  Future<void> _createZone(final WidgetRef ref) async {
    final database = ref.watch(databaseProvider);
    final zone = await database.managers.zones.createReturning(
      (final f) => f(name: 'Untitled Zone', description: 'This is a new zone.'),
    );
    ref.invalidate(zonesProvider);
    final context = ref.context;
    if (context.mounted) {
      await context.pushWidgetBuilder(
        (final _) => EditZoneScreen(zoneId: zone.id),
      );
    }
  }

  /// Create a new room surface.
  Future<void> _createRoomSurface(final WidgetRef ref) async {
    final database = ref.watch(databaseProvider);
    final surface = await database.managers.roomSurfaces.createReturning(
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

  /// Create a new game stat.
  Future<void> _createGameStat(final WidgetRef ref) async {
    final database = ref.watch(databaseProvider);
    final stat = await database.managers.gameStats.createReturning(
      (final o) => o(name: 'Untitled Stat', description: 'A new stat.'),
    );
    ref.invalidate(gameStatsProvider);
    final context = ref.context;
    if (context.mounted) {
      await context.pushWidgetBuilder(
        (_) => EditGameStatScreen(gameStatId: stat.id),
      );
    }
  }
}
