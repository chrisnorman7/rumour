import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

import 'tables/_tables.dart';

part 'database.g.dart';

/// The database to use.
@DriftDatabase(
  tables: [
    Zones,
    Rooms,
    RoomObjects,
    RoomSurfaces,
    SoundReferences,
    RoomExits,
  ],
)
class AppDatabase extends _$AppDatabase {
  /// Create an instance.
  AppDatabase({final File? file})
      : super(file == null ? NativeDatabase.memory() : NativeDatabase(file));

  /// The schema version.
  @override
  int get schemaVersion => 5;

  /// Migrate the database.
  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (final details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
        onCreate: (final m) async {
          await m.createAll();
        },
        onUpgrade: (final m, final from, final to) async {
          if (from < 2) {
            await m.addColumn(rooms, rooms.description);
            await m.addColumn(rooms, rooms.surfaceId);
            await m.createTable(roomSurfaces);
          }
          if (from < 3) {
            await m.createTable(roomObjects);
          }
          if (from < 4) {
            await m.addColumn(soundReferences, soundReferences.loadMode);
          }
          if (from < 5) {
            await m.createTable(roomExits);
            await m.addColumn(roomObjects, roomObjects.roomExitId);
          }
        },
      );
}
