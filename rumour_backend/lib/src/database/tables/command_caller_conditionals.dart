import 'package:drift/drift.dart';
import 'package:rumour_backend/_tables.dart';
import 'package:rumour_backend/src/database/tables/mixins.dart';

/// Conditionals for [CommandCallers].
class CommandCallerConditionals extends Table with IdMixin {
  /// The ID of the command caller to link with.
  IntColumn get commandCallerId =>
      integer().references(CommandCallers, #id, onDelete: KeyAction.cascade)();
}
