import 'package:drift/drift.dart';

import '_tables.dart';
import 'mixins.dart';

/// The rooms table.
///
/// Uses mixins to link with [SoundReferences].
class Rooms extends Table
    with IdMixin, NameMixin, DescriptionMixin, CreatedAtMixin, AmbianceIdMixin {
  /// The ID of the zone which this room belongs to.
  IntColumn get zoneId => integer().references(Zones, #id)();

  /// The maximum x coordinate.
  IntColumn get maxX => integer().withDefault(const Constant(20))();

  /// The maximum y coordinate.
  IntColumn get maxY => integer().withDefault(const Constant(15))();

  /// The ID of the surface to use.
  IntColumn get surfaceId => integer().references(RoomSurfaces, #id)();
}
