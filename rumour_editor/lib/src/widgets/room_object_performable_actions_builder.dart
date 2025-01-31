import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/typedefs.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// A widget which uses [builder] to show and edit a room object with the given
/// [roomObjectId].
class RoomObjectPerformableActionsBuilder extends ConsumerWidget {
  /// Create an instance.
  const RoomObjectPerformableActionsBuilder({
    required this.roomObjectId,
    required this.builder,
    this.error = ErrorListTile.withPositional,
    this.loading = LoadingWidget.new,
    this.isSelected,
    this.onSelectChange,
    super.key,
  });

  /// The ID of the room object to load.
  final int roomObjectId;

  /// The function to call to build the widget.
  final Widget Function(
    BuildContext context,
    RoomObject object,
    MenuController controller,
  )
  builder;

  /// The function to call to show an error widget.
  final ErrorWidgetCallback error;

  /// The function to call to show a loading widget.
  final Widget Function() loading;

  /// Whether or not the object is selected.
  final bool? isSelected;

  /// The function to call to select or unselect the object.
  final RoomObjectSelectChange? onSelectChange;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final selected = isSelected;
    final database = ref.watch(databaseProvider);
    final managers = database.managers;
    final query = managers.roomObjects.filter(
      (final f) => f.id.equals(roomObjectId),
    );
    final value = ref.watch(roomObjectProvider(roomObjectId));
    return Semantics(
      selected: selected,
      child: value.when(
        data: (final object) {
          final roomExitId = object.roomExitId;
          return PlaySoundReferenceSemantics(
            soundReferenceId: object.ambianceId,
            looping: true,
            child: PerformableActionsBuilder(
              actions: [
                PerformableAction(
                  name: 'Edit',
                  invoke:
                      () => context.pushWidgetBuilder(
                        (final e) =>
                            EditRoomObjectScreen(roomObjectId: object.id),
                      ),
                  activator: editShortcut,
                ),
                RenameAction(
                  context: context,
                  oldName: object.name,
                  onRename: (final name) async {
                    await query.update((final f) => f(name: Value(name)));
                    invalidateProviders(ref, object);
                  },
                  title: 'Rename Object',
                ),
                DescribeAction(
                  context: context,
                  oldDescription: object.description,
                  onDescribe: (final description) async {
                    await query.update(
                      (final o) => o(description: Value(description)),
                    );
                    invalidateProviders(ref, object);
                  },
                  title: 'Rename Object',
                ),
                if (selected != null)
                  PerformableAction(
                    name: 'Select',
                    invoke: () {
                      final name = object.name;
                      context.announce(
                        '${selected ? "Deselected" : "Selected"} $name.',
                      );
                      onSelectChange?.call(object);
                    },
                    activator: changeSelectionShortcut,
                    checked: isSelected,
                  ),
                if (roomExitId != null)
                  PerformableAction(
                    name: 'Configure exit',
                    invoke:
                        () => context.pushWidgetBuilder(
                          (final _) =>
                              EditRoomExitScreen(roomExitId: roomExitId),
                        ),
                    activator: editExitShortcut,
                  )
                else
                  PerformableAction(
                    name: 'Make exit',
                    invoke:
                        () => context.pushWidgetBuilder(
                          (_) => SelectRoomScreen(
                            onChanged: (final value) async {
                              final roomExit = await database.managers.roomExits
                                  .createReturning(
                                    (final o) => o(roomId: value.id),
                                  );
                              await query.update(
                                (final o) => o(roomExitId: Value(roomExit.id)),
                              );
                              invalidateProviders(ref, object);
                            },
                          ),
                        ),
                    activator: editExitShortcut,
                  ),
                if (roomExitId != null)
                  PerformableAction(
                    name: 'Delete exit',
                    invoke:
                        () => context.confirm(
                          message: 'Really delete the exit?',
                          title: confirmDeleteTitle,
                          yesCallback: () async {
                            Navigator.pop(context);
                            await managers.roomExits
                                .filter((final f) => f.id.equals(roomExitId))
                                .delete();
                            invalidateProviders(ref, object);
                          },
                        ),
                  ),
                PerformableAction(
                  name: 'Move',
                  invoke:
                      () => context.pushWidgetBuilder(
                        (final context) => SelectRoomScreen(
                          onChanged: (final value) async {
                            await query.update(
                              (final o) => o(roomId: Value(value.id)),
                            );
                            invalidateProviders(ref, object);
                            ref.invalidate(
                              roomObjectsProvider(value.id, object.coordinates),
                            );
                          },
                        ),
                      ),
                  activator: moveShortcut,
                ),
                PerformableAction(
                  name: 'Delete',
                  invoke:
                      () => context.confirm(
                        message: 'Really delete ${object.name}?',
                        title: confirmDeleteTitle,
                        yesCallback: () async {
                          Navigator.pop(context);
                          if (selected ?? false) {
                            onSelectChange?.call(object);
                          }
                          await query.delete();
                          ref.invalidate(
                            roomObjectsProvider(
                              object.roomId,
                              object.coordinates,
                            ),
                          );
                        },
                      ),
                  activator: deleteShortcut,
                ),
              ],
              builder:
                  (final builderContext, final controller) => Builder(
                    builder:
                        (final builderContext) =>
                            builder(builderContext, object, controller),
                  ),
            ),
          );
        },
        error: error,
        loading: loading,
      ),
    );
  }

  /// Invalidate providers.
  void invalidateProviders(final WidgetRef ref, final RoomObject object) =>
      ref
        ..invalidate(roomObjectsProvider(object.roomId, object.coordinates))
        ..invalidate(roomObjectProvider(object.id));
}
