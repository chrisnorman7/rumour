import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';
import 'package:url_launcher/url_launcher.dart';

/// A screen for editing a command.
class EditCommandScreen extends ConsumerWidget {
  /// Create an instance.
  const EditCommandScreen({required this.commandId, super.key});

  /// The ID of the command to edit.
  final int commandId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final value = ref.watch(commandProvider(commandId));
    final managers = database.managers;
    final commands = managers.commands;
    final query = commands.filter((final f) => f.id.equals(commandId));
    return Cancel(
      child: SimpleScaffold(
        title: 'Edit Command',
        body: value.simpleWhen((final command) {
          final url = command.url;
          final value = ref.watch(
            commandCallerFromParentCommandIdProvider(command.id),
          );
          return ListView(
            shrinkWrap: true,
            children: [
              TextListTile(
                value: command.description,
                onChanged: (final value) async {
                  await query.update((final o) => o(description: Value(value)));
                  invalidateProviders(ref);
                },
                header: 'Description',
                autofocus: true,
              ),
              TextListTile(
                value: command.spokenMessage ?? '',
                onChanged: (final value) async {
                  await query.update(
                    (final o) =>
                        o(spokenMessage: Value(value.isEmpty ? null : value)),
                  );
                  invalidateProviders(ref);
                },
                header: 'Spoken message',
              ),
              SoundReferenceListTile(
                soundReferenceId: command.soundId,
                onChanged: (final value) async {
                  await query.update((final o) => o(soundId: Value(value)));
                  invalidateProviders(ref);
                },
                title: 'Sound',
              ),
              PerformableActionsListTile(
                actions:
                    url == null
                        ? []
                        : [
                          PerformableAction(
                            name: 'Clear',
                            invoke: () async {
                              await query.update(
                                (final o) => o(url: const Value(null)),
                              );
                              invalidateProviders(ref);
                            },
                            activator: deleteShortcut,
                          ),
                          PerformableAction(
                            name: 'Open URL',
                            invoke: () {
                              final uri = Uri.tryParse(url);
                              if (uri == null) {
                                context.showMessage(message: 'Invalid URL.');
                              } else {
                                launchUrl(uri);
                              }
                            },
                            activator: testShortcut,
                          ),
                        ],
                title: const Text('URL'),
                subtitle: Text(url ?? unsetMessage),
                onTap:
                    () => context.pushWidgetBuilder(
                      (_) => GetText(
                        onDone: (final newUrl) async {
                          Navigator.pop(context);
                          await query.update(
                            (final o) =>
                                o(url: Value(newUrl.isEmpty ? null : newUrl)),
                          );
                          invalidateProviders(ref);
                        },
                        labelText: 'URL',
                        text: url,
                        title: 'Command URL',
                      ),
                    ),
              ),
              value.when(
                data:
                    (final caller) => PossibleCommandCallerListTile(
                      title: 'Sub command',
                      onChanged:
                          (final value) =>
                              ref
                                ..invalidate(commandProvider(commandId))
                                ..invalidate(
                                  commandCallerFromParentCommandIdProvider(
                                    command.id,
                                  ),
                                ),
                      parentCommandId: commandId,
                      commandCallerId: caller?.id,
                    ),
                error: ErrorListTile.withPositional,
                loading: () => const LoadingListTile(title: 'Sub command'),
              ),
            ],
          );
        }),
      ),
    );
  }

  /// Invalidate providers.
  void invalidateProviders(final WidgetRef ref) =>
      ref
        ..invalidate(commandProvider(commandId))
        ..invalidate(commandCallerFromParentCommandIdProvider(commandId));
}
