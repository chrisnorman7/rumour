import 'dart:math';

import 'package:rumour_backend/src/database/database.dart';

/// Useful methods.
extension PlayerClassX on PlayerClass {
  /// The coordinates where players of this class will start.
  Point<int> get coordinates => Point(x, y);
}
