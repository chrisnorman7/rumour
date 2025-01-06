import 'package:flutter/material.dart';

import '../providers.dart';

/// A widget which will close the given [projectContext] when it is disposed.
class CloseProject extends StatefulWidget {
  /// Create an instance.
  const CloseProject({
    required this.child,
    super.key,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// Create state for this widget.
  @override
  CloseProjectState createState() => CloseProjectState();
}

/// State for [CloseProject].
class CloseProjectState extends State<CloseProject> {
  /// Dispose of the widget.
  @override
  void dispose() {
    super.dispose();
    currentProjectContext?.database.close();
    currentProjectContext = null;
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) => widget.child;
}
