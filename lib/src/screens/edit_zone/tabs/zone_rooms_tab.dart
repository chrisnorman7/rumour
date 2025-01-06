import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants.dart';
import '../../../extensions/async_value_x.dart';
import '../../../providers.dart';
import '../../../widgets/nothing_to_see.dart';
import '../../../widgets/play_sound_reference_semantics.dart';
import '../../edit_room/edit_room_screen.dart';

/// The zone rooms tab.
class ZoneRoomsTab extends ConsumerWidget {
  /// Create an instance.
  const ZoneRoomsTab({
    required this.zoneId,
    super.key,
  });

  /// The ID of the zone to get rooms for.
  final int zoneId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final roomsManager = projectContext.database.managers.rooms;
    final value = ref.watch(roomsProvider(zoneId));
    return value.simpleWhen((final rooms) {
      if (rooms.isEmpty) {
        return const NothingToSee(
          message: "You haven't created any rooms yet.",
        );
      }
      return ListView.builder(
        itemBuilder: (final context, final index) {
          final room = rooms[index];
          final query = roomsManager.filter((final f) => f.id.equals(room.id));
          return PlaySoundReferenceSemantics(
            soundReferenceId: room.ambianceId,
            looping: true,
            child: Builder(
              builder: (final builderContext) => PerformableActionsListTile(
                actions: [
                  PerformableAction(
                    name: 'Rename',
                    activator: renameShortcut,
                    invoke: () => builderContext.pushWidgetBuilder(
                      (final _) => GetText(
                        onDone: (final value) async {
                          Navigator.pop(builderContext);
                          await query
                              .update((final f) => f(name: Value(value)));
                          ref
                            ..invalidate(roomsProvider)
                            ..invalidate(roomProvider(room.id));
                        },
                        labelText: 'Room name',
                        text: room.name,
                        title: 'Rename Room',
                      ),
                    ),
                  ),
                  PerformableAction(
                    name: 'Delete',
                    activator: deleteShortcut,
                    invoke: () => builderContext.confirm(
                      message: 'Really delete the ${room.name} room?',
                      title: confirmDeleteTitle,
                      yesCallback: () async {
                        Navigator.pop(builderContext);
                        await query.delete();
                        ref.invalidate(roomsProvider);
                      },
                    ),
                  ),
                ],
                autofocus: index == 0,
                title: Text('${room.name} (${room.maxX} x ${room.maxY})'),
                subtitle: Text(room.description),
                onTap: () => builderContext
                  ..stopPlaySoundSemantics()
                  ..pushWidgetBuilder(
                    (final _) => EditRoomScreen(roomId: room.id),
                  ),
              ),
            ),
          );
        },
        itemCount: rooms.length,
        shrinkWrap: true,
      );
    });
  }
}
