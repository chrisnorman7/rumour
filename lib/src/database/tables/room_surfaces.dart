import 'package:drift/drift.dart';

import '_tables.dart';
import 'mixins.dart';

/// The room surfaces table.
class RoomSurfaces extends Table with IdMixin, NameMixin, DescriptionMixin {
  /// The footstep sound(s) to use.
  IntColumn get footstepSoundId =>
      integer().references(SoundReferences, #id).nullable()();

  /// The ID of the wall sound to use.
  IntColumn get wallSoundI =>
      integer().references(SoundReferences, #id).nullable()();
}
