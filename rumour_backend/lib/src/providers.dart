import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_player/rumour_player.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'providers.g.dart';

/// The default description.
const _defaultDescription = 'Automatically created by the editor.';

/// Provide the app preferences.
@riverpod
Future<AppPreferences> appPreferences(final Ref ref) async {
  final preferences = SharedPreferencesAsync();
  final string = await preferences.getString(AppPreferences.preferencesKey);
  if (string == null) {
    return AppPreferences(recentFiles: []);
  }
  final json = jsonDecode(string) as Map<String, dynamic>;
  return AppPreferences.fromJson(json);
}

/// Provide the recently-opened files.
@riverpod
Future<List<File>> recentFiles(final Ref ref) async {
  final preferences = await ref.watch(appPreferencesProvider.future);
  final files = preferences.recentFiles
      .map(File.new)
      .where((final file) => file.existsSync())
      .toList()
    ..sort(
      (final a, final b) =>
          a.statSync().changed.compareTo(b.statSync().changed),
    );
  return files;
}

/// Provide The current project context.
@Riverpod(keepAlive: true)
class CurrentProjectContext extends _$CurrentProjectContext {
  /// Build the initial value.
  @override
  ProjectContext? build() => null;

  /// Set the [state].
  // ignore: use_setters_to_change_properties
  void setProjectContext(final ProjectContext projectContext) =>
      state = projectContext;
}

/// Provide the current project context.
@riverpod
ProjectContext projectContext(final Ref ref) {
  final project = ref.watch(currentProjectContextProvider);
  if (project == null) {
    throw StateError('No project has been loaded.');
  }
  if (!project.soundsDirectory.existsSync()) {
    project.soundsDirectory.createSync(recursive: true);
  }
  return project;
}

/// Provide the database.
@riverpod
AppDatabase database(final Ref ref) {
  final projectContext = ref.watch(projectContextProvider);
  return projectContext.database;
}

/// Provide the current project.
@riverpod
Project project(final Ref ref) {
  final projectContext = ref.watch(projectContextProvider);
  return projectContext.project;
}

/// The text style to use for widgets.
@riverpod
TextStyle projectTextStyle(final Ref ref) {
  final project = ref.watch(projectProvider);
  return project.textStyleSettings.textStyle;
}

/// Provide a singe sound reference.
@riverpod
Future<SoundReference> soundReference(final Ref ref, final int id) async {
  final database = ref.watch(databaseProvider);
  return database.managers.soundReferences
      .filter((final f) => f.id.equals(id))
      .getSingle();
}

/// Provide all zones.
@riverpod
Future<List<Zone>> zones(final Ref ref) async {
  final database = ref.watch(databaseProvider);
  final manager = database.managers.zones;
  final zones = await manager
      .orderBy(
        (final o) => o.name.asc(),
      )
      .get();
  if (zones.isEmpty) {
    zones.add(
      await manager.createReturning(
        (final f) => f(
          name: 'The First Zone',
          description: _defaultDescription,
        ),
      ),
    );
  }
  return zones;
}

/// Provide a single zone with the given [id].
@riverpod
Future<Zone> zone(final Ref ref, final int id) async {
  final database = ref.watch(databaseProvider);
  return database.managers.zones
      .filter((final f) => f.id.equals(id))
      .getSingle();
}

/// Provide all rooms with the given [zoneId].
@riverpod
Future<List<Room>> rooms(final Ref ref, final int zoneId) async {
  final database = ref.watch(databaseProvider);
  final manager = database.managers.rooms;
  final rooms = await manager
      .filter((final f) => f.zoneId.id.equals(zoneId))
      .orderBy((final o) => o.name.asc())
      .get();
  if (rooms.isEmpty) {
    final surfaces = await ref.read(roomSurfacesProvider.future);
    rooms.add(
      await manager.createReturning(
        (final f) => f(
          name: 'The First Room',
          description: _defaultDescription,
          surfaceId: surfaces.first.id,
          zoneId: zoneId,
        ),
      ),
    );
  }
  return rooms;
}

/// Provide a single room by its [id].
@riverpod
Future<Room> room(final Ref ref, final int id) async {
  final database = ref.watch(databaseProvider);
  return database.managers.rooms
      .filter((final f) => f.id.equals(id))
      .getSingle();
}

