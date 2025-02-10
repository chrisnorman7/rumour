import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// A screen to edit a room object movement.
class EditRoomObjectMovement extends ConsumerWidget {
  /// Create an instance.
  const EditRoomObjectMovement({required this.roomObjectMovementId, super.key});

  /// The ID of the room object movement to edit.
  final int roomObjectMovementId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final query = database.managers.roomObjectMovements.filter(
      (final f) => f.id.equals(roomObjectMovementId),
    );
    final value = ref.watch(roomObjectMovementProvider(roomObjectMovementId));
    return Cancel(
      child: SimpleScaffold(
        title: 'Edit Movement',
        body: value.simpleWhen((final movement) {
          final roomObjectId = movement.roomObjectId;
          final distance = movement.distance;
          final minDelay = movement.minDelay;
          final maxDelay = movement.maxDelay;
          return ListView(
            shrinkWrap: true,
            children: [
              EnumListTile(
                title: 'Direction',
                values: MovingDirection.values,
                onChanged: (final value) async {
                  await query.update((final o) => o(direction: Value(value!)));
                  invalidateProviders(ref, roomObjectId);
                },
                autofocus: true,
                nullable: false,
                value: movement.direction,
              ),
              IntListTile(
                value: distance,
                onChanged: (final value) async {
                  await query.update((final o) => o(distance: Value(value)));
                  invalidateProviders(ref, roomObjectId);
                },
                title: 'Distance',
                min: 1,
                subtitle: '$distance ${distance.pluralise("unit")}',
              ),
              IntListTile(
                value: minDelay,
                onChanged: (final value) async {
                  await query.update((final o) => o(minDelay: Value(value)));
                  invalidateProviders(ref, roomObjectId);
                },
                title: 'Min delay',
                min: 500,
                max: maxDelay,
                subtitle: '$minDelay ms',
              ),
              IntListTile(
                value: maxDelay,
                onChanged: (final value) async {
                  await query.update((final o) => o(maxDelay: Value(value)));
                  invalidateProviders(ref, roomObjectId);
                },
                title: 'Max delay',
                min: minDelay,
                subtitle: '$maxDelay ms',
              ),
              PossibleCommandCallerListTile(
                title: 'Movement command',
                onChanged: (final value) async {
                  await query.update(
                    (final o) => o(onMoveCommandCallerId: Value(value)),
                  );
                  invalidateProviders(ref, roomObjectId);
                },
                commandCallerId: movement.onMoveCommandCallerId,
              ),
            ],
          );
        }),
      ),
    );
  }

  /// Invalidate providers.
  void invalidateProviders(final WidgetRef ref, final int roomObjectId) =>
      ref
        ..invalidate(roomObjectMovementProvider(roomObjectMovementId))
        ..invalidate(roomObjectMovementsProvider(roomObjectId));
}
