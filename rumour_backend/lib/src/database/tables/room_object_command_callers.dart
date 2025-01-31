import 'package:drift/drift.dart';
import 'package:rumour_backend/_tables.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// The room object command callers table.
class RoomObjectCommandCallers extends Table with IdMixin, NameMixin {
  /// The ID of the room object to bind this command to.
  IntColumn get roomObjectId =>
      integer().references(RoomObjects, #id, onDelete: KeyAction.cascade)();

  /// The ID of the command caller to call.
  IntColumn get commandCallerId =>
      integer().references(CommandCallers, #id, onDelete: KeyAction.cascade)();

  /// The ID of the sound label to use for this command.
  IntColumn get earconId => integer()
      .references(SoundReferences, #id, onDelete: KeyAction.setNull)
      .nullable()();
}
