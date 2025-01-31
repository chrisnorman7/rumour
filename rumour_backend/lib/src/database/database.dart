import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:rumour_backend/_tables.dart';
import 'package:rumour_backend/rumour_backend.dart';

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
    PlayerClasses,
    GameStats,
    RoomSurfaceBoosts,
    RoomSurfaceCosts,
    PlayerClassGameStats,
    RoomObjectRandomSounds,
    Commands,
    CommandCallers,
    RoomObjectCommandCallers,
  ],
)
class AppDatabase extends _$AppDatabase {
  /// Create an instance.
  AppDatabase({final File? file})
      : super(file == null ? NativeDatabase.memory() : NativeDatabase(file));

  /// The schema version.
  @override
  int get schemaVersion => 6;

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
            await m.createTable(this.roomObjectRandomSounds);
          }
          if (from < 3) {
            await m.addColumn(this.roomObjects, this.roomObjects.visible);
          }
          if (from < 4) {
            await m.addColumn(roomExits, roomExits.label);
          }
          if (from < 5) {
            await m.createTable(commands);
            await m.createTable(commandCallers);
          }
          if (from < 6) {
            await m.addColumn(commands, commands.url);
            await m.addColumn(commandCallers, commandCallers.callAfter);
            await m.createTable(this.roomObjectCommandCallers);
          }
        },
      );
}
