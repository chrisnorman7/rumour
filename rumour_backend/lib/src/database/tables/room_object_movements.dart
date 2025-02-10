import 'package:drift/drift.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:rumour_backend/_tables.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// The room object movements table.
///
/// This table is used to add movement to [RoomObjects].
class RoomObjectMovements extends Table with IdMixin, RoomObjectIdMixin {
  /// The minimum number of milliseconds to wait before performing this
  /// movement.
  IntColumn get minDelay => integer().withDefault(const Constant(500))();

  /// The maximum number of milliseconds to wait before performing this
  /// movement.
  IntColumn get maxDelay => integer().withDefault(const Constant(1000))();

  /// The direction to travel.
  IntColumn get direction => intEnum<MovingDirection>().withDefault(
        Constant(MovingDirection.forwards.index),
      )();

  /// The distance to travel in [direction].
  IntColumn get distance => integer().withDefault(const Constant(1))();

  /// The ID of a command to run when this movement is made.
  @ReferenceName('onMoveCommandCallers')
  IntColumn get onMoveCommandCallerId => integer()
      .references(CommandCallers, #id, onDelete: KeyAction.setNull)
      .nullable()();
}