/// Provide all room surfaces.
@riverpod
Future<List<RoomSurface>> roomSurfaces(final Ref ref) async {
  final database = ref.watch(databaseProvider);
  final manager = database.managers.roomSurfaces;
  final surfaces = await manager.orderBy((final o) => o.name.asc()).get();
  if (surfaces.isEmpty) {
    surfaces.add(
      await manager.createReturning(
        (final f) => f(
          name: 'Default Room Surface',
          description: _defaultDescription,
        ),
      ),
    );
  }
  return surfaces;
}

/// Provide a single room surface by its [id].
@riverpod
Future<RoomSurface> roomSurface(final Ref ref, final int id) {
  final database = ref.watch(databaseProvider);
  return database.managers.roomSurfaces
      .filter((final f) => f.id.equals(id))
      .getSingle();
}

/// Provide room objects for a given room and coordinates.
@riverpod
Future<List<RoomObject>> roomObjects(
  final Ref ref,
  final int roomId,
  final Point<int> coordinates,
) {
  final database = ref.watch(databaseProvider);
  return database.managers.roomObjects
      .filter(
        (final t) =>
            t.roomId.id.equals(roomId) &
            t.x.equals(coordinates.x) &
            t.y.equals(coordinates.y),
      )
      .get();
}

/// Provide a single room object.
@riverpod
Future<RoomObject> roomObject(final Ref ref, final int id) {
  final database = ref.watch(databaseProvider);
  return database.managers.roomObjects
      .filter(
        (final f) => f.id.equals(id),
      )
      .getSingle();
}

/// Provide a room exit.
@riverpod
Future<RoomExit> roomExit(final Ref ref, final int id) {
  final database = ref.watch(databaseProvider);
  return database.managers.roomExits
      .filter((final f) => f.id.equals(id))
      .getSingle();
}

/// Provide all objects in a room.
@riverpod
Future<List<RoomObject>> objectsInRoom(final Ref ref, final int id) {
  final database = ref.watch(databaseProvider);
  return database.managers.roomObjects
      .filter((final f) => f.roomId.id.equals(id))
      .orderBy(
        (final o) => o.name.asc(),
      )
      .get();
}

/// Provide a room object context.
@riverpod
Future<RoomObjectContext> roomObjectContext(final Ref ref, final int id) async {
  final object = await ref.watch(roomObjectProvider(id).future);
  final room = await ref.watch(roomProvider(object.roomId).future);
  return RoomObjectContext(roomObject: object, room: room);
}

/// Provide all player classes.
@riverpod
Future<List<PlayerClass>> playerClasses(final Ref ref) async {
  final database = ref.watch(databaseProvider);
  final managers = database.managers;
  final classes = await managers.playerClasses
      .orderBy(
        (final o) => o.name.asc(),
      )
      .get();
  if (classes.isEmpty) {
    final zones = await ref.read(zonesProvider.future);
    final zone = zones.first;
    final rooms = await ref.read(roomsProvider(zone.id).future);
    classes.add(
      await managers.playerClasses.createReturning(
        (final o) => o(
          name: 'Common Players',
          description: _defaultDescription,
          roomId: rooms.first.id,
        ),
      ),
    );
  }
  return classes;
}

/// Provide a single player class.
@riverpod
Future<PlayerClass> playerClass(final Ref ref, final int id) {
  final database = ref.watch(databaseProvider);
  return database.managers.playerClasses
      .filter(
        (final f) => f.id.equals(id),
      )
      .getSingle();
}

/// Provide the game options directory.
@riverpod
Future<Directory> gameOptionsDirectory(final Ref ref) async {
  final projectContext = ref.watch(projectContextProvider);
  final project = projectContext.project;
  final documentsDirectory = await getApplicationDocumentsDirectory();
  final directory = Directory(
    path.join(
      documentsDirectory.path,
      project.organisationName,
      project.appName,
    ),
  );
  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  }
  return directory;
}

/// Provide the players which have been created.
@riverpod
Future<List<GamePlayerFile>> gamePlayers(final Ref ref) async {
  final directory = await ref.watch(gamePlayersDirectoryProvider.future);
  return directory
      .listSync()
      .whereType<File>()
      .where((final file) => path.extension(file.path) == '.player')
      .map(GamePlayerFile.fromFile)
      .toList();
}

