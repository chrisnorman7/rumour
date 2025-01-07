import 'dart:math';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers.dart';

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
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final roomObjects = projectContext.database.managers.roomObjects;
    final provider = roomObjectsProvider(roomId, coordinates);
    final value = ref.watch(provider);
    return PerformableActionsBuilder(
      actions: [
        PerformableAction(
          name: 'New object',
          activator: newShortcut,
          invoke: () async {
            await roomObjects.create(
              (final f) => f(
                name: 'Untitled Object',
                description: 'A new object.',
                roomId: roomId,
                x: Value(coordinates.x),
                y: Value(coordinates.y),
              ),
            );
            ref.invalidate(provider);
          },
        ),
      ],
      builder: (final builderContext, final controller) => InkWell(
        autofocus: coordinates == const Point(0, 0),
        onTap: controller.toggle,
        child: value.when(
          data: (final objects) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: Text('${coordinates.x}, ${coordinates.y}')),
              if (objects.isNotEmpty)
                Expanded(
                  flex: 4,
                  child: Text(
                    objects.map((final object) => object.name).join(', '),
                  ),
                ),
            ],
          ),
          error: ErrorListTile.withPositional,
          loading: () => Text('${coordinates.x}, ${coordinates.y}'),
        ),
      ),
    );
  }
}
