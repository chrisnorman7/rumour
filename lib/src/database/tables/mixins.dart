import 'package:drift/drift.dart';

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
