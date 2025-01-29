import 'package:rumour_backend/rumour_backend.dart';
import 'package:time/time.dart';

/// Hold information about a [randomSound].
class RoomObjectRandomSoundContext {
  /// Create an instance.
  const RoomObjectRandomSoundContext({
    required this.randomSound,
    required this.sound,
  });

  /// The random sound to use.
  final RoomObjectRandomSound randomSound;

  /// The minimum interval.
  Duration get minInterval => randomSound.minInterval.seconds;

  /// The maximum interval.
  Duration get maxInterval => randomSound.maxInterval.seconds;

  /// The loaded sound reference for [randomSound].
  final SoundReference sound;
}
