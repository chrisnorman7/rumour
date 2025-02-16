import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The player class settings tab.
class PlayerClassSettingsTab extends ConsumerWidget {
  /// Create an instance.
  const PlayerClassSettingsTab({required this.playerClassId, super.key});

  /// The ID of the player class to show.
  final int playerClassId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final query = database.managers.playerClasses.filter(
      (final f) => f.id.equals(playerClassId),
    );
    final value = ref.watch(playerClassProvider(playerClassId));
    return value.simpleWhen((final playerClass) {
      final value = ref.watch(roomProvider(playerClass.roomId));
      return ListView(
        shrinkWrap: true,
        children: [
          TextListTile(
            value: playerClass.name,
            onChanged: (final value) async {
              await query.update((final o) => o(name: Value(value)));
              invalidateProviders(ref);
            },
            header: 'Name',
            autofocus: true,
          ),
          TextListTile(
            value: playerClass.description,
            onChanged: (final value) async {
              await query.update((final o) => o(description: Value(value)));
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
          value.when(
            data:
                (final room) => PointListTile(
                  point: playerClass.coordinates,
                  onChanged: (final point) async {
                    await query.update(
                      (final o) => o(x: Value(point.x), y: Value(point.y)),
                    );
                    ref.invalidate(PlayerClassProvider(playerClassId));
                  },
                  title: 'Starting coordinates',
                  min: room.minCoordinates,
                  max: room.maxCoordinates,
                ),
            error: ErrorListTile.withPositional,
            loading: () => const LoadingListTile(title: 'Starting coordinates'),
          ),
        ],
      );
    });
  }

  /// Invalidate providers.
  void invalidateProviders(final WidgetRef ref) =>
      ref
        ..invalidate(playerClassesProvider)
        ..invalidate(playerClassProvider(playerClassId));
}
