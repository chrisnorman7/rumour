import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';
import 'package:rumour_editor/src/widgets/command_caller_list_tile.dart';

/// A [ListTile] for editing a [CommandCaller] or creating a new one.
class PossibleCommandCallerListTile extends ConsumerWidget {
  /// Create an instance.
  const PossibleCommandCallerListTile({
    required this.title,
    required this.onChanged,
    this.commandCallerId,
    this.parentCommandId,
    this.autofocus = false,
    this.helpAssetKey,
    super.key,
  });

  /// The title of the [ListTile].
  final String title;

  /// The function to call when a new command caller is created or an existing
  /// one is updated.
  final ValueChanged<int?> onChanged;

  /// The ID of the command caller.
  final int? commandCallerId;

  /// The ID of the parent command.
  ///
  /// The [parentCommandId] value will be used when creating a new
  /// [CommandCaller].
  final int? parentCommandId;

  /// Whether the [ListTile] should be autofocused.
  final bool autofocus;

  /// The asset key to use to show a help screen.
  final String? helpAssetKey;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final managers = database.managers;
    final commands = managers.commands;
    final commandCallers = managers.commandCallers;
    final id = commandCallerId;
    final assetKey = helpAssetKey;
    if (id == null) {
      return PerformableActionsListTile(
        actions: [
          if (assetKey != null)
            HelpPerformableAction(context: context, assetKey: assetKey),
        ],
        autofocus: autofocus,
        title: Text(title),
        subtitle: const Text(unsetMessage),
        onTap: () async {
          final command = await commands.createReturning(
            (final o) => o(description: 'A new command'),
          );
          final caller = await commandCallers.createReturning(
            (final o) => o(
              childCommandId: command.id,
              parentCommandId: Value(parentCommandId),
            ),
          );
          onChanged(caller.id);
        },
      );
    }
    return CommandCallerListTile(
      commandCallerId: id,
      onChanged: onChanged,
      autofocus: autofocus,
      canDelete: true,
      title: title,
    );
  }
}
