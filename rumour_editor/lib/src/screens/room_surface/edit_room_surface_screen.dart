import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_editor/src/screens/room_surface/tabs/room_surface_boosts_tab.dart';
import 'package:rumour_editor/src/screens/room_surface/tabs/room_surface_costs_tab.dart';
import 'package:rumour_editor/src/screens/room_surface/tabs/room_surface_settings_tab.dart';

/// A screen for editing a room surface.
class EditRoomSurfaceScreen extends ConsumerWidget {
  /// Create an instance.
  const EditRoomSurfaceScreen({required this.roomSurfaceId, super.key});

  /// The ID of the room surface to edit.
  final int roomSurfaceId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) => Cancel(
    child: TabbedScaffold(
      tabs: [
        TabbedScaffoldTab(
          title: 'Settings',
          icon: const Text('Room surface settings'),
          builder: (_) => RoomSurfaceSettingsTab(roomSurfaceId: roomSurfaceId),
        ),
        TabbedScaffoldTab(
          title: 'Stat Costs',
          icon: const Text('The stat costs for walking on this surface'),
          builder: (_) => RoomSurfaceCostsTab(roomSurfaceId: roomSurfaceId),
        ),
        TabbedScaffoldTab(
          title: 'Boosts',
          icon: const Text('The stat boosts that happen when on this surface'),
          builder: (_) => RoomSurfaceBoostsTab(roomSurfaceId: roomSurfaceId),
        ),
      ],
    ),
  );
}
