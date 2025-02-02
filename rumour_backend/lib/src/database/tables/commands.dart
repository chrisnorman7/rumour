import 'package:drift/drift.dart';
import 'package:rumour_backend/_tables.dart';
import 'package:rumour_backend/src/database/tables/mixins.dart';

/// The commands table.
class Commands extends Table with IdMixin, DescriptionMixin {
  /// The text to announce.
  TextColumn get spokenMessage => text()
      .withDefault(const Constant('This command needs configuring.'))
      .nullable()();

  /// The ID of a sound to play.
  IntColumn get soundId => integer()
      .references(SoundReferences, #id, onDelete: KeyAction.setNull)
      .nullable()();

  /// A URL to open.
  TextColumn get url => text().nullable()();
}
