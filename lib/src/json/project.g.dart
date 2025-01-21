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
      menuSelectSound: json['menuSelectSound'] == null
          ? null
          : SerializableSoundReference.fromJson(
              json['menuSelectSound'] as Map<String, dynamic>),
      menuActivateSound: json['menuActivateSound'] == null
          ? null
          : SerializableSoundReference.fromJson(
              json['menuActivateSound'] as Map<String, dynamic>),
      newPlayerLabel: json['newPlayerLabel'] as String? ?? 'New player',
      newPlayerEarcon: json['newPlayerEarcon'] == null
          ? null
          : SerializableSoundReference.fromJson(
              json['newPlayerEarcon'] as Map<String, dynamic>),
      savedPlayersLabel:
          json['savedPlayersLabel'] as String? ?? 'Saved players',
      savedPlayersEarcon: json['savedPlayersEarcon'] == null
          ? null
          : SerializableSoundReference.fromJson(
              json['savedPlayersEarcon'] as Map<String, dynamic>),
      organisationName: json['organisationName'] as String? ?? 'com.example',
      appName: json['appName'] as String? ?? 'game',
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'name': instance.name,
      'databaseFilename': instance.databaseFilename,
      'soundsDirectoryName': instance.soundsDirectoryName,
      'mainMenuMusic': instance.mainMenuMusic,
      'mainMenuMusicFadeIn': instance.mainMenuMusicFadeIn?.inMicroseconds,
      'mainMenuMusicFadeOut': instance.mainMenuMusicFadeOut?.inMicroseconds,
      'menuSelectSound': instance.menuSelectSound,
      'menuActivateSound': instance.menuActivateSound,
      'newPlayerLabel': instance.newPlayerLabel,
      'newPlayerEarcon': instance.newPlayerEarcon,
      'savedPlayersLabel': instance.savedPlayersLabel,
      'savedPlayersEarcon': instance.savedPlayersEarcon,
      'organisationName': instance.organisationName,
      'appName': instance.appName,
    };
