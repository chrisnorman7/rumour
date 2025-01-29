import 'package:drift/drift.dart';
import 'package:rumour_backend/_tables.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// Te room object random sounds table.
class RoomObjectRandomSounds extends Table with IdMixin {
  /// The ID of the room object which will emit this sound.
  IntColumn get roomObjectId =>
      integer().references(RoomObjects, #id, onDelete: KeyAction.cascade)();

  /// The ID of the sound which will be played.
  IntColumn get soundId =>
      integer().references(SoundReferences, #id, onDelete: KeyAction.cascade)();

  /// The minimum number of seconds which will elapse between plays of this
  /// sound.
  IntColumn get minInterval => integer().withDefault(const Constant(5))();

  /// The maximum number of seconds which will elapse between plays of this
  /// sound.
  IntColumn get maxInterval => integer().withDefault(const Constant(30))();
}
