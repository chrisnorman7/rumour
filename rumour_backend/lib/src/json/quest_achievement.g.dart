// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest_achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestAchievement _$QuestAchievementFromJson(Map<String, dynamic> json) =>
    QuestAchievement(
      questId: (json['questId'] as num).toInt(),
      stageId: (json['stageId'] as num).toInt(),
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$QuestAchievementToJson(QuestAchievement instance) =>
    <String, dynamic>{
      'questId': instance.questId,
      'stageId': instance.stageId,
      'time': instance.time.toIso8601String(),
    };
