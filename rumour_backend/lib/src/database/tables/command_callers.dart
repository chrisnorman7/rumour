import 'package:drift/drift.dart';
import 'package:rumour_backend/_tables.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// The command callers table.
@TableIndex(
  name: 'command_callers_calling_command_id_index',
  columns: {#parentCommandId, #childCommandId},
  unique: true,
)
class CommandCallers extends Table with IdMixin {
  /// The ID of the command which owns this caller.
  @ReferenceName('commandsToCall')
  IntColumn get parentCommandId => integer()
      .references(Commands, #id, onDelete: KeyAction.cascade)
      .nullable()();

  /// The ID of the command to call.
  @ReferenceName('commandCallers')
  IntColumn get childCommandId =>
      integer().references(Commands, #id, onDelete: KeyAction.cascade)();

  /// How many seconds to wait before calling the command.
  IntColumn get callAfter => integer().nullable()();
}
