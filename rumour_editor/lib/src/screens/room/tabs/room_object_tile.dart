import 'dart:math';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The type of a function which is called to change the selection of a room
/// object.
typedef RoomObjectSelectChange = void Function(RoomObject object);

/// A tile which shows a room object.
class RoomObjectTile extends ConsumerWidget {
  /// Create an instance.
  const RoomObjectTile({
    required this.roomObjectId,
    required this.onSelectChange,
    this.selected = false,
    super.key,
  });

  /// The ID of the object to show.
  final int roomObjectId;

  /// Whether or not the object is selected.
  final bool selected;

  /// The function to call to select or unselect the object.
  final RoomObjectSelectChange onSelectChange;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final defaultTextStyle = Theme.of(context).textTheme.bodyMedium;
    final projectContext = ref.watch(projectContextProvider);
    final query = projectContext.database.managers.roomObjects.filter(
      (final f) => f.id.equals(roomObjectId),
    );
    final value = ref.watch(roomObjectProvider(roomObjectId));
    PlaySoundSemanticsState? semanticsState;
    return value.simpleWhen((final object) {
      final roomExitId = object.roomExitId;
      return PerformableActionsBuilder(
        actions: [
          PerformableAction(
            name: 'Edit',
            invoke: () {
              semanticsState?.stop();
              context.pushWidgetBuilder(
                (final e) => EditRoomObjectScreen(roomObjectId: object.id),
              );
            },
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
          PerformableAction(
            name: 'Select',
            invoke: () {
              context.announce(
                '${selected ? "Deselected" : "Selected"} ${object.name}.',
              );
              onSelectChange(object);
            },
            activator: changeSelectionShortcut,
            checked: selected,
          ),
          if (roomExitId != null)
            PerformableAction(
              name: 'Configure exit',
              invoke: () {
                semanticsState?.stop();
                context.pushWidgetBuilder(
                  (final _) => EditRoomExitScreen(roomExitId: roomExitId),
                );
              },
              activator: editExitShortcut,
            )
          else
            PerformableAction(
              name: 'Make exit',
              invoke:
                  () => context.pushWidgetBuilder(
                    (_) => SelectRoomScreen(
                      onChanged: (final value) async {
                        final roomExit = await projectContext
                            .database
                            .managers
                            .roomExits
                            .createReturning((final o) => o(roomId: value.id));
                        await query.update(
                          (final o) => o(roomExitId: Value(roomExit.id)),
                        );
                        invalidateProviders(ref, object);
                      },
                    ),
                  ),
              activator: editExitShortcut,
            ),
          PerformableAction(
            name: 'Move',
            invoke: () {
              semanticsState?.stop();
              context.pushWidgetBuilder(
                (final context) => SelectRoomScreen(
                  onChanged: (final value) async {
                    await query.update((final o) => o(roomId: Value(value.id)));
                    invalidateProviders(ref, object);
                    ref.invalidate(
                      roomObjectsProvider(value.id, Point(object.x, object.y)),
                    );
                  },
                ),
              );
            },
            activator: moveShortcut,
          ),
          PerformableAction(
            name: 'Delete',
            invoke: () {
              semanticsState?.stop();
              context.confirm(
                message: 'Really delete ${object.name} object?',
                title: confirmDeleteTitle,
                yesCallback: () async {
                  Navigator.pop(context);
                  if (selected) {
                    onSelectChange(object);
                  }
                  await query.delete();
                  ref.invalidate(
                    roomObjectsProvider(
                      object.roomId,
                      Point(object.x, object.y),
                    ),
                  );
                },
              );
            },
            activator: deleteShortcut,
          ),
        ],
        builder:
            (final _, final controller) => MergeSemantics(
              child: PlaySoundReferenceSemantics(
                soundReferenceId: object.ambianceId,
                looping: true,
                child: Semantics(
                  selected: selected ? selected : null,
                  child: Builder(
                    builder: (final builderContext) {
                      semanticsState =
                          builderContext
                              .findAncestorStateOfType<
                                PlaySoundSemanticsState
                              >();
                      return Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: DefaultTextStyle(
                              style: defaultTextStyle!.copyWith(
                                fontSize: selected ? 18.0 : null,
                                fontWeight: selected ? FontWeight.bold : null,
                                color: selected ? Colors.blue : null,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(child: Text(object.name)),
                                  Flexible(
                                    flex: 2,
                                    child: Text(object.description),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: PlaySoundReferenceSemantics(
                              soundReferenceId: object.ambianceId,
                              looping: true,
                              child: IconButton(
                                onPressed: controller.toggle,
                                icon: const Icon(
                                  Icons.more_vert,
                                  semanticLabel: 'Menu',
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
      );
    });
  }

  /// Invalidate providers.
  void invalidateProviders(final WidgetRef ref, final RoomObject object) =>
      ref
        ..invalidate(
          roomObjectsProvider(object.roomId, Point(object.x, object.y)),
        )
        ..invalidate(roomObjectProvider(object.id));
}
