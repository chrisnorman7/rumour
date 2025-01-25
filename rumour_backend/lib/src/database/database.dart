import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
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
  ],
)
class AppDatabase extends _$AppDatabase {
  /// Create an instance.
  AppDatabase({final File? file})
      : super(file == null ? NativeDatabase.memory() : NativeDatabase(file));

  /// The schema version.
  @override
  int get schemaVersion => 4;

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
            await m.createTable(this.gameStats);
          }
          if (from < 3) {
            await m.createTable(roomSurfaceBoosts);
            await m.createTable(roomSurfaceCosts);
          }
          if (from < 4) {
            await m.alterTable(TableMigration(roomSurfaceBoosts));
            for (final column in <GeneratedColumn>[
              this.gameStats.maxGameStatId,
              this.gameStats.mathematicalOperator,
              this.gameStats.maxValueMultiplier,
            ]) {
              await m.addColumn(this.gameStats, column);
            }
          }
        },
      );
}
