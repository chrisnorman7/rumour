import 'package:drift/drift.dart';

import '_tables.dart';
import 'mixins.dart';

/// The room exits table.
class RoomExits extends Table with IdMixin, RoomIdMixin {
  /// The target x coordinate.
  IntColumn get x => integer()();

  /// The target y coordinate.
  IntColumn get y => integer()();

  /// The ID of the sound to play when using this exit.
  IntColumn get useSoundId =>
      integer().references(SoundReferences, #id).nullable()();
}
