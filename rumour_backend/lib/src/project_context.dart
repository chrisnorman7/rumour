import 'dart:convert';
import 'dart:io';

import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:path/path.dart' as path;
import 'package:rumour_backend/rumour_backend.dart';

/// The project context class.
class ProjectContext {
  /// Create an instance.
  const ProjectContext({
    required this.file,
    required this.database,
    this.loader,
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
      final json = jsonDecode(data) as Map<String, dynamic>;
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

  /// The loader which created this project context.
  ///
  /// If [loader] is not `null`, then [SoundType.asset] will be used when
  /// loading sounds.
  final ProjectContextLoader? loader;

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
    final directories = loader?.directories;
    if (directories == null) {
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
    }
    final keys = directories[soundReference.path];
    final String key;
    if (keys == null) {
      key = soundReference.path;
    } else {
      key = keys.randomElement(random);
    }
    return key.asSound(
      destroy: destroy,
      soundType: SoundType.asset,
      loadMode: soundReference.loadMode,
      looping: looping,
      loopingStart: loopingStart,
      paused: paused,
      position: position,
      volume: soundReference.volume,
    );
  }

  /// Maybe call [getSound].
  Sound? maybeGetSound({
    required final SoundReference? soundReference,
    required final bool destroy,
    final bool looping = false,
    final Duration loopingStart = Duration.zero,
    final bool paused = false,
    final SoundPosition position = unpanned,
  }) {
    if (soundReference == null) {
      return null;
    }
    return getSound(
      soundReference: soundReference,
      destroy: destroy,
      looping: looping,
      loopingStart: loopingStart,
      paused: paused,
      position: position,
    );
  }

  /// Get a sound path from [soundPath].
  String getSoundPath(final String soundPath) =>
      path.relative(soundPath, from: soundsDirectory.path);
}
