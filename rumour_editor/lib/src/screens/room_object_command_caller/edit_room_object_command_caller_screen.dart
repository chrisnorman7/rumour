import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';
import 'package:rumour_editor/src/widgets/command_caller_list_tile.dart';

/// A screen for editing a room command caller.
class EditRoomObjectCommandCallerScreen extends ConsumerWidget {
  /// Create an instance.
  const EditRoomObjectCommandCallerScreen({
    required this.roomObjectCommandCallerId,
    super.key,
  });

  /// The ID of the room object command caller to edit.
  final int roomObjectCommandCallerId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final query = database.managers.roomObjectCommandCallers.filter(
      (final f) => f.id.equals(roomObjectCommandCallerId),
    );
    final value = ref.watch(
      roomObjectCommandCallerProvider(roomObjectCommandCallerId),
    );
    return Cancel(
      child: SimpleScaffold(
        title: 'Edit Object Command',
        body: value.simpleWhen((final roomObjectCommandCaller) {
          final roomObjectId = roomObjectCommandCaller.roomObjectId;
          return ListView(
            shrinkWrap: true,
            children: [
              TextListTile(
                value: roomObjectCommandCaller.name,
                onChanged: (final value) async {
                  await query.update((final o) => o(name: Value(value)));
                  invalidateProviders(ref, roomObjectId);
                },
                header: 'Name',
                autofocus: true,
              ),
              SoundReferenceListTile(
                soundReferenceId: roomObjectCommandCaller.earconId,
                onChanged: (final value) async {
                  await query.update((final o) => o(earconId: Value(value)));
                  invalidateProviders(ref, roomObjectId);
                },
                title: 'Earcon',
              ),
              CommandCallerListTile(
                commandCallerId: roomObjectCommandCaller.commandCallerId,
                onChanged:
                    (final value) => invalidateProviders(ref, roomObjectId),
              ),
            ],
          );
        }),
      ),
    );
  }

  /// Invalidate providers.
  void invalidateProviders(final WidgetRef ref, final int roomObjectId) =>
      ref
        ..invalidate(roomObjectCommandCallerProvider(roomObjectCommandCallerId))
        ..invalidate(roomObjectCommandCallersProvider(roomObjectId));
}
