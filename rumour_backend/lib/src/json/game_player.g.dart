// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GamePlayer _$GamePlayerFromJson(Map<String, dynamic> json) => GamePlayer(
      name: json['name'] as String,
      classId: (json['classId'] as num).toInt(),
      roomId: (json['roomId'] as num).toInt(),
      x: (json['x'] as num).toInt(),
      y: (json['y'] as num).toInt(),
      stats: (json['stats'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(int.parse(k), (e as num).toInt()),
      ),
    );

Map<String, dynamic> _$GamePlayerToJson(GamePlayer instance) =>
    <String, dynamic>{
      'name': instance.name,
      'classId': instance.classId,
      'roomId': instance.roomId,
      'x': instance.x,
      'y': instance.y,
      'stats': instance.stats.map((k, e) => MapEntry(k.toString(), e)),
    };