/// Provide the game players directory.
@riverpod
Future<Directory> gamePlayersDirectory(final Ref ref) async {
  final optionsDirectory = await ref.watch(gameOptionsDirectoryProvider.future);
  final directory = Directory(path.join(optionsDirectory.path, 'players'));
  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  }
  return directory;
}

/// Provide a whole game player context from [id].
@riverpod
Future<GamePlayerContext> gamePlayerContext(
  final Ref ref,
  final String id,
) async {
  final players = await ref.watch(gamePlayersProvider.future);
  final gamePlayerFile = players.firstWhere((final e) => e.id == id);
  final gamePlayer = gamePlayerFile.gamePlayer;
  final room = await ref.watch(roomProvider(gamePlayer.roomId).future);
  final zone = await ref.watch(zoneProvider(room.zoneId).future);
  final zoneMusicId = zone.musicId;
  final zoneMusic = zoneMusicId == null
      ? null
      : await ref.watch(soundReferenceProvider(zoneMusicId).future);
  final roomAmbianceId = room.ambianceId;
  final roomAmbiance = roomAmbianceId == null
      ? null
      : await ref.watch(soundReferenceProvider(roomAmbianceId).future);
  final roomSurface =
      await ref.watch(roomSurfaceProvider(room.surfaceId).future);
  final footstepsId = roomSurface.footstepSoundId;
  final footsteps = footstepsId == null
      ? null
      : await ref.watch(soundReferenceProvider(footstepsId).future);
  final wallSoundId = roomSurface.wallSoundI;
  final wallSound = wallSoundId == null
      ? null
      : await ref.watch(soundReferenceProvider(wallSoundId).future);
  return GamePlayerContext(
    gamePlayerFile: gamePlayerFile,
    room: room,
    zone: zone,
    zoneMusic: zoneMusic,
    roomAmbiance: roomAmbiance,
    roomSurface: roomSurface,
    footsteps: footsteps,
    wallSound: wallSound,
  );
}

/// Provide ambiances for a room with the given [id].
@riverpod
Future<List<PositionedSoundReference>> roomAmbiances(
  final Ref ref,
  final int id,
) async {
  final room = await ref.watch(roomProvider(id).future);
  final ambiances = <PositionedSoundReference>[];
  final objects = await ref.watch(objectsInRoomProvider(id).future);
  final roomAmbianceId = room.ambianceId;
  if (roomAmbianceId != null) {
    ambiances.add(
      PositionedSoundReference(
        soundReference:
            await ref.watch(soundReferenceProvider(roomAmbianceId).future),
      ),
    );
  }
  for (final object in objects) {
    final ambianceId = object.ambianceId;
    if (ambianceId != null) {
      ambiances.add(
        PositionedSoundReference(
          soundReference:
              await ref.watch(soundReferenceProvider(ambianceId).future),
          position:
              SoundPosition3d(object.x.toDouble(), object.y.toDouble(), 0.0),
        ),
      );
    }
  }
  return ambiances;
}

