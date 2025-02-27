import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:rumour_backend/rumour_backend.dart';

part 'game_player.g.dart';

/// A player of a game.
@JsonSerializable()
class GamePlayer {
  /// Create an instance.
  GamePlayer({
    required this.name,
    required this.classId,
    required this.roomId,
    required this.x,
    required this.y,
    final Map<int, int>? stats,
    final List<QuestAchievement>? questAchievements,
  })  : stats = stats ?? {},
        questAchievements = questAchievements ?? [];

  /// Create an instance from a JSON object.
  factory GamePlayer.fromJson(final Map<String, dynamic> json) =>
      _$GamePlayerFromJson(json);

  /// The name of this player.
  String name;

  /// The ID of the player class which created this player.
  final int classId;

  /// The ID of the room where this player last saved.
  int roomId;

  /// The player's x coordinate.
  int x;

  /// The player's y coordinate.
  int y;

  /// The coordinates of the player.
  @JsonKey(includeFromJson: false, includeToJson: false)
  Point<int> get coordinates => Point(x, y);

  /// Set [coordinates].
  set coordinates(final Point<int> value) {
    x = value.x;
    y = value.y;
  }

  /// The stats for this player.
  final Map<int, int> stats;

  /// The quest achievements for this player.
  final List<QuestAchievement> questAchievements;

  /// Remove an achievement with the given [stage].
  void removeQuestAchievement(final QuestStage stage) =>
      questAchievements.removeWhere(
        (final achievement) =>
            achievement.stageId == stage.id ||
            achievement.questId == stage.questId,
      );

  /// Set a quest achievement.
  void setQuestAchievement(final QuestStage stage) {
    removeQuestAchievement(stage);
    questAchievements.add(QuestAchievement.now(stage));
  }

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$GamePlayerToJson(this);
}
