import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';
import 'package:rumour_editor/src/screens/room_surface_cost/edit_room_surface_cost_screen.dart';

/// The room surface boosts tab.
class RoomSurfaceBoostsTab extends ConsumerWidget {
  /// Create an instance.
  const RoomSurfaceBoostsTab({required this.roomSurfaceId, super.key});

  /// The ID of the room surface to edit.
  final int roomSurfaceId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final manager = projectContext.database.managers.roomSurfaceBoosts;
    return GameStatsListView(
      itemBuilder: (final context, final index, final stat) {
        final autofocus = index == 0;
        final provider = possibleRoomSurfaceBoostProvider(
          roomSurfaceId,
          stat.id,
        );
        final value = ref.watch(provider);
        return value.when(
          data: (final boost) {
            if (boost == null) {
              return IntListTile(
                value: 0,
                onChanged: (final value) async {
                  await manager.createReturning(
                    (final o) => o(
                      roomSurfaceId: roomSurfaceId,
                      gameStatId: stat.id,
                      boost: Value(value),
                    ),
                  );
                  ref.invalidate(provider);
                },
                title: stat.name,
                autofocus: autofocus,
                subtitle: unsetMessage,
              );
            }
            final query = manager.filter((final f) => f.id.equals(boost.id));

            Future<void> updateValue(final int value) async {
              await query.update((final o) => o(boost: Value(value)));
              ref.invalidate(provider);
            }

            return PerformableActionsListTile(
              actions: [
                PerformableAction(
                  name: 'Increase',
                  invoke: () => updateValue(boost.boost + 1),
                  activator: moveUpShortcut,
                ),
                PerformableAction(
                  name: 'Decrease',
                  invoke: () => updateValue(boost.boost - 1),
                  activator: moveDownShortcut,
                ),
                PerformableAction(
                  name: 'Delete',
                  invoke: () async {
                    await query.delete();
                    ref.invalidate(provider);
                  },
                  activator: deleteShortcut,
                ),
              ],
              autofocus: autofocus,
              title: Text(stat.name),
              subtitle: Text('${boost.boost}'),
              onTap:
                  () => context.pushWidgetBuilder(
                    (_) =>
                        EditRoomSurfaceCostScreen(roomSurfaceCostId: boost.id),
                  ),
            );
          },
          error: ErrorListTile.withPositional,
          loading:
              () => ListTile(
                autofocus: autofocus,
                title: Text(stat.name),
                subtitle: const CircularProgressIndicator(
                  semanticsLabel: 'Loading...',
                ),
              ),
        );
      },
    );
  }
}
