import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The screen for building a project.
class BuildProjectScreen extends ConsumerStatefulWidget {
  /// Create an instance.
  const BuildProjectScreen({super.key});

  /// Create state for this widget.
  @override
  BuildProjectScreenState createState() => BuildProjectScreenState();
}

/// State for [BuildProjectScreen].
class BuildProjectScreenState extends ConsumerState<BuildProjectScreen> {
  /// The messages which have been yielded.
  late final List<String> messages;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    messages = [];
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final value = ref.watch(buildProjectProvider);
    return Cancel(
      child: SimpleScaffold(
        title: 'Build Project',
        body: value.simpleWhen((final message) {
          messages.add(message);
          return ListView.builder(
            itemBuilder: (final context, final index) {
              final message = messages[index];
              return ListTile(
                autofocus: index == 0,
                title: Text(message),
                onTap: message.copyToClipboard,
              );
            },
            itemCount: messages.length,
            shrinkWrap: true,
          );
        }),
      ),
    );
  }
}
