import 'package:drift/drift.dart';

import 'mixins.dart';
import 'sound_references.dart';
import 'zones.dart';

/// The rooms table.
class Rooms extends Table with IdMixin, NameMixin, CreatedAtMixin {
  /// The ID of the zone which this room belongs to.
  IntColumn get zoneId => integer().references(Zones, #id)();

  /// The ID of the ambiance for this room.
  IntColumn get ambianceId =>
      integer().references(SoundReferences, #id).nullable()();

  /// The maximum x coordinate.
  IntColumn get maxX => integer().withDefault(const Constant(20))();

  /// The maximum y coordinate.
  IntColumn get maxY => integer().withDefault(const Constant(15))();
}
