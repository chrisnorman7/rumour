import 'package:drift/drift.dart';

import '_tables.dart';
import 'mixins.dart';

/// The room exits table.
class RoomExits extends Table with IdMixin {
  /// The ID of the sound to play when using this exit.
  IntColumn get useSoundId =>
      integer().references(SoundReferences, #id).nullable()();

  /// The ID of the object which makes up the other side of this exit.
  IntColumn get destinationObjectId =>
      integer().references(RoomObjects, #id, onDelete: KeyAction.cascade)();
}
