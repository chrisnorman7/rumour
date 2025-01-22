import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// The rename action.
class RenameAction extends PerformableAction {
  /// Create an instance.
  RenameAction({
    required this.context,
    required this.oldName,
    required this.onRename,
    required this.title,
    this.labelText = 'Name',
    super.name = 'Rename',
  }) : super(
          invoke: () => context.pushWidgetBuilder(
            (final builderContext) => GetText(
              onDone: (final value) {
                Navigator.pop(builderContext);
                onRename(value);
              },
              labelText: labelText,
              text: oldName,
              title: title,
            ),
          ),
          activator: renameShortcut,
        );

  /// The build context to use.
  final BuildContext context;

  /// The current name of the thing to be renamed.
  final String oldName;

  /// The function to call when [oldName] changes.
  final void Function(String name) onRename;

  /// The title of the resulting [GetText] widget.
  final String title;

  /// The label text to be used by [GetText].
  final String labelText;
}
