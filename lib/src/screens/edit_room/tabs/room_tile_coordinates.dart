import 'dart:math';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers.dart';
import '../../../widgets/error_text.dart';
import '../../../widgets/play_sound_reference_semantics.dart';

/// The backend widget.
class _RoomTileCoordinates extends ConsumerWidget {
  /// Create an instance.
  const _RoomTileCoordinates({
    required this.roomId,
    required this.coordinates,
    required this.autofocus,
  });

  /// The ID of the room to use.
  final int roomId;

  /// The coordinates to use.
  final Point<int> coordinates;

  /// Whether the button should be autofocused.
  final bool autofocus;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    return PerformableActionsBuilder(
      actions: [
        PerformableAction(
          name: 'New object',
          invoke: () async {
            await projectContext.database.managers.roomObjects.create(
              (final f) => f(
                name: 'Untitled Object',
                description: 'A new room object.',
                roomId: roomId,
                x: Value(coordinates.x),
                y: Value(coordinates.y),
              ),
            );
            ref.invalidate(roomObjectsProvider(roomId, coordinates));
          },
          activator: newShortcut,
        ),
      ],
      builder: (final builderContext, final controller) => TextButton(
        autofocus: autofocus,
        onPressed: controller.toggle,
        child: Text('${coordinates.x}, ${coordinates.y}'),
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
    this.autofocus = false,
    super.key,
  });

  /// The ID of the room where the [coordinates] are.
  final int roomId;

  /// The coordinates to display.
  final Point<int> coordinates;

  /// Whether the button should be autofocused.
  final bool autofocus;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final roomValue = ref.watch(roomProvider(roomId));
    return roomValue.when(
      data: (final room) {
        final roomSurfaceValue = ref.watch(
          roomSurfaceProvider(room.surfaceId),
        );
        return roomSurfaceValue.when(
          data: (final roomSurface) => MergeSemantics(
            child: PlaySoundReferenceSemantics(
              soundReferenceId: roomSurface.footstepSoundId,
              child: _RoomTileCoordinates(
                roomId: roomId,
                coordinates: coordinates,
                autofocus: autofocus,
              ),
            ),
          ),
          error: ErrorText.withPositional,
          loading: () => _RoomTileCoordinates(
            roomId: roomId,
            coordinates: coordinates,
            autofocus: autofocus,
          ),
        );
      },
      error: ErrorText.withPositional,
      loading: () => _RoomTileCoordinates(
        roomId: roomId,
        coordinates: coordinates,
        autofocus: autofocus,
      ),
    );
  }
}
