import 'dart:math';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The backend widget.
class _RoomTileCoordinates extends ConsumerWidget {
  /// Create an instance.
  const _RoomTileCoordinates({
    required this.roomId,
    required this.coordinates,
    required this.autofocus,
    required this.toggleSelection,
    required this.selectedObjectIds,
    required this.toggleSelectAll,
    this.soundReferenceId,
  });

  /// The ID of the room to use.
  final int roomId;

  /// The coordinates to use.
  final Point<int> coordinates;

  /// Whether the button should be autofocused.
  final bool autofocus;

  /// The function to call when selecting or deselecting all objects.
  final VoidCallback toggleSelection;

  /// The IDs of the currently selected objects.
  final List<int> selectedObjectIds;

  /// The function to call to select or deselect all.
  final void Function({required bool selectAll}) toggleSelectAll;

  /// The ID of the ambiance to play.
  final int? soundReferenceId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final managers = database.managers;
    final manager = managers.roomObjects;
    return PerformableActionsBuilder(
      actions: [
        PerformableAction(
          name: 'New object',
          invoke: () async {
            final object = await database.managers.roomObjects.createReturning(
              (final f) => f(
                name: 'Untitled Object',
                description: 'A new room object.',
                roomId: roomId,
                x: Value(coordinates.x),
                y: Value(coordinates.y),
              ),
            );
            ref.invalidate(roomObjectsProvider(roomId, coordinates));
            if (context.mounted) {
              await context.pushWidgetBuilder(
                (final _) => EditRoomObjectScreen(roomObjectId: object.id),
              );
            }
          },
          activator: newShortcut,
        ),
        PerformableAction(
          name: 'Build exit',
          invoke:
              () => context.pushWidgetBuilder(
                (final builderContext) => SelectRoomScreen(
                  onChanged: (final room) async {
                    final startRoom = await ref.read(
                      roomProvider(roomId).future,
                    );
                    final roomExits = managers.roomExits;
                    final backExit = await roomExits.createReturning(
                      (final o) => o(
                        roomId: roomId,
                        x: Value(coordinates.x),
                        y: Value(coordinates.y),
                      ),
                    );
                    final backObject = await manager.createReturning(
                      (final o) => o(
                        name: 'Back Exit',
                        description: 'An exit back to ${startRoom.name}.',
                        roomId: room.id,
                        roomExitId: Value(backExit.id),
                      ),
                    );
                    final outExit = await managers.roomExits.createReturning(
                      (final o) => o(roomId: room.id),
                    );
                    final outObject = await manager.createReturning(
                      (final o) => o(
                        name: 'Out Exit',
                        description: 'Leads to ${room.name}.',
                        roomId: roomId,
                        roomExitId: Value(outExit.id),
                        x: Value(coordinates.x),
                        y: Value(coordinates.y),
                      ),
                    );
                    for (final object in [outObject, backObject]) {
                      ref.invalidate(
                        roomObjectsProvider(object.roomId, object.coordinates),
                      );
                    }
                    ref.invalidate(roomProvider(room.id));
                    if (context.mounted) {
                      context.announce('Built exit to ${room.name}.');
                    }
                  },
                ),
              ),
          activator: buildShortcut,
        ),
        PerformableAction(
          name: 'Toggle selection',
          invoke: toggleSelection,
          activator: changeSelectionShortcut,
        ),
        if (selectedObjectIds.isNotEmpty) ...[
          PerformableAction(
            name: 'Copy selected objects here',
            invoke: () async {
              final names = <String>[];
              for (final id in selectedObjectIds) {
                final query = manager.filter((final f) => f.id.equals(id));
                final object = await query.getSingle();
                names.add(object.name);
                await manager.create(
                  (final o) => o(
                    name: object.name,
                    description: object.description,
                    roomId: object.roomId,
                    ambianceId: Value(object.ambianceId),
                    x: Value(coordinates.x),
                    y: Value(coordinates.y),
                  ),
                );
              }
              if (context.mounted) {
                context.announce('Copied ${names.englishList()} to here.');
              }
              ref.invalidate(roomObjectsProvider(roomId, coordinates));
            },
            activator: pasteShortcut,
          ),
          PerformableAction(
            name: 'Move selected objects here',
            invoke: () async {
              final names = <String>[];
              for (final id in selectedObjectIds) {
                final query = manager.filter((final f) => f.id.equals(id));
                final object = await query.getSingle();
                names.add(object.name);
                await query.update(
                  (final o) => o(
                    roomId: Value(roomId),
                    x: Value(coordinates.x),
                    y: Value(coordinates.y),
                  ),
                );
                ref.invalidate(
                  roomObjectsProvider(object.roomId, object.coordinates),
                );
              }
              if (context.mounted) {
                context.announce('Moved ${names.englishList()} to here.');
              }
              ref.invalidate(RoomObjectsProvider(roomId, coordinates));
            },
            activator: pasteAndMoveShortcut,
          ),
          PerformableAction(
            name: 'Deselect all',
            invoke: () => toggleSelectAll(selectAll: false),
            activator: deselectShortcut,
          ),
          PerformableAction(
            name: 'Delete',
            invoke: () {
              final n = selectedObjectIds.length;
              context.confirm(
                message: 'Really delete $n ${n.pluralise("object")}?',
                title: confirmDeleteTitle,
                yesCallback: () async {
                  Navigator.pop(context);
                  final names = <String>[];
                  for (final id in [...selectedObjectIds]) {
                    final query = manager.filter((final f) => f.id.equals(id));
                    final object = await query.getSingle();
                    selectedObjectIds.remove(object.id);
                    names.add(object.name);
                    await query.delete();
                    ref.invalidate(
                      roomObjectsProvider(object.roomId, object.coordinates),
                    );
                  }
                  if (context.mounted) {
                    context.announce('Delete ${names.englishList()}.');
                  }
                },
              );
            },
            activator: deleteShortcut,
          ),
        ] else ...[
          PerformableAction(
            name: 'Select all',
            invoke: () => toggleSelectAll(selectAll: true),
            activator: selectAllShortcut,
          ),
        ],
      ],
      builder:
          (final builderContext, final controller) => MergeSemantics(
            child: PlaySoundReferenceSemantics(
              soundReferenceId: soundReferenceId,
              child: TextButton(
                autofocus: autofocus,
                onPressed: controller.toggle,
                child: Text('${coordinates.x}, ${coordinates.y}'),
              ),
            ),
          ),
    );
  }
}

