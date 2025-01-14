import 'dart:convert';
import 'dart:io';

import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:path/path.dart' as path;

import 'constants.dart';
import 'database/database.dart';
import 'json/project.dart';

/// The project context class.
class ProjectContext {
  /// Create an instance.
  const ProjectContext({
    required this.file,
    required this.database,
    this.soundType = SoundType.file,
  });

  /// Load an instance from [file].
  factory ProjectContext.fromFile(final File file) {
    final project = Project.fromFile(file);
    final databaseFile =
        File(path.join(file.parent.path, project.databaseFilename));
    final database = AppDatabase(file: databaseFile);
    return ProjectContext(file: file, database: database);
  }

  /// The file this context was loaded from.
  final File file;

  /// The project this context represents.
  Project get project {
    if (file.existsSync()) {
      final data = file.readAsStringSync();
      final json = jsonDecode(data);
      return Project.fromJson(json);
    }
    return Project();
  }

  /// The directory where the [project] resides.
  Directory get directory => file.parent;

  /// The directory where sounds reside.
  Directory get soundsDirectory =>
      Directory(path.join(directory.path, project.soundsDirectoryName));

  /// The database to use.
  final AppDatabase database;

  /// The sound type for this project.
  ///
  /// When editing projects, [soundType] is [SoundType.file].
  final SoundType soundType;

  /// Save the [project].
  void save(final Project project) {
    final json = project.toJson();
    final string = jsonEncode(json);
    file.writeAsStringSync(string);
  }

  /// Get a sound from [soundReference].
  Sound getSound({
    required final SoundReference soundReference,
    required final bool destroy,
    final bool looping = false,
    final Duration loopingStart = Duration.zero,
    final bool paused = false,
    final SoundPosition position = unpanned,
  }) {
    switch (soundType) {
      case SoundType.asset:
        throw UnimplementedError();
      case SoundType.file:
        final fullPath = path.join(soundsDirectory.path, soundReference.path);
        final File file;
        final directory = Directory(fullPath);
        if (directory.existsSync()) {
          final files = directory.listSync().whereType<File>().toList();
          if (files.isEmpty) {
            throw StateError('The directory $fullPath is empty.');
          }
          file = files.randomElement(random);
        } else {
          file = File(fullPath);
          if (!file.existsSync()) {
            throw StateError('The file $fullPath does not exist.');
          }
        }
        return file.asSound(
          destroy: destroy,
          loadMode: soundReference.loadMode,
          looping: looping,
          loopingStart: loopingStart,
          paused: paused,
          position: position,
          volume: soundReference.volume,
        );
      case SoundType.url:
        throw UnimplementedError();
      case SoundType.custom:
        throw UnimplementedError();
    }
  }

  /// Get a sound path from [soundPath].
  String getSoundPath(final String soundPath) =>
      path.relative(soundPath, from: soundsDirectory.path);
}
