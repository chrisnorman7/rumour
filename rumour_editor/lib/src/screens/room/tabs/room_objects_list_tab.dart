import 'package:backstreets_widgets/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// Show all room objects in a list.
class RoomObjectsListTab extends ConsumerWidget {
  /// Create an instance.
  const RoomObjectsListTab({required this.roomId, super.key});

  /// The ID of the room to load objects for.
  final int roomId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(objectsInRoomProvider(roomId));
    return value.simpleWhen((final objects) {
      if (objects.isEmpty) {
        return const NothingToSee();
      }
      return ListView.builder(
        itemBuilder: (final context, final index) {
          final object = objects[index];
          return RoomObjectPerformableActionsBuilder(
            roomObjectId: object.id,
            builder:
                (final context, final object, final controller) => ListTile(
                  autofocus: index == 0,
                  title: Text(object.name),
                  subtitle: Text(object.description),
                  onTap: () {
                    context
                      ..stopPlaySoundSemantics()
                      ..pushWidgetBuilder(
                        (_) => EditRoomObjectScreen(roomObjectId: object.id),
                      );
                  },
                  trailing: MenuButton(menuController: controller),
                ),
          );
        },
        itemCount: objects.length,
        shrinkWrap: true,
      );
    });
  }
}
