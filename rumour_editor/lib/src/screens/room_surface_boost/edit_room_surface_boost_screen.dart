import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';
import 'package:rumour_editor/src/widgets/game_stat_list_tile.dart';

/// A screen for editing a room surface boost.
class EditRoomSurfaceBoostScreen extends ConsumerWidget {
  /// Create an instance.
  const EditRoomSurfaceBoostScreen({
    required this.roomSurfaceBoostId,
    super.key,
  });

  /// The ID of the boost.
  final int roomSurfaceBoostId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final query = database.managers.roomSurfaceBoosts.filter(
      (final f) => f.id.equals(roomSurfaceBoostId),
    );
    final value = ref.watch(roomSurfaceBoostProvider(roomSurfaceBoostId));
    return Cancel(
      child: SimpleScaffold(
        title: 'Edit Boost',
        body: value.simpleWhen((final boost) {
          void invalidateProviders() =>
              ref
                ..invalidate(roomSurfaceBoostProvider(roomSurfaceBoostId))
                ..invalidate(
                  possibleRoomSurfaceBoostProvider(
                    boost.roomSurfaceId,
                    boost.gameStatId,
                  ),
                );
          final interval = boost.interval;
          return ListView(
            shrinkWrap: true,
            children: [
              GameStatListTile(
                gameStatId: boost.gameStatId,
                title: 'Stat',
                onChanged: (final value) async {
                  await query.update(
                    (final o) => o(gameStatId: Value(value!.id)),
                  );
                  invalidateProviders();
                },
                autofocus: true,
                nullable: false,
              ),
              IntListTile(
                value: interval,
                onChanged: (final value) async {
                  await query.update((final o) => o(interval: Value(value)));
                  invalidateProviders();
                },
                title: 'Boost interval',
                min: 1,
                subtitle: '$interval ${interval == 1 ? "second" : "seconds"}',
              ),
              IntListTile(
                value: boost.boost,
                onChanged: (final value) async {
                  await query.update((final o) => o(boost: Value(value)));
                  invalidateProviders();
                },
                title: 'Boost amount',
              ),
              SoundReferenceListTile(
                soundReferenceId: boost.boostSoundId,
                onChanged: (final value) async {
                  await query.update(
                    (final o) => o(boostSoundId: Value(value)),
                  );
                  invalidateProviders();
                },
                title: 'Boost sound',
              ),
              SoundReferenceListTile(
                soundReferenceId: boost.maxedOutSoundId,
                onChanged: (final value) async {
                  await query.update(
                    (final o) => o(maxedOutSoundId: Value(value)),
                  );
                  invalidateProviders();
                },
                title: 'Max sound',
              ),
            ],
          );
        }),
      ),
    );
  }
}
