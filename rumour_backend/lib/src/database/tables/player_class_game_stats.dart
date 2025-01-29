import 'package:drift/drift.dart';
import 'package:rumour_backend/_tables.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// The player class game stats table.
///
/// Links [PlayerClasses] to [GameStats].
class PlayerClassGameStats extends Table
    with IdMixin, PlayerClassIdMixin, GameStatIdMixin {
  /// The default value to use.
  IntColumn get defaultValue => integer()();
}