/// Build the project context.
@riverpod
Stream<String> buildProject(final Ref ref) async* {
  final projectContext = ref.watch(projectContextProvider);
  final database = ref.watch(databaseProvider);
  final project = ref.watch(projectProvider);
  yield 'Building ${project.name}';
  final flutterProjectPath = path.join(
    projectContext.directory.path,
    project.appName,
  );
  final outputDirectory = Directory(flutterProjectPath);
  if (outputDirectory.existsSync()) {
    yield 'Removing directory ${outputDirectory.path}.';
    outputDirectory.deleteSync(recursive: true);
  }
  final executable = Platform.isWindows ? 'flutter.bat' : 'flutter';
  final flutterCreate = await Process.run(
    executable,
    [
      'create',
      '--org',
      project.organisationName,
      '--description',
      'Game created by Rumour on ${DateTime.now()}.',
      flutterProjectPath,
    ],
  );
  if (flutterCreate.exitCode != 0) {
    yield 'Error:';
    yield 'stdout: ${flutterCreate.stdout}';
    yield 'stderr: ${flutterCreate.stderr}';
    return;
  }
  yield 'Flutter project created at $flutterProjectPath.';
  final pubAdd = await Process.run(
    executable,
    [
      'pub',
      'add',
      'rumour_player:{"git":{"url":"https://github.com/chrisnorman7/rumour.git","path":"rumour_player"}}',
      '-C',
      flutterProjectPath,
    ],
  );
  if (pubAdd.exitCode != 0) {
    yield 'Error:';
    yield 'stdout: ${pubAdd.stdout}';
    yield 'stderr: ${pubAdd.stderr}';
    return;
  }
  yield 'Depending on `rumour_player`.';
  await Process.run(
    executable,
    [
      'pub',
      'get',
      '-C',
      flutterProjectPath,
    ],
  );
  final pubspecPath = path.join(flutterProjectPath, 'pubspec.yaml');
  final pubspecFile = File(pubspecPath);
  final buffer = StringBuffer();
  for (final line in pubspecFile.readAsLinesSync()) {
    if (!line.trim().startsWith('#')) {
      buffer.writeln(line);
    }
  }
  yield 'Loading sound references from database...';
  final soundReferences = await database.managers.soundReferences
      .orderBy(
        (final o) => o.path.asc(),
      )
      .get();
  yield 'Sound references: ${soundReferences.length}.';
  final files = <String>[];
  final directories = <String, List<String>>{};
  const soundsDirectoryName = 'sounds';
  final soundsPath = path.join(outputDirectory.path, soundsDirectoryName);
  final pretendSoundReferences = [
    project.mainMenuMusic,
    project.menuActivateSound,
    project.menuSelectSound,
    project.newPlayerEarcon,
    project.savedPlayersEarcon,
  ];
  for (final soundReference in <SoundReference>[
    ...soundReferences,
    for (final possibility in pretendSoundReferences)
      if (possibility != null) possibility.getSoundReference(),
  ]) {
    final p = soundReference.path;
    final referencePath = path.join(projectContext.soundsDirectory.path, p);
    final file = File(referencePath);
    final directory = Directory(referencePath);
    if (files.contains(p) || directories.containsKey(p)) {
      continue;
    }
    final outputPath = path.join(soundsPath, p);
    if (file.existsSync()) {
      yield 'File: $p.';
      files.add(p);
      final newFile = File(outputPath);
      newFile.parent.createSync(recursive: true);
      newFile.writeAsBytesSync(file.readAsBytesSync());
    } else if (directory.existsSync()) {
      yield 'Directory: $p.';
      Directory(outputPath).createSync(recursive: true);
      final directoryFiles = directory.listSync().whereType<File>().where(
            (final file) =>
                soundFileExtensions.contains(path.extension(file.path)),
          );
      directories[p] = directoryFiles
          .map((final file) => path.join(p, path.basename(file.path)))
          .toList();
      for (final directoryFile in directoryFiles) {
        File(path.join(outputPath, path.basename(directoryFile.path)))
            .writeAsBytesSync(
          directoryFile.readAsBytesSync(),
        );
      }
    } else {
      // ignore: lines_longer_than_80_chars
      yield 'Error: The sound reference $p (#${soundReference.id}) does not match any file or directory.';
      return;
    }
  }
  buffer.writeln('  assets:');
  for (final key in files) {
    buffer.writeln('    - $soundsDirectoryName/${key.replaceAll(r'\', '/')}');
  }
  for (final MapEntry(:key, value: filenames) in directories.entries) {
    buffer.writeln('    # $soundsDirectoryName/$key');
    for (final name in filenames) {
      buffer.writeln(
        '    - $soundsDirectoryName/${name.replaceAll(r'\', '/')}',
      );
    }
  }
  yield 'Sounds written to pubspec.';
  const loaderFilename = 'loader.json';
  const assetsDirectoryName = 'assets';
  final projectFilename = path.basename(projectContext.file.path);
  final loader = ProjectContextLoader(
    projectAssetKey: '$assetsDirectoryName/$projectFilename',
    directories: directories,
  );
  yield 'Copying data files.';
  final databaseBytes =
      File(path.join(projectContext.directory.path, project.databaseFilename))
          .readAsBytesSync();
  final assetsDirectory = Directory(
    path.join(outputDirectory.path, assetsDirectoryName),
  );
  if (!assetsDirectory.existsSync()) {
    assetsDirectory.createSync(recursive: true);
  }
  final projectJson = project.toJson();
  projectJson['databaseFilename'] =
      '$assetsDirectoryName/${project.databaseFilename}';
  for (final MapEntry(key: filename, value: contents) in {
    project.databaseFilename: databaseBytes,
    projectFilename: jsonEncode(projectJson),
    loaderFilename: jsonEncode(loader),
  }.entries) {
    final file = File(path.join(assetsDirectory.path, filename));
    buffer.writeln('    - $assetsDirectoryName/$filename');
    if (contents is List<int>) {
      file.writeAsBytesSync(contents);
    } else if (contents is String) {
      file.writeAsStringSync(contents);
    } else {
      throw UnsupportedError(
        'Cannot write file $filename with contents $contents.',
      );
    }
  }
  pubspecFile.writeAsStringSync(buffer.toString());
  buffer.clear();
  final mainFilename = path.join(flutterProjectPath, 'lib', 'main.dart');
  buffer
    ..writeln("import 'package:rumour_player/rumour_player.dart';")
    ..writeln("import 'package:flutter/material.dart';")
    ..writeln()
    ..writeln('void main() async {')
    ..writeln('  runApp(')
    ..writeln('    const ProjectContextApp(')
    ..writeln("      title: '${project.name.replaceAll("'", r"\'")}',")
    ..writeln("      assetKey: '$assetsDirectoryName/$loaderFilename',")
    ..writeln('    ),')
    ..writeln('  );')
    ..writeln('}');
  File(mainFilename).writeAsStringSync(buffer.toString());
  yield 'Wrote `lib/main.dart`.';
  yield 'Done.';
}

/// Provide the project data directory.
@riverpod
Future<Directory> projectDataDirectory(
  final Ref ref,
  final Project project,
) async {
  final cacheDirectory = await getApplicationCacheDirectory();
  final directory = Directory(
    path.join(
      cacheDirectory.path,
      project.organisationName,
      project.appName,
    ),
  );
  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  }
  return directory;
}

