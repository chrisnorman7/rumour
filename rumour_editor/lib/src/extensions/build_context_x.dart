import 'package:flutter/material.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// Useful extension methods.
extension BuildContextX on BuildContext {
  /// Get a project context.
  ProjectContext get projectContext =>
      findAncestorStateOfType<ProjectContextWidgetState>()!.projectContext;
}
