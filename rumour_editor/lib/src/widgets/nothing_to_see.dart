import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';

/// Show that there is nothing to see.
class NothingToSee extends StatelessWidget {
  /// Create an instance.
  const NothingToSee({this.message = 'There is nothing to see.', super.key});

  /// The message to show.
  final String message;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) =>
      CenterText(text: message, autofocus: true);
}