/// Provide all game stats.
@riverpod
Future<List<GameStat>> gameStats(final Ref ref) async {
  final database = ref.watch(databaseProvider);
  final manager = database.managers.gameStats;
  final stats = await manager.orderBy((final o) => o.name.asc()).get();
  if (stats.isEmpty) {
    final gold = await manager.createReturning(
      (final f) => f(
        name: 'Gold',
        description: 'How much gold is currently being carried.',
      ),
    );
    final maxHealth = await manager.createReturning(
      (final f) => f(
        name: 'Max health',
        description: 'The maximum possible health.',
        isVisible: const Value(false),
      ),
    );
    final health = await manager.createReturning(
      (final f) => f(
        name: 'Health',
        description: 'How healthy something is.',
        maxGameStatId: Value(maxHealth.id),
      ),
    );
    stats.addAll([
      gold,
      maxHealth,
      health,
    ]);
  }
  return stats;
}

/// Provide all visible game stats.
@riverpod
Future<List<GameStat>> visibleGameStats(final Ref ref) async {
  final stats = await ref.watch(gameStatsProvider.future);
  return stats.where((final s) => s.isVisible).toList();
}

/// Return a player class game stat for the given [playerClassId] and
/// [gameStatId].
@riverpod
Future<PlayerClassGameStat?> playerClassGameStat(
  final Ref ref,
  final int playerClassId,
  final int gameStatId,
) async {
  final database = ref.watch(databaseProvider);
  return database.managers.playerClassGameStats
      .filter(
        (final f) =>
            f.gameStatId.id.equals(gameStatId) &
            f.playerClassId.id.equals(playerClassId),
      )
      .getSingleOrNull();
}

/// Provide game stats for a player.
@riverpod
Future<Map<int, int>> gamePlayerStats(final Ref ref, final String id) async {
  final gamePlayerContext = await ref.watch(
    gamePlayerContextProvider(id).future,
  );
  final player = gamePlayerContext.gamePlayer;
  final playerStats = player.stats;
  final gameStats = await ref.watch(gameStatsProvider.future);
  for (final stat in gameStats) {
    if (!playerStats.containsKey(stat.id)) {
      final value = await ref.watch(
        playerClassMaxStatProvider(stat.id, player.classId).future,
      );
      playerStats[stat.id] = value;
    }
  }
  return playerStats;
}

