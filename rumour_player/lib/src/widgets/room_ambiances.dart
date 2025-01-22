import 'package:backstreets_widgets/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// Play the ambiances for a room with the given [roomId].
class RoomAmbiances extends ConsumerWidget {
  /// Create an instance.
  const RoomAmbiances({
    required this.roomId,
    required this.error,
    required this.child,
    super.key,
  });

  /// The ID of the room whose ambiances should be loaded.
  final int roomId;

  /// The error widget to show.
  final ErrorWidgetCallback error;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Build a widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final value = ref.watch(roomAmbiancesProvider(roomId));
    return value.when(
      data: (final positionedSoundReferences) {
        final project = projectContext.project;
        return AmbiancesBuilder(
          ambiances:
              positionedSoundReferences
                  .map(
                    (final positionedSoundReference) => projectContext.getSound(
                      soundReference: positionedSoundReference.soundReference,
                      destroy: false,
                      looping: true,
                      position: positionedSoundReference.position,
                    ),
                  )
                  .toList(),
          fadeInTime: project.mainMenuMusicFadeIn,
          fadeOutTime: project.mainMenuMusicFadeOut,
          builder: (final context, final handles) => child,
          error: error,
          loading: () => child,
        );
      },
      error: error,
      loading: () => child,
    );
  }
}
