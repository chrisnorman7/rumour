import 'dart:math';

import 'package:backstreets_widgets/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The room objects tab.
class RoomObjectsTab extends ConsumerStatefulWidget {
  /// Create an instance.
  const RoomObjectsTab({required this.roomId, super.key});

  /// The ID of the room to use.
  final int roomId;

  /// Create state for this widget.
  @override
  RoomObjectsTabState createState() => RoomObjectsTabState();
}

/// State for [RoomObjectsTab].
class RoomObjectsTabState extends ConsumerState<RoomObjectsTab> {
  /// The IDs of selected objects.
  late final List<int> _selectedObjectIds;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    _selectedObjectIds = [];
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final roomValue = ref.watch(roomProvider(widget.roomId));
    return roomValue.simpleWhen((final room) {
      final columns = room.maxX;
      final rows = room.maxY;
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
        ),
        itemBuilder: (final context, final index) {
          final x = index % columns;
          final y = index ~/ columns;
          return Card(
            margin: const EdgeInsets.all(4.0),
            elevation: 2.0,
            child: RoomTile(
              autofocus: index == 0,
              roomId: widget.roomId,
              coordinates: Point(x, y),
              selectedObjectIds: _selectedObjectIds,
              onSelectChange:
                  (final object) => setState(() {
                    if (_selectedObjectIds.contains(object.id)) {
                      _selectedObjectIds.remove(object.id);
                    } else {
                      _selectedObjectIds.add(object.id);
                    }
                  }),
              toggleSelectAll: setSelectAll,
            ),
          );
        },
        itemCount: rows * columns,
        reverse: true,
      );
    });
  }

  /// Select or deselect all objects.
  Future<void> setSelectAll({required final bool selectAll}) async {
    _selectedObjectIds.clear();
    if (selectAll) {
      final names = <String>[];
      final projectContext = ref.watch(projectContextProvider);
      final objects =
          await projectContext.database.managers.roomObjects
              .filter((final f) => f.roomId.id.equals(widget.roomId))
              .get();
      for (final object in objects) {
        names.add(object.name);
        _selectedObjectIds.add(object.id);
        ref.invalidate(
          roomObjectsProvider(object.roomId, Point(object.x, object.y)),
        );
      }
      if (mounted) {
        setState(() {});
        context.announce('Select all.');
      }
    } else {
      context.announce('Deselect all.');
      setState(() {});
    }
  }
}
