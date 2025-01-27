import 'package:rumour_backend/src/contexts/game_stat_context.dart';

/// A [GameStatContext] with [value] and [maxValue].
class GameStatValueContext extends GameStatContext {
  /// Create an instance.
  const GameStatValueContext({
    required super.gameStat,
    required this.value,
    required super.maxValueGameStat,
    required this.maxValue,
  });

  /// The value of [gameStat].
  final int value;

  /// The value of [maxValueGameStat].
  final int? maxValue;
}
