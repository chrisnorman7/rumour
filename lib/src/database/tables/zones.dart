import 'package:drift/drift.dart';

import 'mixins.dart';
import 'sound_references.dart';

/// The zones table.
class Zones extends Table
    with IdMixin, NameMixin, DescriptionMixin, CreatedAtMixin {
  /// The ID of the music this zone will play.
  IntColumn get musicId =>
      integer().references(SoundReferences, #id).nullable()();
}
