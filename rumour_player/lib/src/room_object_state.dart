import 'dart:math';

import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// State for a [roomObject].
class RoomObjectState {
  /// Create an instance.
  RoomObjectState({
    required this.object,
    required this.ambiance,
    required this.ambianceHandle,
  }) : coordinates = object.coordinates;

  /// The room object to use.
  final RoomObject object;

  /// The ambiance for [object].
  final SoundReference? ambiance;

  /// The current coordinates for [object].
  Point<int> coordinates;

  /// The sound position for all sounds emitted by [object].
  SoundPosition3d get soundPosition =>
      SoundPosition3d(coordinates.x.toDouble(), coordinates.y.toDouble(), 0.0);

  /// The handle for an ambiance attached to [object].
  final SoundHandle? ambianceHandle;
}
