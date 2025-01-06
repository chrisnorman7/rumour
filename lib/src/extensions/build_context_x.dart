import 'package:flutter/material.dart';

import '../project_context.dart';
import '../widgets/project_context_widget.dart';

/// Useful extension methods.
extension BuildContextX on BuildContext {
  /// Get a project context.
  ProjectContext get projectContext =>
      findAncestorStateOfType<ProjectContextWidgetState>()!.projectContext;
}
