import 'package:drift/drift.dart';
import 'package:rumour_backend/_tables.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// The command game stats table.
///
/// This table links [Commands] and [GameStats].
class CommandGameStats extends Table
    with IdMixin, GameStatIdMixin, CommandIdMixin {
  /// The mathematical operator to use.
  IntColumn get mathematicalOperator => intEnum<MathematicalOperator>()
      .withDefault(Constant(MathematicalOperator.plus.index))();

  /// The amount to add according to [mathematicalOperator].
  IntColumn get amount => integer().withDefault(const Constant(1))();
}
