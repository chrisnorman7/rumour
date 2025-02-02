import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';
import 'package:rumour_editor/src/screens/command/edit_command_screen.dart';

/// A list tile for editing a command caller.
class CommandCallerListTile extends ConsumerWidget {
  /// Create an instance.
  const CommandCallerListTile({
    required this.commandCallerId,
    required this.onChanged,
    this.title = 'Command',
    this.autofocus = false,
    this.canDelete = false,
    super.key,
  });

  /// The ID of the command caller to use.
  final int commandCallerId;

  /// The function to call when the command runner changes.
  final ValueChanged<int?> onChanged;

  /// The title of the [ListTile].
  final String title;

  /// Whether the [ListTile] should be autofocused.
  final bool autofocus;

  /// Whether the command can be deleted.
  final bool canDelete;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final managers = database.managers;
    final callerQuery = managers.commandCallers.filter(
      (final f) => f.id.equals(commandCallerId),
    );
    final value = ref.watch(commandCallerProvider(commandCallerId));
    return value.when(
      data: (final commandCaller) {
        final value = ref.watch(commandProvider(commandCaller.childCommandId));
        return value.when(
          data: (final command) {
            final commandQuery = managers.commands.filter(
              (final f) => f.id.equals(command.id),
            );

            void invalidateProviders() =>
                ref
                  ..invalidate(commandCallerProvider(commandCallerId))
                  ..invalidate(commandProvider(command.id));

            final callAfter = commandCaller.callAfter;
            final String subtitle;
            if (callAfter == null) {
              subtitle = command.description;
            } else {
              subtitle =
                  // ignore: lines_longer_than_80_chars
                  '${command.description} ($callAfter ${callAfter.pluralise("second")})';
            }
            return PerformableActionsListTile(
              actions: [
                DescribeAction(
                  context: context,
                  oldDescription: command.description,
                  onDescribe: (final description) async {
                    await commandQuery.update(
                      (final o) => o(description: Value(description)),
                    );
                    invalidateProviders();
                    onChanged(commandCaller.id);
                  },
                  title: 'Describe Command',
                ),
                if (canDelete)
                  PerformableAction(
                    name: 'Delete',
                    invoke:
                        () => context.confirm(
                          message: 'Really delete ${command.description}?',
                          title: confirmDeleteTitle,
                          yesCallback: () async {
                            final soundId = command.soundId;
                            if (soundId != null) {
                              managers.soundReferences.filter(
                                (final f) => f.id.equals(soundId),
                              );
                            }
                            await commandQuery.delete();
                            onChanged(null);
                          },
                        ),
                    activator: deleteShortcut,
                  ),
                PerformableAction(
                  name: 'Increase delay',
                  invoke: () async {
                    await callerQuery.update(
                      (final o) => o(callAfter: Value((callAfter ?? 0) + 1)),
                    );
                    invalidateProviders();
                    onChanged(commandCaller.id);
                  },
                  activator: moveUpShortcut,
                ),
                if (callAfter != null && callAfter > 0)
                  PerformableAction(
                    name: 'Decrease delay',
                    invoke: () async {
                      await callerQuery.update(
                        (final o) => o(
                          callAfter: Value(
                            callAfter == 1 ? null : callAfter - 1,
                          ),
                        ),
                      );
                      invalidateProviders();
                      onChanged(commandCaller.id);
                    },
                    activator: moveDownShortcut,
                  ),
              ],
              autofocus: autofocus,
              title: Text(title),
              subtitle: Text(subtitle),
              onTap: () {
                context.pushWidgetBuilder(
                  (_) => EditCommandScreen(commandId: command.id),
                );
              },
            );
          },
          error: ErrorListTile.withPositional,
          loading: () => LoadingListTile(title: title, autofocus: autofocus),
        );
      },
      error: ErrorListTile.withPositional,
      loading: () => LoadingListTile(title: title, autofocus: autofocus),
    );
  }
}
