import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';
import 'package:rumour_editor/src/widgets/game_stat_list_tile.dart';

/// A screen to edit a room surface cost.
class EditRoomSurfaceCostScreen extends ConsumerWidget {
  /// Create an instance.
  const EditRoomSurfaceCostScreen({required this.roomSurfaceCostId, super.key});

  /// The ID of the room surface cost to edit.
  final int roomSurfaceCostId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final query = database.managers.roomSurfaceCosts.filter(
      (final f) => f.id.equals(roomSurfaceCostId),
    );
    final provider = roomSurfaceCostProvider(roomSurfaceCostId);
    final value = ref.watch(provider);
    return Cancel(
      child: SimpleScaffold(
        title: 'Edit Surface Cost',
        body: value.simpleWhen((final cost) {
          void invalidateProviders() =>
              ref
                ..invalidate(provider)
                ..invalidate(
                  possibleRoomSurfaceCostProvider(
                    cost.roomSurfaceId,
                    cost.gameStatId,
                  ),
                );
          return ListView(
            shrinkWrap: true,
            children: [
              IntListTile(
                value: cost.surfaceCost,
                onChanged: (final value) async {
                  await query.update((final o) => o(surfaceCost: Value(value)));
                  invalidateProviders();
                },
                autofocus: true,
                title: 'Cost',
              ),
              SoundReferenceListTile(
                soundReferenceId: cost.exhaustedSoundId,
                onChanged: (final value) async {
                  await query.update(
                    (final o) => o(exhaustedSoundId: Value(value)),
                  );
                  invalidateProviders();
                },
                title: 'Exhausted sound',
              ),
              GameStatListTile(
                gameStatId: cost.gameStatId,
                title: 'Stat',
                onChanged: (final value) async {
                  await query.update(
                    (final o) => o(gameStatId: Value(value!.id)),
                  );
                  invalidateProviders();
                },
                nullable: false,
              ),
            ],
          );
        }),
      ),
    );
  }
}
