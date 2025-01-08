import 'dart:math';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../actions/rename_action.dart';
import '../../../providers.dart';
import 'room_tile_coordinates.dart';

/// Show the room objects at [coordinates].
class RoomTile extends ConsumerWidget {
  /// Create an instance.
  const RoomTile({
    required this.focusNode,
    required this.roomId,
    required this.coordinates,
    this.autofocus = false,
    super.key,
  });

  /// The focus node to use for the tile coordinates.
  final FocusNode focusNode;

  /// The ID of the room to show objects for.
  final int roomId;

  /// The coordinates of this tile.
  final Point<int> coordinates;

  /// Whether to autofocus this tile.
  final bool autofocus;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final provider = roomObjectsProvider(roomId, coordinates);
    final value = ref.watch(provider);
    return FocusTraversalGroup(
      child: value.when(
        data: (final objects) => SingleChildScrollView(
          key: ValueKey('loaded-${coordinates.x}-${coordinates.y}'),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: RoomTileCoordinates(
                  autofocus: autofocus,
                  focusNode: focusNode,
                  roomId: roomId,
                  coordinates: coordinates,
                ),
              ),
              ...objects.map(
                (final object) {
                  final query =
                      projectContext.database.managers.roomObjects.filter(
                    (final f) => f.id.equals(object.id),
                  );
                  return Expanded(
                    flex: 2,
                    child: PerformableActionsBuilder(
                      actions: [
                        RenameAction(
                          context: context,
                          oldName: object.name,
                          onRename: (final name) async {
                            await query
                                .update((final f) => f(name: Value(name)));
                            ref.invalidate(provider);
                          },
                          title: 'Rename Object',
                        ),
                      ],
                      builder: (final builderContext, final controller) =>
                          MergeSemantics(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
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
                  );
                },
              ),
            ],
          ),
        ),
        error: ErrorListView.withPositional,
        loading: () => RoomTileCoordinates(
          autofocus: autofocus,
          focusNode: focusNode,
          roomId: roomId,
          coordinates: coordinates,
        ),
      ),
    );
  }
}
