import 'package:drift/drift.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// The room surface boosts table.
class RoomSurfaceBoosts extends Table
    with IdMixin, RoomSurfaceIdMixin, GameStatIdMixin {
  /// How many seconds will elapse between this stat being replenished.
  IntColumn get interval => integer().withDefault(const Constant(30))();

  /// How much of this stat should be added each boost cycle.
  IntColumn get boost => integer().withDefault(const Constant(1))();

  /// The ID of the game stat whose value should be treated as the max value for
  /// this stat.
  @ReferenceName('game_stat_max')
  IntColumn get maxGameStatId => integer()
      .references(GameStats, #id, onDelete: KeyAction.setNull)
      .nullable()();

  /// /// The mathematical operator to use.
  IntColumn get mathematicalOperator => intEnum<MathematicalOperator>()
      .withDefault(Constant(MathematicalOperator.plus.index))();

  /// The value to combine with the [mathematicalOperator] and the max game stat
  /// to get the final max value.
  IntColumn get value => integer().withDefault(const Constant(1))();

  /// The ID of the sound which will play if and when this stat is boosted.
  @ReferenceName('roomSurfaceBoostBoostSounds')
  IntColumn get boostSoundId => integer()
      .references(SoundReferences, #id, onDelete: KeyAction.setNull)
      .nullable()();

  /// The ID of the sound that will play if this stat is maxed out.
  @ReferenceName('roomSurfaceBoostMaxedOutSounds')
  IntColumn get maxedOutSoundId => integer()
      .references(SoundReferences, #id, onDelete: KeyAction.setNull)
      .nullable()();
}
