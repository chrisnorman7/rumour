// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GamePlayer _$GamePlayerFromJson(Map<String, dynamic> json) => GamePlayer(
      id: json['id'] as String,
      name: json['name'] as String,
      roomId: (json['roomId'] as num).toInt(),
      x: (json['x'] as num).toInt(),
      y: (json['y'] as num).toInt(),
    );

Map<String, dynamic> _$GamePlayerToJson(GamePlayer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'roomId': instance.roomId,
      'x': instance.x,
      'y': instance.y,
    };
