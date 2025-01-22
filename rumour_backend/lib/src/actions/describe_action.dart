import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// The rename action.
class DescribeAction extends PerformableAction {
  /// Create an instance.
  DescribeAction({
    required this.context,
    required this.oldDescription,
    required this.onDescribe,
    required this.title,
    this.labelText = 'Description',
    super.name = 'Change Description',
  }) : super(
          invoke: () => context.pushWidgetBuilder(
            (final builderContext) => GetText(
              onDone: (final value) {
                Navigator.pop(builderContext);
                onDescribe(value);
              },
              labelText: labelText,
              text: oldDescription,
              title: title,
            ),
          ),
          activator: describeShortcut,
        );

  /// The build context to use.
  final BuildContext context;

  /// The current description of the thing to be renamed.
  final String oldDescription;

  /// The function to call when [oldDescription] changes.
  final void Function(String description) onDescribe;

  /// The title of the resulting [GetText] widget.
  final String title;

  /// The label text to be used by [GetText].
  final String labelText;
}
