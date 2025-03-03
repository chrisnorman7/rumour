import 'package:drift/drift.dart';
import 'package:rumour_backend/_tables.dart';
import 'package:rumour_backend/src/database/tables/mixins.dart';

/// The quest stage conditionals table.
class QuestStageConditionals extends Table
    with IdMixin, MessageMixin, CommandCallerConditionalIdMixin {
  /// The ID of the quest stage which must have been achieved.
  IntColumn get questStageId =>
      integer().references(QuestStages, #id, onDelete: KeyAction.cascade)();
}
