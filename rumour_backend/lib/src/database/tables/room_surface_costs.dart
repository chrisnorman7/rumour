import 'package:drift/drift.dart';
import 'package:rumour_backend/_tables.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// How much it costs to traverse a room surface.
class RoomSurfaceCosts extends Table
    with IdMixin, RoomSurfaceIdMixin, GameStatIdMixin {
  /// How much of this stat should be subtracted when travelling the surface.
  IntColumn get surfaceCost => integer().withDefault(const Constant(1))();

  /// The ID of the sound to play when the player does not have enough of this
  /// stat.
  IntColumn get exhaustedSoundId => integer()
      .references(SoundReferences, #id, onDelete: KeyAction.setNull)
      .nullable()();
}
