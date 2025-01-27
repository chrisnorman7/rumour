import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// Useful extension methods.
extension WidgetRefX on WidgetRef {
  /// Maybe play [soundReference].
  ///
  /// If [soundReference] is `null`, then nothing will happen.
  Future<SoundHandle?> maybePlaySoundReference({
    required final SoundReference? soundReference,
    required final bool destroy,
    final bool looping = false,
    final Duration loopingStart = Duration.zero,
    final bool paused = false,
    final SoundPosition position = unpanned,
  }) {
    if (context.mounted) {
      final projectContext = read(projectContextProvider);
      return context.maybePlaySound(
        projectContext.maybeGetSound(
          soundReference: soundReference,
          destroy: destroy,
          looping: looping,
          loopingStart: loopingStart,
          paused: paused,
          position: position,
        ),
      );
    }
    return Future.value();
  }
}
