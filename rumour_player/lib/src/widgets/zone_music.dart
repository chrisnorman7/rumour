import 'package:backstreets_widgets/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// A widget which plays zone music.
class ZoneMusic extends ConsumerWidget {
  /// Create an instance.
  const ZoneMusic({
    required this.zoneId,
    required this.error,
    required this.loading,
    required this.child,
    super.key,
  });

  /// The ID of the zone to play music for.
  final int zoneId;

  /// The function to call to show an error.
  final ErrorWidgetCallback error;

  /// The function to call to show a loading screen.
  final Widget Function() loading;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final value = ref.watch(zoneProvider(zoneId));
    return value.when(
      data: (final zone) {
        final musicId = zone.musicId;
        if (musicId == null) {
          return child;
        }
        final project = projectContext.project;
        final value = ref.watch(soundReferenceProvider(musicId));
        return value.when(
          data: (final music) => Music(
            sound: projectContext.getSound(
              soundReference: music,
              destroy: false,
              looping: true,
            ),
            fadeInTime: project.mainMenuMusicFadeIn,
            fadeOutTime: project.mainMenuMusicFadeOut,
            error: error,
            loading: loading,
            child: child,
            key: ValueKey('Music-$musicId'),
          ),
          error: error,
          loading: loading,
        );
      },
      error: error,
      loading: loading,
    );
  }
}
