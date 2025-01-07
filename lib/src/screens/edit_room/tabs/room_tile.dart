import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Show the room objects at [coordinates].
class RoomTile extends ConsumerWidget {
  /// Create an instance.
  const RoomTile({
    required this.roomId,
    required this.coordinates,
    super.key,
  });

  /// The ID of the room to show objects for.
  final int roomId;

  /// The coordinates of this tile.
  final Point<int> coordinates;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) => Focus(
        autofocus: coordinates == const Point(0, 0),
        child: Text('${coordinates.x}, ${coordinates.y}'),
      );
}
