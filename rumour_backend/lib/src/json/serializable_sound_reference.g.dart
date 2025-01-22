// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializable_sound_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerializableSoundReference _$SerializableSoundReferenceFromJson(
        Map<String, dynamic> json) =>
    SerializableSoundReference(
      path: json['path'] as String,
      volume: (json['volume'] as num?)?.toDouble() ?? 0.7,
    );

Map<String, dynamic> _$SerializableSoundReferenceToJson(
        SerializableSoundReference instance) =>
    <String, dynamic>{
      'path': instance.path,
      'volume': instance.volume,
    };
