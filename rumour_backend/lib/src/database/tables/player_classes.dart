import 'package:drift/drift.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// The player classes table.
@DataClassName('PlayerClass')
class PlayerClasses extends Table
    with IdMixin, NameMixin, DescriptionMixin, RoomIdMixin, CoordinatesMixin {}
