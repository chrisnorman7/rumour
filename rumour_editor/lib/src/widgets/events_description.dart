import 'package:flutter/material.dart';

/// A [Text] widget which described what events do for [name].
class EventsDescription extends StatelessWidget {
  /// Create an instance.
  const EventsDescription({required this.name, super.key});

  /// The name of the thing to describe.
  final String name;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) =>
      Text('The events this $name can emit.');
}
