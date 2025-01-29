import 'package:backstreets_widgets/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_editor/rumour_editor.dart';
import 'package:rumour_editor/src/screens/room_object/tabs/room_object_random_sounds_tab.dart';

/// A screen for editing a room object.
class EditRoomObjectScreen extends ConsumerWidget {
  /// Create an instance.
  const EditRoomObjectScreen({required this.roomObjectId, super.key});

  /// The ID of the room object to edit.
  final int roomObjectId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) =>
      TabbedScaffold(
        tabs: [
          TabbedScaffoldTab(
            title: 'Random Sounds',
            icon: const Text('The random sounds that this object plays'),
            builder:
                (_) => RoomObjectRandomSoundsTab(roomObjectId: roomObjectId),
          ),
          TabbedScaffoldTab(
            title: 'Settings',
            icon: const Text('Room object settings'),
            builder: (_) => RoomObjectSettingsTab(roomObjectId: roomObjectId),
          ),
        ],
      );
}
