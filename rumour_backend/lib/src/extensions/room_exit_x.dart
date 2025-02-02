import 'dart:math';

import 'package:rumour_backend/rumour_backend.dart';

/// Useful methods.
extension RoomExitX on RoomExit {
  /// The destination coordinates.
  Point<int> get coordinates => Point(x, y);
}
