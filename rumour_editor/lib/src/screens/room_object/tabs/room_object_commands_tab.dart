import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The room object commands tab.
class RoomObjectCommandsTab extends ConsumerWidget {
  /// Create an instance.
  const RoomObjectCommandsTab({required this.roomObjectId, super.key});

  /// The ID of the room object which commands should be gathered for.
  final int roomObjectId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final manager = database.managers.roomObjectCommandCallers;
    final value = ref.watch(roomObjectCommandCallersProvider(roomObjectId));
    return value.simpleWhen((final commands) {
      if (commands.isEmpty) {
        return const NothingToSee(
          message: 'This object has no commands created.',
        );
      }
      return ListView.builder(
        itemBuilder: (final context, final index) {
          final caller = commands[index];
          final query = manager.filter((final f) => f.id.equals(caller.id));
          final value = ref.watch(
            commandCallerProvider(caller.commandCallerId),
          );
          return PlaySoundReferenceSemantics(
            soundReferenceId: caller.earconId,
            child: PerformableActionsListTile(
              actions: [
                RenameAction(
                  context: context,
                  oldName: caller.name,
                  onRename: (final name) async {
                    await query.update((final o) => o(name: Value(name)));
                    invalidateProviders(ref, caller.id);
                  },
                  title: 'Rename command',
                ),
                PerformableAction(
                  name: 'Delete',
                  invoke:
                      () => context.showConfirmMessage(
                        message: 'Really delete ${caller.name}?',
                        title: confirmDeleteTitle,
                        yesCallback: () async {
                          await query.delete();
                          ref.invalidate(
                            roomObjectCommandCallersProvider(roomObjectId),
                          );
                        },
                      ),
                ),
              ],
              autofocus: index == 0,
              title: Text(caller.name),
              subtitle: value.when(
                data: (final commandCaller) {
                  final callAfter = commandCaller.callAfter;
                  if (callAfter == null) {
                    return const Text('Call immediately');
                  }
                  return Text('$callAfter ${callAfter.pluralise("second")}');
                },
                error: ErrorText.withPositional,
                loading: LoadingWidget.new,
              ),
              onTap:
                  () => context.pushWidgetBuilder(
                    (_) => EditRoomObjectCommandCallerScreen(
                      roomObjectCommandCallerId: caller.id,
                    ),
                  ),
            ),
          );
        },
        itemCount: commands.length,
        shrinkWrap: true,
      );
    });
  }

  /// Invalidate providers.
  void invalidateProviders(final WidgetRef ref, final int id) =>
      ref
        ..invalidate(roomObjectCommandCallersProvider(roomObjectId))
        ..invalidate(roomObjectCommandCallerProvider(id));
}
