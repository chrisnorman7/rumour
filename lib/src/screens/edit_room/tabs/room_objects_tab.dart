import 'dart:math';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../extensions/async_value_x.dart';
import '../../../providers.dart';
import 'room_tile.dart';

/// The room objects tab.
class RoomObjectsTab extends ConsumerStatefulWidget {
  /// Create an instance.
  const RoomObjectsTab({
    required this.roomId,
    super.key,
  });

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
    return roomValue.simpleWhen(
      (final room) {
        final columns = room.maxX;
        final rows = room.maxY;
        return Cancel(
          onCancel: () {
            if (_selectedObjectIds.isEmpty) {
              context.announce('No objects are selected.');
            } else {
              context.announce('Deselect all.');
              setState(() {
                _selectedObjectIds.clear();
              });
            }
          },
          child: GridView.builder(
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
                  onSelectChange: (final object) => setState(() {
                    if (_selectedObjectIds.contains(object.id)) {
                      _selectedObjectIds.remove(object.id);
                    } else {
                      _selectedObjectIds.add(object.id);
                    }
                  }),
                ),
              );
            },
            itemCount: rows * columns,
            reverse: true,
          ),
        );
      },
    );
  }
}
