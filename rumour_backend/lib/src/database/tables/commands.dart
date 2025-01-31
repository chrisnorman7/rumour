import 'package:drift/drift.dart';
import 'package:rumour_backend/_tables.dart';
import 'package:rumour_backend/src/database/tables/mixins.dart';

/// The commands table.
class Commands extends Table with IdMixin, DescriptionMixin {
  /// The text to show.
  TextColumn get spokenMessage => text()
      .withDefault(const Constant('This command needs configuring.'))
      .nullable()();

  /// The ID of a sound to play.
  IntColumn get soundId => integer()
      .references(SoundReferences, #id, onDelete: KeyAction.setNull)
      .nullable()();

  /// The ID of a command caller to call another command.
  IntColumn get commandCallerId => integer()
      .references(CommandCallers, #id, onDelete: KeyAction.setNull)
      .nullable()();
}
