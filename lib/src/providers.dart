import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'database/database.dart';
import 'game_options_context.dart';
import 'game_player_context.dart';
import 'json/app_preferences.dart';
import 'json/game_player.dart';
import 'json/project.dart';
import 'project_context.dart';
import 'room_object_context.dart';

part 'providers.g.dart';

/// Provide the app preferences.
@riverpod
Future<AppPreferences> appPreferences(final Ref ref) async {
  final preferences = SharedPreferencesAsync();
  final string = await preferences.getString(AppPreferences.preferencesKey);
  if (string == null) {
    return AppPreferences(recentFiles: []);
  }
  final json = jsonDecode(string);
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

/// The current project context.
ProjectContext? currentProjectContext;

/// Provide the current project context.
@riverpod
ProjectContext projectContext(final Ref ref) {
  final project = currentProjectContext;
  if (project == null) {
    throw StateError('No project has been loaded.');
  }
  if (!project.soundsDirectory.existsSync()) {
    project.soundsDirectory.createSync(recursive: true);
  }
  return project;
}

/// Provide the current project.
@riverpod
Project project(final Ref ref) {
  final projectContext = ref.watch(projectContextProvider);
  return projectContext.project;
}

/// Provide a singe sound reference.
@riverpod
Future<SoundReference> soundReference(final Ref ref, final int id) async {
  final projectContext = ref.watch(projectContextProvider);
  return projectContext.database.managers.soundReferences
      .filter((final f) => f.id.equals(id))
      .getSingle();
}

/// Provide all zones.
@riverpod
Future<List<Zone>> zones(final Ref ref) async {
  final projectContext = ref.watch(projectContextProvider);
  return projectContext.database.managers.zones
      .orderBy(
        (final o) => o.name.asc(),
      )
      .get();
}

/// Provide a single zone with the given [id].
@riverpod
Future<Zone> zone(final Ref ref, final int id) async {
  final projectContext = ref.watch(projectContextProvider);
  return projectContext.database.managers.zones
      .filter((final f) => f.id.equals(id))
      .getSingle();
}

/// Provide all rooms with the given [zoneId].
@riverpod
Future<List<Room>> rooms(final Ref ref, final int zoneId) async {
  final projectContext = ref.watch(projectContextProvider);
  return projectContext.database.managers.rooms
      .filter((final f) => f.zoneId.id.equals(zoneId))
      .orderBy((final o) => o.name.asc())
      .get();
}

/// Provide a single room by its [id].
@riverpod
Future<Room> room(final Ref ref, final int id) async {
  final projectContext = ref.watch(projectContextProvider);
  return projectContext.database.managers.rooms
      .filter((final f) => f.id.equals(id))
      .getSingle();
}

/// Provide all room surfaces.
@riverpod
Future<List<RoomSurface>> roomSurfaces(final Ref ref) {
  final projectContext = ref.watch(projectContextProvider);
  return projectContext.database.managers.roomSurfaces
      .orderBy((final o) => o.name.asc())
      .get();
}

/// Provide a single room surface by its [id].
@riverpod
Future<RoomSurface> roomSurface(final Ref ref, final int id) {
  final projectContext = ref.watch(projectContextProvider);
  return projectContext.database.managers.roomSurfaces
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
  final projectContext = ref.watch(projectContextProvider);
  return projectContext.database.managers.roomObjects
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
  final projectContext = ref.watch(projectContextProvider);
  return projectContext.database.managers.roomObjects
      .filter(
        (final f) => f.id.equals(id),
      )
      .getSingle();
}

/// Provide a room exit.
@riverpod
Future<RoomExit> roomExit(final Ref ref, final int id) {
  final projectContext = ref.watch(projectContextProvider);
  return projectContext.database.managers.roomExits
      .filter((final f) => f.id.equals(id))
      .getSingle();
}

/// Provide all objects in a room.
@riverpod
Future<List<RoomObject>> objectsInRoom(final Ref ref, final int id) {
  final projectContext = ref.watch(projectContextProvider);
  return projectContext.database.managers.roomObjects
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
  final projectContext = ref.watch(projectContextProvider);
  final managers = projectContext.database.managers;
  final classes = await managers.playerClasses
      .orderBy(
        (final o) => o.name.asc(),
      )
      .get();
  if (classes.isEmpty) {
    final zones = await ref.watch(zonesProvider.future);
    if (zones.isEmpty) {
      zones.add(
        await managers.zones.createReturning(
          (final o) => o(
            name: 'The First Zone',
            description: 'There is nothing to see.',
          ),
        ),
      );
    }
    final zone = zones.first;
    final rooms = await ref.watch(roomsProvider(zone.id).future);
    if (rooms.isEmpty) {
      final surfaces = await ref.watch(roomSurfacesProvider.future);
      if (surfaces.isEmpty) {
        surfaces.add(
          await managers.roomSurfaces.createReturning(
            (final o) => o(
              name: 'The First Surface',
              description:
                  'One small step for man, one massive step for mankind.',
            ),
          ),
        );
      }
      rooms.add(
        await managers.rooms.createReturning(
          (final o) => o(
            name: 'The First Room',
            description: 'You see nothing special.',
            surfaceId: surfaces.first.id,
            zoneId: zone.id,
          ),
        ),
      );
    }
    classes.add(
      await managers.playerClasses.createReturning(
        (final o) => o(
          name: 'Common Players',
          description: 'This class will be the default for new players.',
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
  final projectContext = ref.watch(projectContextProvider);
  return projectContext.database.managers.playerClasses
      .filter(
        (final f) => f.id.equals(id),
      )
      .getSingle();
}

/// Provide the game settings for the current [projectContext].
@riverpod
Future<GameOptionsContext> gameOptionsContext(final Ref ref) async {
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
  final file = File(path.join(directory.path, 'options.json'));
  return GameOptionsContext.fromFile(file);
}

/// Provide the players which have been created.
@riverpod
Future<List<GamePlayer>> gamePlayers(final Ref ref) async {
  final gameOptionsContext = await ref.watch(gameOptionsContextProvider.future);
  return gameOptionsContext.gameOptions.players;
}

/// Return a single player by its [id].
@riverpod
Future<GamePlayer> gamePlayer(final Ref ref, final String id) async {
  final players = await ref.watch(gamePlayersProvider.future);
  return players.firstWhere((final player) => player.id == id);
}

/// Provide a whole game player context from [id].
@riverpod
Future<GamePlayerContext> gamePlayerContext(
  final Ref ref,
  final String id,
) async {
  final gameOptionsContext = await ref.watch(gameOptionsContextProvider.future);
  final gamePlayer = await ref.watch(gamePlayerProvider(id).future);
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
    gamePlayer: gamePlayer,
    gameOptionsContext: gameOptionsContext,
    room: room,
    zone: zone,
    zoneMusic: zoneMusic,
    roomAmbiance: roomAmbiance,
    roomSurface: roomSurface,
    footsteps: footsteps,
    wallSound: wallSound,
  );
}
