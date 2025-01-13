import 'dart:convert';
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

import 'serializable_sound_reference.dart';

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
    this.organisationName = 'com.example',
    this.appName = 'game',
  });

  /// Create an instance from a JSON object.
  factory Project.fromJson(final Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  /// Load an instance from [file].
  factory Project.fromFile(final File file) {
    final source = file.readAsStringSync();
    final json = jsonDecode(source);
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

  /// The name of the organisation that owns this game.
  String organisationName;

  /// The name of the app.
  ///
  /// The [organisationName] and the [appName] will be combined to provide the
  /// path where game options are stored.
  String appName;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