/// Provide a single game stat.
@riverpod
Future<GameStatContext> gameStatContext(final Ref ref, final int id) async {
  final database = ref.watch(databaseProvider);
  final manager = database.managers.gameStats;
  final stat = await manager.filter((final f) => f.id.equals(id)).getSingle();
  final maxGameStatId = stat.maxGameStatId;
  if (maxGameStatId == null) {
    return GameStatContext(gameStat: stat);
  }
  final value =
      await manager.filter((final f) => f.id.equals(maxGameStatId)).getSingle();
  return GameStatContext(gameStat: stat, maxValueGameStat: value);
}

/// Provide the maximum value for a player game stat.
@riverpod
Future<int> playerClassMaxStat(
  final Ref ref,
  final int gameStatId,
  final int playerClassId,
) async {
  final playerClassGameStat = await ref.watch(
    playerClassGameStatProvider(
      playerClassId,
      gameStatId,
    ).future,
  );
  if (playerClassGameStat != null) {
    return playerClassGameStat.defaultValue;
  }
  final gameStat = await ref.watch(gameStatContextProvider(gameStatId).future);
  return gameStat.gameStat.defaultValue;
}

/// Provide a single player stat.
@riverpod
Future<int> gamePlayerStat(
  final Ref ref,
  final String playerId,
  final int gameStatId,
) async {
  final stats = await ref.watch(gamePlayerStatsProvider(playerId).future);
  final value = stats[gameStatId];
  if (value != null) {
    return value;
  }
  final gamePlayerContext = await ref.watch(
    gamePlayerContextProvider(playerId).future,
  );
  final maxValue = await ref.watch(
    playerClassMaxStatProvider(gameStatId, gamePlayerContext.gamePlayer.classId)
        .future,
  );
  return maxValue;
}

/// Provide room surface costs.
@riverpod
Future<List<RoomSurfaceCost>> roomSurfaceCosts(
  final Ref ref,
  final int roomSurfaceId,
) {
  final database = ref.watch(databaseProvider);
  return database.managers.roomSurfaceCosts
      .filter(
        (final f) => f.roomSurfaceId.id.equals(roomSurfaceId),
      )
      .get();
}

/// Possibly provide a room surface cost.
@riverpod
Future<RoomSurfaceCost?> possibleRoomSurfaceCost(
  final Ref ref,
  final int roomSurfaceId,
  final int gameStatId,
) async {
  final database = ref.watch(databaseProvider);
  return database.managers.roomSurfaceCosts
      .filter(
        (final f) =>
            f.roomSurfaceId.id.equals(roomSurfaceId) &
            f.gameStatId.id.equals(gameStatId),
      )
      .getSingleOrNull();
}

/// Provide a single room surface cost.
@riverpod
Future<RoomSurfaceCost> roomSurfaceCost(final Ref ref, final int id) {
  final database = ref.watch(databaseProvider);
  return database.managers.roomSurfaceCosts
      .filter(
        (final f) => f.id.equals(id),
      )
      .getSingle();
}

/// Provide room surface boosts.
@riverpod
Future<List<RoomSurfaceBoost>> roomSurfaceBoosts(final Ref ref, final int id) {
  final database = ref.watch(databaseProvider);
  return database.managers.roomSurfaceBoosts
      .filter(
        (final f) => f.roomSurfaceId.id.equals(id),
      )
      .get();
}

/// Possibly provide a room surface boost.
@riverpod
Future<RoomSurfaceBoost?> possibleRoomSurfaceBoost(
  final Ref ref,
  final int roomSurfaceId,
  final int gameStatId,
) async {
  final database = ref.watch(databaseProvider);
  return database.managers.roomSurfaceBoosts
      .filter(
        (final f) =>
            f.roomSurfaceId.id.equals(roomSurfaceId) &
            f.gameStatId.id.equals(gameStatId),
      )
      .getSingleOrNull();
}

/// Provide a single room surface boost.
@riverpod
Future<RoomSurfaceBoost> roomSurfaceBoost(final Ref ref, final int id) {
  final database = ref.watch(databaseProvider);
  return database.managers.roomSurfaceBoosts
      .filter(
        (final f) => f.id.equals(id),
      )
      .getSingle();
}

