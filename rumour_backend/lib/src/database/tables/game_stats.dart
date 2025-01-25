import 'package:drift/drift.dart';
import 'package:rumour_backend/rumour_backend.dart'
    show RoomSurfaceBoosts, RoomSurfaces;
import 'package:rumour_backend/src/database/tables/_tables.dart'
    show RoomSurfaceBoosts, RoomSurfaces;
import 'package:rumour_backend/src/database/tables/mixins.dart';
import 'package:rumour_backend/src/mathematical_operator.dart';

/// The game stats table.
class GameStats extends Table with IdMixin, NameMixin, DescriptionMixin {
  /// The default value when no other default is provided.
  ///
  /// The [defaultValue] will be ignored in most cases.
  IntColumn get defaultValue => integer().withDefault(const Constant(5))();

  /// Whether or not this stat is visible to the player.
  BoolColumn get isVisible => boolean().withDefault(const Constant(true))();

  /// The ID of the game stat whose value on the target (player or NPC) will be
  /// considered the maximum value for this stat when the stat is being boosted
  /// by [RoomSurfaces] or similar.
  ///
  /// **note**: If [maxGameStatId] is `null`, then [RoomSurfaceBoosts] will
  /// boost stats indefinitely. This is probably not what you want.
  IntColumn get maxGameStatId => integer()
      .references(GameStats, #id, onDelete: KeyAction.setNull)
      .nullable()();

  /// The mathematical operator to combine the value of the max game stat and
  /// [maxValueMultiplier] to get the final max value.
  IntColumn get mathematicalOperator => intEnum<MathematicalOperator>()
      .withDefault(Constant(MathematicalOperator.multiply.index))();

  /// The maximum value to combine with the value of the max stat to get the
  /// maximum value.
  IntColumn get maxValueMultiplier =>
      integer().withDefault(const Constant(1))();
}
