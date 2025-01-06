import 'package:flutter/material.dart';

/// A widget which shows [message].
class NothingToSee extends StatelessWidget {
  /// Create an instance.
  const NothingToSee({
    this.message = 'There is nothing to see.',
    super.key,
  });

  /// The message to show.
  final String message;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Focus(
              autofocus: true,
              child: Text(message),
            ),
          ),
        ],
      );
}
