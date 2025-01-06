import 'dart:convert';
import 'dart:io';

import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
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
  });

  /// Load an instance from [file].
  ProjectContext.fromFile(this.file) : database = AppDatabase(file: file);

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
    final LoadMode loadMode = LoadMode.memory,
    final bool looping = false,
    final Duration loopingStart = Duration.zero,
    final bool paused = false,
    final SoundPosition position = unpanned,
  }) {
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
    return Sound(
      path: fullPath,
      soundType: SoundType.file,
      destroy: destroy,
      loadMode: loadMode,
      looping: looping,
      loopingStart: loopingStart,
      paused: paused,
      position: position,
      volume: soundReference.volume,
    );
  }

  /// Get a sound path from [soundPath].
  String getSoundPath(final String soundPath) =>
      path.relative(soundPath, from: soundsDirectory.path);
}
