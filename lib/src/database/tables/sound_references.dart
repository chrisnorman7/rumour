import 'package:drift/drift.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

import 'mixins.dart';

/// The sound references table.
class SoundReferences extends Table with IdMixin {
  /// The path to the sound.
  TextColumn get path => text()();

  /// The volume of the sound.
  RealColumn get volume => real().withDefault(const Constant(0.7))();

  /// The load mode for this sound.
  IntColumn get loadMode =>
      intEnum<LoadMode>().withDefault(Constant(LoadMode.memory.index))();
}
