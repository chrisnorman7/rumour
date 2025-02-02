import 'package:flutter/material.dart';

/// A [ListTile] which shows a [CircularProgressIndicator].
class LoadingListTile extends StatelessWidget {
  /// Create an instance.
  const LoadingListTile({
    required this.title,
    super.key,
    this.label = 'Loading...',
    this.autofocus = false,
  });

  /// The title of this widget.
  final String title;

  /// The label for the [CircularProgressIndicator].
  final String label;

  /// Whether the [ListTile] should be autofocused.
  final bool autofocus;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => ListTile(
    autofocus: autofocus,
    title: Text(title),
    subtitle: CircularProgressIndicator(semanticsLabel: label),
    onTap: () {},
  );
}
