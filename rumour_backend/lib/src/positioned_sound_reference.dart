import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// A [soundReference] with a [position].
class PositionedSoundReference {
  /// Create an instance.
  const PositionedSoundReference({
    required this.soundReference,
    required this.position,
  });

  /// The sound reference to use.
  final SoundReference soundReference;

  /// The position of [soundReference].
  final SoundPosition3d position;
}
