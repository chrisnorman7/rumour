import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_text_style_settings/flutter_text_style_settings.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rumour_backend/src/json/serializable_sound_reference.dart';

part 'project.g.dart';

/// A project.
@JsonSerializable()
class Project {
  /// Create an instance.
  Project({
    this.name = 'Untitled Project',
    this.databaseFilename = 'db.sqlite3',
    this.soundsDirectoryName = 'sounds',
    this.mainMenuMusic,
    this.mainMenuMusicFadeIn,
    this.mainMenuMusicFadeOut,
    this.menuSelectSound,
    this.menuActivateSound,
    this.newPlayerLabel = 'New player',
    this.newPlayerEarcon,
    this.savedPlayersLabel = 'Saved players',
    this.savedPlayersEarcon,
    this.organisationName = 'com.example',
    this.appName = 'game',
    this.pauseSoundsVolumeReduction = 4,
    this.pauseMenuTitle = 'Pause Menu',
    this.pauseMenuMusic,
    this.statMenuItemFormat =
        '{{ statName }}: {% if maxValue %}{{ (100 / maxValue * statValue) | floor }}%{% else %}{{ statValue }}{% endif %}',
    final TextStyleSettings? textStyleSettings,
    this.examineRoomObjectFormat =
        // ignore: lines_longer_than_80_chars
        '{{ name }}: {{ description }} ({% if north == 0 and east == 0 and south == 0 and west == 0 %}here{% else %}{%if north > 0 %}{{ north }}n {% endif %}{% if east > 0 %}{{ east }}e {% endif %}{% if south > 0 %}{{ south }}s {% endif %}{% if west > 0 %}{{ west }}w {% endif %}{% endif %})',
    this.noQuestsLabel = 'No quests have been started yet.',
  }) : textStyleSettings = textStyleSettings ??
            TextStyleSettings(
              fontSize: 24,
              colorValue: Colors.black.serializableColor,
              backgroundColorValue: Colors.yellow.serializableColor,
              fontWeightValue: FontWeight.normal.value,
              fontStyle: FontStyle.normal,
            );

  /// Create an instance from a JSON object.
  factory Project.fromJson(final Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  /// Load an instance from [file].
  factory Project.fromFile(final File file) {
    final source = file.readAsStringSync();
    final json = jsonDecode(source) as Map<String, dynamic>;
    return Project.fromJson(json);
  }

  /// The name of this project.
  String name;

  /// The file where the database will be stored.
  final String databaseFilename;

  /// The name of the directory where sounds will be stored.
  ///
  /// The [soundsDirectoryName] will be relative to the main project directory.
  final String soundsDirectoryName;

  /// The music to use for the main menu.
  SerializableSoundReference? mainMenuMusic;

  /// The fade in time for [mainMenuMusic].
  Duration? mainMenuMusicFadeIn;

  /// The fade out time for [mainMenuMusic].
  Duration? mainMenuMusicFadeOut;

  /// The sound to use when selecting items in menus.
  SerializableSoundReference? menuSelectSound;

  /// The sound to use when activating items in menus.
  SerializableSoundReference? menuActivateSound;

  /// The label for the new player menu item.
  String newPlayerLabel;

  /// The earcon for the new player menu item.
  SerializableSoundReference? newPlayerEarcon;

  /// The label for the saved players menu item.
  String savedPlayersLabel;

  /// The earcon for the saved players menu item.
  SerializableSoundReference? savedPlayersEarcon;

  /// The name of the organisation that owns this game.
  String organisationName;

  /// The name of the app.
  ///
  /// The [organisationName] and the [appName] will be combined to provide the
  /// path where game options are stored.
  String appName;

  /// The number to divide the volumes of sounds by when pausing the game.
  int pauseSoundsVolumeReduction;

  /// The title of the pause menu.
  String pauseMenuTitle;

  /// The music to play for the pause menu.
  SerializableSoundReference? pauseMenuMusic;

  /// The format for entries in the player stats menu.
  String statMenuItemFormat;

  /// The text style to use.
  TextStyleSettings textStyleSettings;

  /// The format of the message spoken when examining room objects.
  String examineRoomObjectFormat;

  /// The message to show when no quests have been started yet.
  String noQuestsLabel;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
