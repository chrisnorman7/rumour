import 'package:drift/drift.dart';
import 'package:rumour_backend/_tables.dart';
import 'package:rumour_backend/src/database/tables/mixins.dart';

/// The quest stages table.
class QuestStages extends Table with IdMixin {
  /// The ID of the quest this stage is part of.
  IntColumn get questId =>
      integer().references(Quests, #id, onDelete: KeyAction.cascade)();

  /// The label of this quest stage.
  TextColumn get label => text()();

  /// The ID of the label sound.
  IntColumn get labelSoundId => integer()
      .references(SoundReferences, #id, onDelete: KeyAction.setNull)
      .nullable()();
}
