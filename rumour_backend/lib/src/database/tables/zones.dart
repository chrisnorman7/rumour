import 'package:drift/drift.dart';
import 'package:rumour_backend/_tables.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// The zones table.
class Zones extends Table
    with IdMixin, NameMixin, DescriptionMixin, CreatedAtMixin {
  /// The ID of the music this zone will play.
  IntColumn get musicId =>
      integer().references(SoundReferences, #id).nullable()();
}
