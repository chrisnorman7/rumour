import 'package:drift/drift.dart';
import 'package:rumour_backend/_tables.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// The room objects table.
///
/// Links with [Rooms].
@TableIndex(name: 'room_object_coordinates_index', columns: {#x, #y})
class RoomObjects extends Table
    with
        IdMixin,
        NameMixin,
        DescriptionMixin,
        AmbianceIdMixin,
        RoomIdMixin,
        CoordinatesMixin {
  /// The ID of a room exit object.
  IntColumn get roomExitId => integer()
      .references(RoomExits, #id, onDelete: KeyAction.setNull)
      .nullable()();

  /// Whether or not this object is visible to the player.
  ///
  /// If [visible] is `false`, then the player will still hear the ambiance.
  BoolColumn get visible => boolean().withDefault(const Constant(true))();

  /// The ID of the earcon to use.
  @ReferenceName('room_object_earcons')
  IntColumn get earconId => integer()
      .references(SoundReferences, #id, onDelete: KeyAction.setNull)
      .nullable()();

  /// The distance at which an onApproach command will be called.
  IntColumn get approachDistance => integer().withDefault(const Constant(2))();

  /// The ID of a command caller to use when a player approaches this object.
  @ReferenceName('onApproachCommandCallers')
  IntColumn get onApproachCommandCallerId => integer()
      .references(CommandCallers, #id, onDelete: KeyAction.setNull)
      .nullable()();

  /// The ID of a command caller to use when the player leaves this object
  /// behind.
  @ReferenceName('onLeaveCommandCallers')
  IntColumn get onLeaveCommandCallerId => integer()
      .references(CommandCallers, #id, onDelete: KeyAction.setNull)
      .nullable()();
}
