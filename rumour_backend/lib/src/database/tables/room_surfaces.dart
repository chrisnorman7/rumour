import 'package:drift/drift.dart';
import 'package:rumour_backend/_tables.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// The room surfaces table.
class RoomSurfaces extends Table with IdMixin, NameMixin, DescriptionMixin {
  /// The footstep sound(s) to use.
  @ReferenceName('footstepsSurfaces')
  IntColumn get footstepSoundId =>
      integer().references(SoundReferences, #id).nullable()();

  /// The ID of the wall sound to use.
  @ReferenceName('wallSoundsSurfaces')
  IntColumn get wallSoundI =>
      integer().references(SoundReferences, #id).nullable()();

  /// How many milliseconds must elapse between footsteps on this surface.
  IntColumn get moveInterval => integer().withDefault(const Constant(500))();
}
