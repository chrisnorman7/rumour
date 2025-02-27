import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// The quest achievements tab.
class QuestsTab extends ConsumerWidget {
  /// Create an instance.
  const QuestsTab({
    required this.playerId,
    super.key,
  });

  /// The ID of the player to use.
  final String playerId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final project = projectContext.project;
    final value = ref.watch(questAchievementsProvider(playerId));
    return value.simpleWhen((final achievements) {
      if (achievements.isEmpty) {
        return CenterText(
          text: project.noQuestsLabel,
          autofocus: true,
        );
      }
      return AudioGameMenuListView(
        menuItems: achievements
            .map(
              (final questAchievement) => AudioGameMenuItem(
                title: questAchievement.stage.label,
                onActivate: (final _) {},
                earcon: questAchievement.earcon,
              ),
            )
            .toList(),
        activateItemSound: projectContext.maybeGetSound(
          soundReference: project.menuActivateSound?.getSoundReference(),
          destroy: true,
        ),
        selectItemSound: projectContext.maybeGetSound(
          soundReference: project.menuSelectSound?.getSoundReference(),
          destroy: false,
        ),
      );
    });
  }
}
