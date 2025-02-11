import 'dart:math';

import 'package:flutter_audio_games/flutter_audio_games.dart';

/// Useful extensions.
extension PointIntX on Point<int> {
  /// Return a sound position.
  SoundPosition3d get soundPosition =>
      SoundPosition3d(x.toDouble(), y.toDouble(), 0.0);
}
