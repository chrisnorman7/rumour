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
      pauseSoundsVolumeReduction:
          (json['pauseSoundsVolumeReduction'] as num?)?.toInt() ?? 4,
      pauseMenuTitle: json['pauseMenuTitle'] as String? ?? 'Pause Menu',
      pauseMenuMusic: json['pauseMenuMusic'] == null
          ? null
          : SerializableSoundReference.fromJson(
              json['pauseMenuMusic'] as Map<String, dynamic>),
      statMenuItemFormat: json['statMenuItemFormat'] as String? ??
          '{{ statName }}: {% if maxValue %}{{ (100 / maxValue * statValue) | floor }}%{% else %}{{ statValue }}{% endif %}',
      textStyleSettings: json['textStyleSettings'] == null
          ? null
          : TextStyleSettings.fromJson(
              json['textStyleSettings'] as Map<String, dynamic>),
      examineRoomObjectFormat: json['examineRoomObjectFormat'] as String? ??
          '{{ name }}: {{ description }} ({% if north == 0 and east == 0 and south == 0 and west == 0 %}here{% else %}{%if north > 0 %}{{ north }}n {% endif %}{% if east > 0 %}{{ east }}e {% endif %}{% if south > 0 %}{{ south }}s {% endif %}{% if west > 0 %}{{ west }}w {% endif %}{% endif %})',
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
      'pauseSoundsVolumeReduction': instance.pauseSoundsVolumeReduction,
      'pauseMenuTitle': instance.pauseMenuTitle,
      'pauseMenuMusic': instance.pauseMenuMusic,
      'statMenuItemFormat': instance.statMenuItemFormat,
      'textStyleSettings': instance.textStyleSettings,
      'examineRoomObjectFormat': instance.examineRoomObjectFormat,
    };