/// Provide a game stat value.
@riverpod
Future<GameStatValueContext> gameStatValueContext(
  final Ref ref,
  final String playerId,
  final int gameStatId,
) async {
  final gameStatContext = await ref.watch(
    gameStatContextProvider(gameStatId).future,
  );
  final value = await ref.watch(
    gamePlayerStatProvider(playerId, gameStatId).future,
  );
  final maxValueGameStat = gameStatContext.maxValueGameStat;
  final int? maxValue;
  if (maxValueGameStat != null) {
    maxValue = await ref.watch(
      gamePlayerStatProvider(playerId, maxValueGameStat.id).future,
    );
  } else {
    maxValue = null;
  }
  return GameStatValueContext(
    gameStat: gameStatContext.gameStat,
    value: value,
    maxValueGameStat: maxValueGameStat,
    maxValue: maxValue,
  );
}

/// Provide all random sounds for an object with the given [roomObjectId].
@riverpod
Future<List<RoomObjectRandomSound>> roomObjectRandomSounds(
  final Ref ref,
  final int roomObjectId,
) {
  final database = ref.watch(databaseProvider);
  return database.managers.roomObjectRandomSounds
      .filter(
        (final f) => f.roomObjectId.id.equals(roomObjectId),
      )
      .get();
}

/// Provide a single random sound by [id].
@riverpod
Future<RoomObjectRandomSound> roomObjectRandomSound(
  final Ref ref,
  final int id,
) {
  final database = ref.watch(databaseProvider);
  return database.managers.roomObjectRandomSounds
      .filter(
        (final f) => f.id.equals(id),
      )
      .getSingle();
}

/// Provide all random sounds for a room with the given [roomId].
@riverpod
Future<List<RoomObjectRandomSoundContext>> roomObjectRandomSoundsForRoom(
  final Ref ref,
  final int roomId,
) async {
  final database = ref.watch(databaseProvider);
  final randomSounds = await database.managers.roomObjectRandomSounds
      .filter(
        (final f) => f.roomObjectId.roomExitId.id.equals(roomId),
      )
      .get();
  final contexts = <RoomObjectRandomSoundContext>[];
  for (final randomSound in randomSounds) {
    final roomObject = await ref.watch(
      roomObjectProvider(randomSound.roomObjectId).future,
    );
    final sound = await ref.watch(
      soundReferenceProvider(randomSound.soundId).future,
    );
    contexts.add(
      RoomObjectRandomSoundContext(
        randomSound: randomSound,
        roomObject: roomObject,
        sound: sound,
      ),
    );
  }
  return contexts;
}

/// Get visible room objects in a room with the given [roomId].
@riverpod
Future<List<RoomObject>> visibleRoomObjects(
  final Ref ref,
  final int roomId,
) async {
  final roomObjects = await ref.watch(objectsInRoomProvider(roomId).future);
  return roomObjects.where((final o) => o.visible).toList();
}

/// Provide a command.
@riverpod
Future<Command> command(final Ref ref, final int id) {
  final database = ref.watch(databaseProvider);
  return database.managers.commands
      .filter(
        (final f) => f.id.equals(id),
      )
      .getSingle();
}

/// Provide a single call command.
@riverpod
Future<CommandCaller> commandCaller(final Ref ref, final int id) {
  final database = ref.watch(databaseProvider);
  return database.managers.commandCallers
      .filter((final f) => f.id.equals(id))
      .getSingle();
}

/// Provide a command caller by [callingCommandId].
@riverpod
Future<CommandCaller?> commandCallerFromParentCommandId(
  final Ref ref,
  final int callingCommandId,
) {
  final database = ref.watch(databaseProvider);
  return database.managers.commandCallers
      .filter(
        (final f) => f.parentCommandId.id.equals(callingCommandId),
      )
      .getSingleOrNull();
}

/// Provide all command callers for the room object with the given [id].
@riverpod
Future<List<RoomObjectCommandCaller>> roomObjectCommandCallers(
  final Ref ref,
  final int id,
) {
  final database = ref.watch(databaseProvider);
  return database.managers.roomObjectCommandCallers
      .filter((final f) => f.roomObjectId.id.equals(id))
      .orderBy(
        (final o) => o.name.asc(),
      )
      .get();
}

/// Provide a single room object command caller.
@riverpod
Future<RoomObjectCommandCaller> roomObjectCommandCaller(
  final Ref ref,
  final int id,
) {
  final database = ref.watch(databaseProvider);
  return database.managers.roomObjectCommandCallers
      .filter((final f) => f.id.equals(id))
      .getSingle();
}
