import 'package:drift/drift.dart';
import 'package:rumour_backend/_tables.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// The room exits table.
class RoomExits extends Table with IdMixin, RoomIdMixin, CoordinatesMixin {
  /// The ID of the sound to play when using this exit.
  @ReferenceName('room_exit_use_sounds')
  IntColumn get useSoundId =>
      integer().references(SoundReferences, #id).nullable()();

  /// The label of this exit.
  ///
  /// The [label] will be used in the object actions menu.
  TextColumn get label => text().withDefault(const Constant('Use exit'))();

  /// The ID of the earcon sound to use in the room object action menu.
  @ReferenceName('room_exits_earcons')
  IntColumn get earconId => integer()
      .references(SoundReferences, #id, onDelete: KeyAction.setNull)
      .nullable()();
}
