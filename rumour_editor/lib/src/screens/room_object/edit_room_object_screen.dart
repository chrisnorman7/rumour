import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
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
  Widget build(final BuildContext context, final WidgetRef ref) => Cancel(
    child: TabbedScaffold(
      tabs: [
        TabbedScaffoldTab(
          title: 'Random Sounds',
          icon: const Text('The random sounds that this object plays'),
          child: CommonShortcuts(
            newCallback: () => _createRandomSound(ref),
            child: RoomObjectRandomSoundsTab(roomObjectId: roomObjectId),
          ),
          floatingActionButton: NewButton(
            onPressed: () => _createRandomSound(ref),
          ),
        ),
        TabbedScaffoldTab(
          title: 'Settings',
          icon: const Text('Room object settings'),
          child: RoomObjectSettingsTab(roomObjectId: roomObjectId),
        ),
      ],
    ),
  );

  /// Create a new random sound.
  Future<void> _createRandomSound(final WidgetRef ref) {
    final context = ref.context;
    final database = ref.read(databaseProvider);
    final managers = database.managers;
    return context.pushWidgetBuilder(
      (_) => SelectSoundScreen(
        onChanged: (final value) async {
          final soundReference = await managers.soundReferences.createReturning(
            (final o) => o(path: value),
          );
          final randomSound = await managers.roomObjectRandomSounds
              .createReturning(
                (final o) =>
                    o(roomObjectId: roomObjectId, soundId: soundReference.id),
              );
          ref.invalidate(roomObjectRandomSoundsProvider(roomObjectId));
          if (context.mounted) {
            await context.pushWidgetBuilder(
              (_) => EditRoomObjectRandomSoundScreen(
                roomObjectRandomSoundId: randomSound.id,
              ),
            );
          }
        },
      ),
    );
  }
}
