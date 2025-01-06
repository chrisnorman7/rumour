import 'dart:convert';
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

/// A project.
@JsonSerializable()
class Project {
  /// Create an instance.
  Project({
    this.name = 'Untitled Project',
    this.databaseFilename = 'db.sqlite3',
    this.soundsDirectoryName = 'sounds',
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

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
