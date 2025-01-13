import 'package:drift/drift.dart';

import 'mixins.dart';

/// The player classes table.
@DataClassName('PlayerClass')
class PlayerClasses extends Table
    with IdMixin, NameMixin, DescriptionMixin, RoomIdMixin, CoordinatesMixin {}
