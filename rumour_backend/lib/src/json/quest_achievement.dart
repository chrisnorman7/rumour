import 'package:json_annotation/json_annotation.dart';

part 'quest_achievement.g.dart';

/// An achievement for a quest.
@JsonSerializable()
class QuestAchievement implements Comparable<DateTime> {
  /// Create an instance.
  const QuestAchievement({
    required this.questId,
    required this.stageId,
    required this.time,
  });

  /// Create an instance using the current date and time.
  QuestAchievement.now({required this.questId, required this.stageId})
      : time = DateTime.now();

  /// Create an instance from a JSON object.
  factory QuestAchievement.fromJson(final Map<String, dynamic> json) =>
      _$QuestAchievementFromJson(json);

  /// The ID of the quest this achievement is for.
  final int questId;

  /// The ID of the stage of the quest which has been achieved.
  final int stageId;

  /// The time at which this achievement was achieved.
  final DateTime time;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$QuestAchievementToJson(this);

  @override
  int compareTo(final DateTime other) => time.compareTo(other);
}
