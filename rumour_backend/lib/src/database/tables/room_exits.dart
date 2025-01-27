import 'package:drift/drift.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// The room exits table.
class RoomExits extends Table with IdMixin, RoomIdMixin, CoordinatesMixin {
  /// The ID of the sound to play when using this exit.
  IntColumn get useSoundId =>
      integer().references(SoundReferences, #id).nullable()();
}
