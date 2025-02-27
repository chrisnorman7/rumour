import 'dart:convert';
import 'dart:io';

import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:jinja/jinja.dart';
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

  /// The jinja environment to use.
  Environment get jinjaEnvironment => Environment(
        filters: {
          'randomInt': (final int a, final int b) => random.nextInt(b) + a,
          'floor': (final double a) => a.floor(),
        },
        globals: {
          'project': project,
          'projectContext': this,
          'now': DateTime.now(),
        },
      );

  /// Render [template] with [rumourTemplate] according to [value].
  String renderTemplate<T>({
    required final RumourTemplate<T> rumourTemplate,
    required final Template template,
    required final T value,
  }) {
    try {
      return template.render(rumourTemplate.getLocals(value));
      // ignore: avoid_catches_without_on_clauses
    } catch (e, s) {
      return '$e\n$s';
    }
  }

  /// Render [string] with [rumourTemplate] according to [value].
  ///
  /// This function uses [renderTemplate] under the hood.
  String renderString<T>({
    required final RumourTemplate<T> rumourTemplate,
    required final String string,
    required final T value,
  }) {
    try {
      final template = jinjaEnvironment.fromString(string);
      return renderTemplate(
        rumourTemplate: rumourTemplate,
        template: template,
        value: value,
      );
      // ignore: avoid_catches_without_on_clauses
    } catch (e, s) {
      return '$e\n$s';
    }
  }

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
    return path
        .join(project.soundsDirectoryName, key)
        .replaceAll(r'\', '/')
        .asSound(
          destroy: destroy,
          loadMode: soundReference.loadMode,
          looping: looping,
          loopingStart: loopingStart,
          paused: paused,
          position: position,
          volume: soundReference.volume,
        );
  }

  /// Get all sounds that match [soundReference].
  List<Sound> getSounds({
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
      final List<File> soundFiles;
      final directory = Directory(fullPath);
      if (directory.existsSync()) {
        final files = directory.listSync().whereType<File>().toList();
        if (files.isEmpty) {
          throw StateError('The directory $fullPath is empty.');
        }
        soundFiles = files;
      } else {
        soundFiles = [File(fullPath)];
      }
      return soundFiles
          .map(
            (final file) => file.asSound(
              destroy: destroy,
              loadMode: soundReference.loadMode,
              looping: looping,
              loopingStart: loopingStart,
              paused: paused,
              position: position,
              volume: soundReference.volume,
            ),
          )
          .toList();
    }
    final keys = directories[soundReference.path];
    final List<String> soundKeys;
    if (keys == null) {
      soundKeys = [soundReference.path];
    } else {
      soundKeys = keys;
    }
    return soundKeys
        .map(
          (final key) => path
              .join(project.soundsDirectoryName, key)
              .replaceAll(r'\', '/')
              .asSound(
                destroy: destroy,
                loadMode: soundReference.loadMode,
                looping: looping,
                loopingStart: loopingStart,
                paused: paused,
                position: position,
                volume: soundReference.volume,
              ),
        )
        .toList();
  }

  /// Get a sound reference with the given [id].
  ///
  /// If [id] is `null`, then `null` will be returned.
  Future<SoundReference?> maybeGetSoundReference(final int? id) async {
    if (id == null) {
      return null;
    }
    return database.managers.soundReferences
        .filter(
          (final f) => f.id.equals(id),
        )
        .getSingle();
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

  /// Maybe get a [Sound] instance from the [id] of a [SoundReference].
  Future<Sound?> maybeGetSoundFromSoundReferenceId({
    required final int? id,
    required final bool destroy,
    final bool looping = false,
    final Duration loopingStart = Duration.zero,
    final bool paused = false,
    final SoundPosition position = unpanned,
  }) async {
    if (id == null) {
      return null;
    }
    return maybeGetSound(
      soundReference: await maybeGetSoundReference(id),
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
