import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../database/database.dart';

/// A [ListTile] which allows configuring a [soundReference].
class SoundReferenceListTile extends StatelessWidget {
  /// Create an instance.
  const SoundReferenceListTile({
    required this.soundReference,
    required this.onChanged,
    required this.title,
    this.autofocus = false,
    super.key,
  });

  /// The sound reference to use.
  final SoundReference? soundReference;

  /// The function to call when [soundReference] has changed.
  final ValueChanged<SoundReference> onChanged;

  /// The title of the [ListTile].
  final String title;

  /// Whether the [ListTile] should be autofocused.
  final bool autofocus;

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final reference = soundReference;
    final actions = <PerformableAction>[];
    if (reference != null) {
      actions.addAll([
        PerformableAction(
          name: 'Delete',
          activator: deleteShortcut,
          invoke: () async {},
        ),
      ]);
    }
    return PerformableActionsListTile(
      actions: actions,
      autofocus: autofocus,
      title: Text(title),
      subtitle: Text(
        reference == null
            ? unsetMessage
            : '${reference.path} ({${reference.volume.toStringAsFixed(1)}})',
      ),
      onTap: () {},
    );
  }
}
