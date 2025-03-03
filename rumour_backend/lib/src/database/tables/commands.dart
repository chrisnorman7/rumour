import 'package:drift/drift.dart';
import 'package:rumour_backend/_tables.dart';
import 'package:rumour_backend/src/database/tables/mixins.dart';

/// The commands table.
class Commands extends Table with IdMixin, DescriptionMixin, MessageMixin {
  /// A URL to open.
  TextColumn get url => text().nullable()();

  /// The quest stage to set.
  IntColumn get questStageId => integer()
      .references(QuestStages, #id, onDelete: KeyAction.setNull)
      .nullable()();
}
