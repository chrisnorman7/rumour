import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// A screen for editing a zone.
class EditZoneScreen extends ConsumerWidget {
  /// Create an instance.
  const EditZoneScreen({required this.zoneId, super.key});

  /// The ID of the zone to edit.
  final int zoneId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) => Cancel(
    child: TabbedScaffold(
      tabs: [
        TabbedScaffoldTab(
          title: 'Settings',
          icon: const Text('Zone settings'),
          builder: (final _) => ZoneSettingsTab(zoneId: zoneId),
        ),
        TabbedScaffoldTab(
          title: 'Rooms',
          icon: const Text('The rooms in this zone'),
          builder:
              (final _) => CommonShortcuts(
                newCallback: () => _createRoom(ref),
                child: ZoneRoomsTab(zoneId: zoneId),
              ),
          floatingActionButton: NewButton(
            onPressed: () => _createRoom(ref),
            tooltip: 'New room',
          ),
        ),
      ],
    ),
  );

  /// Create a new room.
  Future<void> _createRoom(final WidgetRef ref) async {
    final context = ref.context;
    final projectContext = ref.watch(projectContextProvider);
    final surfaces = await ref.read(roomSurfacesProvider.future);
    final RoomSurface surface;
    if (surfaces.isEmpty) {
      surface = await projectContext.database.managers.roomSurfaces
          .createReturning(
            (final f) => f(
              name: 'Untitled Surface',
              description: 'An unremarkable room surface.',
            ),
          );
    } else {
      surface = surfaces.first;
    }
    final room = await projectContext.database.managers.rooms.createReturning(
      (final f) => f(
        zoneId: zoneId,
        name: 'Untitled Room',
        description: 'An unremarkable room.',
        surfaceId: surface.id,
      ),
    );
    ref.invalidate(roomsProvider);
    if (context.mounted) {
      await context.pushWidgetBuilder(
        (final _) => EditRoomScreen(roomId: room.id),
      );
    }
  }
}
