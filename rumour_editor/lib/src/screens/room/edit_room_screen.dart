import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// A screen for editing a room.
class EditRoomScreen extends ConsumerWidget {
  /// Create an instance.
  const EditRoomScreen({required this.roomId, super.key});

  /// The ID of the room to edit.
  final int roomId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) => Cancel(
    child: TabbedScaffold(
      tabs: [
        TabbedScaffoldTab(
          title: 'Objects',
          icon: const Text('The objects in this room.'),
          child: RoomObjectsTab(roomId: roomId),
        ),
        TabbedScaffoldTab(
          title: 'Objects List',
          icon: const Text('The objects in this room presented as a list'),
          child: RoomObjectsListTab(roomId: roomId),
        ),
        TabbedScaffoldTab(
          title: 'Settings',
          icon: const Text('Room settings'),
          child: RoomSettingsTab(roomId: roomId),
        ),
      ],
    ),
  );
}
