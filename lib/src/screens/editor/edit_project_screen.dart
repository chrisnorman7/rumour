import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers.dart';
import '../../widgets/close_project.dart';

/// Edit a project context.
class EditProjectScreen extends ConsumerWidget {
  /// Create an instance.
  const EditProjectScreen({
    super.key,
  });

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final project = ref.watch(projectProvider);
    return CloseProject(
      child: SimpleScaffold(
        title: 'Edit Project',
        body: ListView(
          shrinkWrap: true,
          children: [
            TextListTile(
              value: project.name,
              onChanged: (final value) {
                project.name = value;
                projectContext.save(project);
                ref.invalidate(projectProvider);
              },
              autofocus: true,
              header: 'Name',
              title: 'Rename Project',
              labelText: 'Project name',
            ),
          ],
        ),
      ),
    );
  }
}
