import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// A [ListTile] which shows a quest stage, and allows it to be changed.
class QuestStageListTile extends ConsumerWidget {
  /// Create an instance.
  const QuestStageListTile({
    required this.questStageId,
    required this.onChanged,
    this.title = 'Quest stage',
    this.autofocus = false,
    super.key,
  });

  /// The ID of the quest stage to show.
  final int questStageId;

  /// The function to call when the quest stage changes.
  final ValueChanged<QuestStage?> onChanged;

  /// The title of the [ListTile].
  final String title;

  /// Whether the [ListTile] should be autofocused.
  final bool autofocus;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(questStageProvider(questStageId));
    return value.when(
      data:
          (final stage) => ListTile(
            autofocus: autofocus,
            title: Text(title),
            subtitle: Text(stage.label),
            onTap:
                () => context.pushWidgetBuilder(
                  (_) => SelectQuestStageScreen(
                    onChanged: onChanged,
                    questStageId: questStageId,
                  ),
                ),
          ),
      error: ErrorListTile.withPositional,
      loading:
          () => ListTile(
            autofocus: autofocus,
            title: Text(title),
            subtitle: const LoadingWidget(),
            onTap:
                () => context.pushWidgetBuilder(
                  (_) => SelectQuestStageScreen(onChanged: onChanged),
                ),
          ),
    );
  }
}
