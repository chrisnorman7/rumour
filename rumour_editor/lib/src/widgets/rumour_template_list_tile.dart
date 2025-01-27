import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// A [ListTile] which allows editing a [rumourTemplate] [value].
class RumourTemplateListTile<T> extends StatelessWidget {
  /// Create an instance.
  const RumourTemplateListTile({
    required this.rumourTemplate,
    required this.value,
    required this.title,
    required this.onChanged,
    this.autofocus = false,
    super.key,
  });

  /// The rumour template to use.
  final RumourTemplate<T> rumourTemplate;

  /// The value which will be parsed by the [rumourTemplate].
  final String value;

  /// The function to call when [value] changes.
  final ValueChanged<String> onChanged;

  /// The title of the [ListTile].
  final String title;

  /// Whether the [ListTile] should be autofocused.
  final bool autofocus;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => PerformableActionsListTile(
    actions:
        [
          ...rumourTemplate.values.map(
            (final value) => PerformableAction(
              name: '${value.name}: ${value.description}',
              invoke: '{{ ${value.name} }}'.copyToClipboard,
            ),
          ),
          PerformableAction(
            name: 'Copy',
            invoke: value.copyToClipboard,
            activator: copyShortcut,
          ),
        ].toList(),
    autofocus: autofocus,
    title: Text(title),
    subtitle: Text(value),
    onTap:
        () => context.pushWidgetBuilder(
          (_) => GetText(
            onDone: (final value) {
              Navigator.pop(context);
              onChanged(value);
            },
            labelText: 'Template',
            text: value,
            title: 'Edit Template',
          ),
        ),
  );
}
