import 'package:flutter/material.dart';

import '../project_context.dart';

/// A widget which manages the life cycle of a [projectContext].
class ProjectContextWidget extends StatefulWidget {
  /// Create an instance.
  const ProjectContextWidget({
    required this.projectContext,
    required this.builder,
    super.key,
  });

  /// The project context to use.
  final ProjectContext projectContext;

  /// The builder to use.
  final WidgetBuilder builder;

  /// Create state for this widget.
  @override
  ProjectContextWidgetState createState() => ProjectContextWidgetState();
}

/// State for [ProjectContextWidget].
class ProjectContextWidgetState extends State<ProjectContextWidget> {
  /// The project context which is being managed.
  ProjectContext get projectContext => widget.projectContext;

  /// Dispose of the widget.
  @override
  void dispose() {
    super.dispose();
    projectContext.database.close();
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) => Builder(builder: widget.builder);
}
