import 'package:drift/drift.dart';
import 'package:rumour_backend/_tables.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// The player classes table.
///
/// This table ensures that the code knows which [Rooms] to start players in.
@DataClassName('PlayerClass')
class PlayerClasses extends Table
    with IdMixin, NameMixin, DescriptionMixin, RoomIdMixin, CoordinatesMixin {}
