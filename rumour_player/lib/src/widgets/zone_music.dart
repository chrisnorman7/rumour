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
    required this.builder,
    super.key,
  });

  /// The ID of the zone to play music for.
  final int zoneId;

  /// The function to call to show an error.
  final ErrorWidgetCallback error;

  /// The function to call to show a loading screen.
  final Widget Function() loading;

  /// The function to call to build the widget.
  final WidgetBuilder builder;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final value = ref.watch(zoneProvider(zoneId));
    return value.when(
      data: (final zone) {
        final musicId = zone.musicId;
        if (musicId == null) {
          return Builder(builder: builder);
        }
        final project = projectContext.project;
        final value = ref.watch(soundReferenceProvider(musicId));
        return value.when(
          data: (final music) => MaybeMusic(
            music: projectContext.getSound(
              soundReference: music,
              destroy: false,
            ),
            fadeInTime: project.mainMenuMusicFadeIn,
            fadeOutTime: project.mainMenuMusicFadeOut,
            builder: builder,
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
