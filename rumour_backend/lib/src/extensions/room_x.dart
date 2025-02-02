import 'dart:math';

import 'package:rumour_backend/src/database/database.dart';

/// Useful extensions.
extension RoomX on Room {
  /// The maximum coordinates.
  Point<int> get maxCoordinates => Point(maxX, maxY);

  /// Get the minimum coordinates.
  Point<int> get minCoordinates => const Point(0, 0);
}
