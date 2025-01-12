import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'database/database.dart';
import 'json/app_preferences.dart';
import 'json/project.dart';
import 'project_context.dart';

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
