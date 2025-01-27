import 'package:backstreets_widgets/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// Play the ambiances for a room with the given [roomId].
class RoomAmbiances extends ConsumerStatefulWidget {
  /// Create an instance.
  const RoomAmbiances({
    required this.roomId,
    required this.error,
    required this.loading,
    required this.child,
    super.key,
  });

  /// The ID of the room whose ambiances should be loaded.
  final int roomId;

  /// The error widget to show.
  final ErrorWidgetCallback error;

  /// The function to call to build a loading widget.
  final Widget Function() loading;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Create state.
  @override
  ConsumerState<RoomAmbiances> createState() => RoomAmbiancesState();
}

/// State for [RoomAmbiances].
class RoomAmbiancesState extends ConsumerState<RoomAmbiances> {
  /// Sound sounds which will be converted to [roomAmbianceHandles].
  late List<PositionedSoundReference> sounds;

  /// The handles to use.
  late List<SoundHandle> roomAmbianceHandles;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    sounds = [];
    roomAmbianceHandles = [];
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final projectContext = ref.watch(projectContextProvider);
    final value = ref.watch(roomAmbiancesProvider(widget.roomId));
    return value.when(
      data: (final positionedSoundReferences) {
        sounds = positionedSoundReferences;
        final project = projectContext.project;
        return AmbiancesBuilder(
          ambiances: positionedSoundReferences
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
          builder: (final context, final handles) {
            this.roomAmbianceHandles = handles;
            return widget.child;
          },
          error: widget.error,
          loading: widget.loading,
        );
      },
      error: widget.error,
      loading: widget.loading,
    );
  }

  /// Fade [sounds] out.
  void fadeOut() {
    final project = ref.read(projectProvider);
    for (var i = 0; i < sounds.length; i++) {
      roomAmbianceHandles[i].maybeFade(
        fadeTime: project.mainMenuMusicFadeOut,
        to: sounds[i].soundReference.volume /
            project.pauseSoundsVolumeReduction,
      );
    }
  }

  /// Fade [sounds] in.
  void fadeIn() {
    final project = ref.read(projectProvider);
    for (var i = 0; i < sounds.length; i++) {
      roomAmbianceHandles[i].maybeFade(
        fadeTime: project.mainMenuMusicFadeIn,
        to: sounds[i].soundReference.volume,
      );
    }
  }
}
