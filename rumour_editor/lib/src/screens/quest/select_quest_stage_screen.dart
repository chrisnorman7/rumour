import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/src/widgets/nothing_to_see.dart';

/// The ListTile for quest stages.
class _QuestListTile extends ConsumerWidget {
  /// Create an instance.
  const _QuestListTile({
    required this.quest,
    required this.onChanged,
    required this.questStageId,
  });

  /// THe quest to use.
  final Quest quest;

  /// The function to call with a new quest stage.
  final ValueChanged<QuestStage> onChanged;

  /// The ID of the current quest stage.
  final int? questStageId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(questStagesProvider(quest.id));
    return value.when(
      data: (final stages) {
        final children = <Widget>[];
        for (var i = 0; i < stages.length; i++) {
          final stage = stages[i];
          children.add(
            PlaySoundReferenceSemantics(
              soundReferenceId: stage.labelSoundId,
              child: ListTile(
                autofocus:
                    (questStageId == null && i == 0) ||
                    stage.id == questStageId,
                title: Text(stage.label),
                onTap: () {
                  context.pop();
                  onChanged(stage);
                },
              ),
            ),
          );
        }
        return ExpansionTile(
          title: Text(quest.name),
          initiallyExpanded:
              questStageId == null ||
              stages
                  .where((final stage) => stage.id == questStageId)
                  .isNotEmpty,
          children: children.toList(),
        );
      },
      error: ErrorListTile.withPositional,
      loading:
          () => ListTile(
            title: Text(quest.name),
            subtitle: Text(quest.description),
            onTap: () {},
          ),
    );
  }
}

/// A screen for selecting a new quest stage.
class SelectQuestStageScreen extends ConsumerWidget {
  /// Create an instance.
  const SelectQuestStageScreen({
    required this.onChanged,
    this.questStageId,
    this.title = 'Select Quest Stage',
    super.key,
  });

  /// The function to call with a new quest stage.
  final ValueChanged<QuestStage> onChanged;

  /// The ID of the current quest stage.
  final int? questStageId;

  /// The title of the [Scaffold].
  final String title;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(questsProvider);
    return Cancel(
      child: SimpleScaffold(
        title: title,
        body: value.simpleWhen((final quests) {
          if (quests.isEmpty) {
            return const NothingToSee();
          }
          return ListView.builder(
            itemBuilder: (final context, final index) {
              final quest = quests[index];
              return _QuestListTile(
                quest: quest,
                onChanged: onChanged,
                questStageId: questStageId,
              );
            },
            itemCount: quests.length,
          );
        }),
      ),
    );
  }
}
