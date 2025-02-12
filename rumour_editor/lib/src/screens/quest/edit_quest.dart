import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The screen for editing a quest.
class EditQuest extends ConsumerWidget {
  /// Create an instance.
  const EditQuest({required this.questId, super.key});

  /// The ID of the quest to edit.
  final int questId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final manager = database.managers.questStages;
    final provider = questStagesProvider(questId);
    final value = ref.watch(provider);
    return CommonShortcuts(
      newCallback: () => _createQuestStage(ref),
      child: Cancel(
        child: SimpleScaffold(
          title: 'Quest Stages',
          body: value.simpleWhen((final stages) {
            if (stages.isEmpty) {
              return const NothingToSee();
            }
            return ListView.builder(
              itemBuilder: (final context, final index) {
                final stage = stages[index];
                final query = manager.filter(
                  (final f) => f.id.equals(stage.id),
                );
                return ExpansionTile(
                  title: Text(stage.label),
                  initiallyExpanded: index == 0,
                  children: [
                    TextListTile(
                      value: stage.label,
                      onChanged: (final value) async {
                        await query.update((final o) => o(label: Value(value)));
                        ref.invalidate(provider);
                      },
                      header: 'Label',
                      autofocus: index == 0,
                    ),
                    SoundReferenceListTile(
                      soundReferenceId: stage.labelSoundId,
                      onChanged: (final value) async {
                        await query.update(
                          (final o) => o(labelSoundId: Value(value)),
                        );
                        ref.invalidate(provider);
                      },
                      title: 'Label sound',
                    ),
                  ],
                );
              },
              itemCount: stages.length,
              shrinkWrap: true,
            );
          }),
          floatingActionButton: NewButton(
            onPressed: () => _createQuestStage(ref),
          ),
        ),
      ),
    );
  }

  /// Create a new stage in this quest.
  Future<void> _createQuestStage(final WidgetRef ref) async {
    final database = ref.watch(databaseProvider);
    final manager = database.managers.questStages;
    await manager.create(
      (final o) => o(label: 'Untitled quest stage', questId: questId),
    );
    ref.invalidate(questStagesProvider(questId));
  }
}
