import 'package:drift/drift.dart';
import 'package:rumour_backend/src/database/tables/commands.dart';
import 'package:rumour_backend/src/database/tables/mixins.dart';

/// The command callers table.
class CommandCallers extends Table with IdMixin {
  /// The ID of the command to call.
  IntColumn get commandId =>
      integer().references(Commands, #id, onDelete: KeyAction.cascade)();
}
