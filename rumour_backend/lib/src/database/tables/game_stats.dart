import 'package:drift/drift.dart';
import 'package:rumour_backend/src/database/tables/mixins.dart';

/// The game stats table.
class GameStats extends Table with IdMixin, NameMixin, DescriptionMixin {
  /// The default value when no other default is provided.
  ///
  /// The [defaultValue] will be ignored in most cases.
  IntColumn get defaultValue => integer().withDefault(const Constant(5))();

  /// Whether or not this stat is visible to the player.
  BoolColumn get isVisible => boolean().withDefault(const Constant(true))();
}
