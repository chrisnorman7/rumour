import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// A widget which will close the given [projectContext] when it is disposed.
class CloseProject extends ConsumerStatefulWidget {
  /// Create an instance.
  const CloseProject({required this.child, super.key});

  /// The widget below this widget in the tree.
  final Widget child;

  /// Create state for this widget.
  @override
  CloseProjectState createState() => CloseProjectState();
}

/// State for [CloseProject].
class CloseProjectState extends ConsumerState<CloseProject> {
  /// The project context to work with.
  late ProjectContext projectContext;

  /// Dispose of the widget.
  @override
  void dispose() {
    super.dispose();
    projectContext.database.close();
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    projectContext = ref.watch(projectContextProvider);
    return widget.child;
  }
}
