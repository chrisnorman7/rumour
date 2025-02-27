import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// A context for a [questAchievement].
class QuestAchievementContext {
  /// Create an instance.
  const QuestAchievementContext({
    required this.questAchievement,
    required this.quest,
    required this.stage,
    required this.earcon,
  });

  /// The quest achievement to use.
  final QuestAchievement questAchievement;

  /// The quest that [questAchievement] uses.
  final Quest quest;

  /// The stage of [quest] to show.
  final QuestStage stage;

  /// The label sound for the [quest] [stage].
  final Sound? earcon;
}
