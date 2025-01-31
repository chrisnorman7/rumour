import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The zone rooms tab.
class ZoneRoomsTab extends ConsumerWidget {
  /// Create an instance.
  const ZoneRoomsTab({required this.zoneId, super.key});

  /// The ID of the zone to get rooms for.
  final int zoneId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final roomsManager = database.managers.rooms;
    final value = ref.watch(roomsProvider(zoneId));
    return value.simpleWhen(
      (final rooms) => ListView.builder(
        itemBuilder: (final context, final index) {
          final room = rooms[index];
          final query = roomsManager.filter((final f) => f.id.equals(room.id));
          return PlaySoundReferenceSemantics(
            soundReferenceId: room.ambianceId,
            looping: true,
            child: Builder(
              builder:
                  (final builderContext) => PerformableActionsListTile(
                    actions: [
                      RenameAction(
                        context: builderContext,
                        oldName: room.name,
                        onRename: (final name) async {
                          await query.update((final f) => f(name: Value(name)));
                          ref
                            ..invalidate(roomsProvider)
                            ..invalidate(roomProvider(room.id));
                        },
                        title: 'Rename Room',
                      ),
                      DescribeAction(
                        context: builderContext,
                        oldDescription: room.description,
                        onDescribe: (final description) async {
                          await query.update(
                            (final o) => o(description: Value(description)),
                          );
                          ref
                            ..invalidate(roomsProvider)
                            ..invalidate(roomProvider(room.id));
                        },
                        title: 'Describe Room',
                      ),
                      PerformableAction(
                        name: 'Move',
                        activator: moveShortcut,
                        invoke:
                            () =>
                                builderContext..pushWidgetBuilder(
                                  (final _) => SelectZoneScreen(
                                    onChanged: (final id) async {
                                      await query.update(
                                        (final f) => f(zoneId: Value(id)),
                                      );
                                      ref
                                        ..invalidate(roomsProvider)
                                        ..invalidate(roomProvider(room.id));
                                    },
                                    currentZoneId: room.zoneId,
                                  ),
                                ),
                      ),
                      PerformableAction(
                        name: 'Delete',
                        activator: deleteShortcut,
                        invoke:
                            () => builderContext.confirm(
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
                    onTap:
                        () =>
                            builderContext..pushWidgetBuilder(
                              (final _) => EditRoomScreen(roomId: room.id),
                            ),
                  ),
            ),
          );
        },
        itemCount: rooms.length,
        shrinkWrap: true,
      ),
    );
  }
}
