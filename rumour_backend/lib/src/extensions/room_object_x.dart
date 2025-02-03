import 'dart:math';

import 'package:rumour_backend/src/database/database.dart';

/// Useful extensions for [RoomObject]s.
extension RoomObjectX on RoomObject {
  /// The coordinates of this object.
  Point<int> get coordinates => Point(x, y);

  /// Returns `true` if [other] is within [approachDistance] of [coordinates].
  bool isNearby(final Point<int> other) =>
      other.distanceTo(coordinates) <= approachDistance;
}
