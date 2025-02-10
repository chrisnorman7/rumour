import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
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
    RoomObjectMovements,
  ],
)
class AppDatabase extends _$AppDatabase {
  /// Create an instance.
  AppDatabase({final File? file})
      : super(file == null ? NativeDatabase.memory() : NativeDatabase(file));

  /// The schema version.
  @override
  int get schemaVersion => 7;

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
            await m.addColumn(roomExits, roomExits.earconId);
          }
          if (from < 3) {
            await m.addColumn(this.roomObjects, this.roomObjects.earconId);
          }
          if (from < 4) {
            for (final column in [
              this.roomObjects.onApproachCommandCallerId,
              this.roomObjects.onLeaveCommandCallerId,
              this.roomObjects.approachDistance,
            ]) {
              await m.addColumn(this.roomObjects, column);
            }
          }
          if (from < 5) {
            for (final column in [
              this.rooms.onEnterCommandCallerId,
              this.rooms.onExitCommandCallerId,
            ]) {
              await m.addColumn(this.rooms, column);
            }
          }
          if (from < 6) {
            await m.addColumn(this.rooms, this.rooms.onTeleportCommandCallerId);
          }
          if (from < 7) {
            await m.createTable(this.roomObjectMovements);
          }
        },
      );
}
