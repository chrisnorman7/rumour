import 'package:drift/drift.dart';

import '_tables.dart';
import 'mixins.dart';

/// The room objects table.
///
/// Links with [Rooms].
class RoomObjects extends Table
    with IdMixin, NameMixin, DescriptionMixin, AmbianceIdMixin, RoomIdMixin {
  /// The x coordinate.
  IntColumn get x => integer().withDefault(const Constant(0))();

  /// The y coordinate.
  IntColumn get y => integer().withDefault(const Constant(0))();
}
