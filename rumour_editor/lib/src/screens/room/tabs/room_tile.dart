import 'dart:math';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// Show the room objects at [coordinates].
class RoomTile extends ConsumerWidget {
  /// Create an instance.
  const RoomTile({
    required this.roomId,
    required this.coordinates,
    required this.selectedObjectIds,
    required this.onSelectChange,
    required this.toggleSelectAll,
    this.autofocus = false,
    super.key,
  });

  /// The ID of the room to show objects for.
  final int roomId;

  /// The coordinates of this tile.
  final Point<int> coordinates;

  /// The IDs of objects which are selected.
  final List<int> selectedObjectIds;

  /// The function to call when object selection changes.
  final RoomObjectSelectChange onSelectChange;

  /// The function to call to change select all.
  final void Function({required bool selectAll}) toggleSelectAll;

  /// Whether to autofocus this tile.
  final bool autofocus;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final provider = roomObjectsProvider(roomId, coordinates);
    final value = ref.watch(provider);
    return FocusTraversalGroup(
      child: value.when(
        data:
            (final objects) => SingleChildScrollView(
              key: ValueKey('loaded-${coordinates.x}-${coordinates.y}'),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: RoomTileCoordinates(
                      autofocus: autofocus,
                      roomId: roomId,
                      coordinates: coordinates,
                      toggleSelection: () => toggleSelection(context, objects),
                      selectedObjectIds: selectedObjectIds,
                      toggleSelectAll: toggleSelectAll,
                    ),
                  ),
                  ...objects.map(
                    (final object) => RoomObjectTile(
                      roomObjectId: object.id,
                      onSelectChange: onSelectChange,
                      selected: selectedObjectIds.contains(object.id),
                    ),
                  ),
                ],
              ),
            ),
        error: ErrorListView.withPositional,
        loading:
            () => RoomTileCoordinates(
              autofocus: autofocus,
              roomId: roomId,
              coordinates: coordinates,
              toggleSelection:
                  () => context.announce('Objects are not loaded yet.'),
              selectedObjectIds: const [],
              toggleSelectAll: toggleSelectAll,
            ),
      ),
    );
  }

  /// Toggle selection of [objects].
  void toggleSelection(
    final BuildContext context,
    final List<RoomObject> objects,
  ) {
    if (objects.isEmpty) {
      return context.announce('There are no objects here.');
    }
    final names =
        objects.map((final object) => object.name).toList().englishList();
    if (objects.every(
      (final element) => selectedObjectIds.contains(element.id),
    )) {
      objects.forEach(onSelectChange);
      context.announce('Deselected $names.');
    } else {
      context.announce('Selected $names.');
      for (final object in objects) {
        if (!selectedObjectIds.contains(object.id)) {
          onSelectChange(object);
        }
      }
    }
  }
}
