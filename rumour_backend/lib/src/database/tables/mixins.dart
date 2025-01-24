import 'package:drift/drift.dart';
import 'package:rumour_backend/src/database/tables/_tables.dart';

/// A mixin to add a unique [id] column.
mixin IdMixin on Table {
  /// The primary key field.
  IntColumn get id => integer().autoIncrement()();
}

/// Add a [na,e] column.
mixin NameMixin on Table {
  /// The name column.
  TextColumn get name => text()();
}

/// Add a [createdAt] column.
mixin CreatedAtMixin on Table {
  /// The created at column.
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

/// Add a [description] column.
mixin DescriptionMixin on Table {
  /// The description column.
  TextColumn get description => text()();
}

/// Add an [ambianceId] column.
mixin AmbianceIdMixin on Table {
  /// The ID of the ambiance for this row.
  IntColumn get ambianceId =>
      integer().references(SoundReferences, #id).nullable()();
}

/// Add a [roomId] column.
mixin RoomIdMixin on Table {
  /// The ID of the room this row is attached to.
  IntColumn get roomId =>
      integer().references(Rooms, #id, onDelete: KeyAction.cascade)();
}

/// Add [x] and [y] columns.
mixin CoordinatesMixin on Table {
  /// The x coordinate.
  IntColumn get x => integer().withDefault(const Constant(0))();

  /// The y coordinate.
  IntColumn get y => integer().withDefault(const Constant(0))();
}

/// Add a [roomSurfaceId] column.
mixin RoomSurfaceIdMixin on Table {
  /// The ID of the room surface to use.
  IntColumn get roomSurfaceId =>
      integer().references(RoomSurfaces, #id, onDelete: KeyAction.cascade)();
}

/// Add a [gameStatId] column.
mixin GameStatIdMixin on Table {
  /// The ID of the game stat to use.
  IntColumn get gameStatId =>
      integer().references(GameStats, #id, onDelete: KeyAction.cascade)();
}
