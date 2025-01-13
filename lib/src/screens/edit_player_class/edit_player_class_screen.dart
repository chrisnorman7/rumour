import 'dart:math';

import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../extensions/async_value_x.dart';
import '../../providers.dart';
import '../../widgets/room_list_tile.dart';

/// A screen for editing player classes.
class EditPlayerClassScreen extends ConsumerWidget {
  /// Create an instance.
  const EditPlayerClassScreen({
    required this.playerClassId,
    super.key,
  });

  /// The ID of the player class to edit.
  final int playerClassId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final query = projectContext.database.managers.playerClasses.filter(
      (final f) => f.id.equals(playerClassId),
    );
    final value = ref.watch(playerClassProvider(playerClassId));
    return Cancel(
      child: SimpleScaffold(
        title: 'Edit Player Class',
        body: value.simpleWhen(
          (final playerClass) => ListView(
            shrinkWrap: true,
            children: [
              TextListTile(
                value: playerClass.name,
                onChanged: (final value) async {
                  await query.update(
                    (final o) => o(name: Value(value)),
                  );
                  invalidateProviders(ref);
                },
                header: 'Name',
                autofocus: true,
              ),
              TextListTile(
                value: playerClass.description,
                onChanged: (final value) async {
                  await query.update(
                    (final o) => o(description: Value(value)),
                  );
                  invalidateProviders(ref);
                },
                header: 'Description',
              ),
              RoomListTile(
                roomId: playerClass.roomId,
                onChanged: (final room) async {
                  await query.update((final o) => o(roomId: Value(room.id)));
                  invalidateProviders(ref);
                },
                title: 'Starting room',
              ),
              PointListTile(
                point: Point(playerClass.x, playerClass.y),
                onChanged: (final point) async {
                  await query.update(
                    (final o) => o(x: Value(point.x), y: Value(point.y)),
                  );
                  ref.invalidate(PlayerClassProvider(playerClassId));
                },
                title: 'Starting coordinates',
                min: const Point(0, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Invalidate providers.
  void invalidateProviders(final WidgetRef ref) => ref
    ..invalidate(playerClassesProvider)
    ..invalidate(playerClassProvider(playerClassId));
}
