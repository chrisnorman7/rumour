import 'package:drift/drift.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// The player class game stats table.
class PlayerClassGameStats extends Table
    with IdMixin, PlayerClassIdMixin, GameStatIdMixin, RoomIdMixin {
  /// The default value to use.
  IntColumn get defaultValue => integer()();
}
