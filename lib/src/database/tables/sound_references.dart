import 'package:drift/drift.dart';

import 'mixins.dart';

/// The sound references table.
class SoundReferences extends Table with IdMixin {
  /// The path to the sound.
  TextColumn get path => text()();

  /// The volume of the sound.
  RealColumn get volume => real().withDefault(const Constant(0.7))();
}
