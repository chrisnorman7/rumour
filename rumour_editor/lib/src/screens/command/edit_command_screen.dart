import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// A screen for editing a command.
class EditCommandScreen extends ConsumerWidget {
  /// Create an instance.
  const EditCommandScreen({required this.commandId, super.key});

  /// The ID of the command to edit.
  final int commandId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) => Cancel(
    child: TabbedScaffold(
      tabs: [
        TabbedScaffoldTab(
          title: 'Settings',
          icon: const Text('Command settings'),
          child: CommandSettingsTab(commandId: commandId),
        ),
        TabbedScaffoldTab(
          title: 'Stats',
          icon: const Text('The stat modifiers this command will perform'),
          child: CommandGameStatsTab(commandId: commandId),
        ),
      ],
    ),
  );
}
