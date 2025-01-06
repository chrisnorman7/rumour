// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      name: json['name'] as String? ?? 'Untitled Project',
      databaseFilename: json['databaseFilename'] as String? ?? 'db.sqlite3',
      soundsDirectoryName: json['soundsDirectoryName'] as String? ?? 'sounds',
      mainMenuMusic: json['mainMenuMusic'] == null
          ? null
          : SerializableSoundReference.fromJson(
              json['mainMenuMusic'] as Map<String, dynamic>),
      mainMenuMusicFadeIn: json['mainMenuMusicFadeIn'] == null
          ? null
          : Duration(
              microseconds: (json['mainMenuMusicFadeIn'] as num).toInt()),
      mainMenuMusicFadeOut: json['mainMenuMusicFadeOut'] == null
          ? null
          : Duration(
              microseconds: (json['mainMenuMusicFadeOut'] as num).toInt()),
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'name': instance.name,
      'databaseFilename': instance.databaseFilename,
      'soundsDirectoryName': instance.soundsDirectoryName,
      'mainMenuMusic': instance.mainMenuMusic,
      'mainMenuMusicFadeIn': instance.mainMenuMusicFadeIn?.inMicroseconds,
      'mainMenuMusicFadeOut': instance.mainMenuMusicFadeOut?.inMicroseconds,
    };
