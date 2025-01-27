import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';

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
  /// The controller to use.
  late final TextEditingController _controller;

  /// The messages which have been yielded.
  late final List<String> messages;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    messages = [];
  }

  /// Dispose of the widget.
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
          _controller.text = messages.join('\n');
          return TextField(
            autofocus: true,
            controller: _controller,
            readOnly: true,
          );
        }),
      ),
    );
  }
}