/// A widget which shows [coordinates] and allows new room objects to be
/// created.
class RoomTileCoordinates extends ConsumerWidget {
  /// Create an instance.
  const RoomTileCoordinates({
    required this.roomId,
    required this.coordinates,
    required this.toggleSelection,
    required this.selectedObjectIds,
    required this.toggleSelectAll,
    this.autofocus = false,
    super.key,
  });

  /// The ID of the room where the [coordinates] are.
  final int roomId;

  /// The coordinates to display.
  final Point<int> coordinates;

  /// The function to call when selecting or deselecting all objects.
  final VoidCallback toggleSelection;

  /// The IDs of the currently selected objects.
  final List<int> selectedObjectIds;

  /// The function to call to select or deselect all.
  final void Function({required bool selectAll}) toggleSelectAll;

  /// Whether the button should be autofocused.
  final bool autofocus;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final roomValue = ref.watch(roomProvider(roomId));
    return roomValue.when(
      data: (final room) {
        final roomSurfaceValue = ref.watch(roomSurfaceProvider(room.surfaceId));
        return roomSurfaceValue.when(
          data:
              (final roomSurface) => _RoomTileCoordinates(
                roomId: roomId,
                coordinates: coordinates,
                autofocus: autofocus,
                toggleSelection: toggleSelection,
                selectedObjectIds: selectedObjectIds,
                toggleSelectAll: toggleSelectAll,
                soundReferenceId: roomSurface.footstepSoundId,
              ),
          error: ErrorText.withPositional,
          loading:
              () => _RoomTileCoordinates(
                roomId: roomId,
                coordinates: coordinates,
                autofocus: autofocus,
                toggleSelection: toggleSelection,
                selectedObjectIds: selectedObjectIds,
                toggleSelectAll: toggleSelectAll,
              ),
        );
      },
      error: ErrorText.withPositional,
      loading:
          () => _RoomTileCoordinates(
            roomId: roomId,
            coordinates: coordinates,
            autofocus: autofocus,
            toggleSelection: toggleSelection,
            selectedObjectIds: selectedObjectIds,
            toggleSelectAll: toggleSelectAll,
          ),
    );
  }
}
