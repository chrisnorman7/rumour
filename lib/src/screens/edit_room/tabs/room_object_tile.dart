import 'dart:math';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../actions/describe_action.dart';
import '../../../actions/rename_action.dart';
import '../../../constants.dart';
import '../../../database/database.dart';
import '../../../extensions/async_value_x.dart';
import '../../../providers.dart';
import '../../../widgets/play_sound_reference_semantics.dart';
import '../../edit_room_object/edit_room_object_screen.dart';

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
    return value.simpleWhen(
      (final object) => MergeSemantics(
        child: PlaySoundReferenceSemantics(
          soundReferenceId: object.ambianceId,
          looping: true,
          child: Builder(
            builder: (final builderContext) => PerformableActionsBuilder(
              actions: [
                PerformableAction(
                  name: 'Edit',
                  invoke: () => builderContext
                    ..stopPlaySoundSemantics()
                    ..pushWidgetBuilder(
                      (final e) => EditRoomObjectScreen(
                        roomObjectId: object.id,
                      ),
                    ),
                  activator: editShortcut,
                ),
                RenameAction(
                  context: context,
                  oldName: object.name,
                  onRename: (final name) async {
                    await query.update(
                      (final f) => f(name: Value(name)),
                    );
                    invalidateProviders(ref, object);
                  },
                  title: 'Rename Object',
                ),
                DescribeAction(
                  context: builderContext,
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
                    builderContext.announce(
                      '${selected ? "Deselected" : "Selected"} ${object.name}.',
                    );
                    onSelectChange(object);
                  },
                  activator: changeSelectionShortcut,
                  checked: selected,
                ),
                PerformableAction(
                  name: 'Delete',
                  invoke: () => builderContext.confirm(
                    message: 'Really delete the ${object.name} object?',
                    title: confirmDeleteTitle,
                    yesCallback: () async {
                      Navigator.pop(builderContext);
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
                  ),
                ),
              ],
              builder: (final builderContext, final controller) => Semantics(
                selected: selected ? selected : null,
                child: Row(
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
                      child: IconButton(
                        onPressed: controller.toggle,
                        icon: const Icon(
                          Icons.more_vert,
                          semanticLabel: 'Menu',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Invalidate providers.
  void invalidateProviders(final WidgetRef ref, final RoomObject object) => ref
    ..invalidate(roomObjectsProvider(object.roomId, Point(object.x, object.y)))
    ..invalidate(roomObjectProvider(object.id));
}
