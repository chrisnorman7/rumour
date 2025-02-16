import 'package:drift/drift.dart';
import 'package:rumour_backend/_tables.dart';
import 'package:rumour_backend/rumour_backend.dart';

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

  /// The ID of a command caller to use when the player enters this room.
  @ReferenceName('onEnterCommandCallers')
  IntColumn get onEnterCommandCallerId => integer()
      .references(CommandCallers, #id, onDelete: KeyAction.setNull)
      .nullable()();

  /// The ID of a command caller to use when the player exits this room.
  @ReferenceName('onExitCommandCallers')
  IntColumn get onExitCommandCallerId => integer()
      .references(CommandCallers, #id, onDelete: KeyAction.setNull)
      .nullable()();

  /// The ID of a command caller to use when the player teleports in this room.
  @ReferenceName('onTeleportCommandCallers')
  IntColumn get onTeleportCommandCallerId => integer()
      .references(CommandCallers, #id, onDelete: KeyAction.setNull)
      .nullable()();
}
