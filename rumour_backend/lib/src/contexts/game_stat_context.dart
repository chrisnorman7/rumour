import 'package:rumour_backend/rumour_backend.dart';

/// A context for a game [gameStat].
class GameStatContext {
  /// Create an instance.
  const GameStatContext({required this.gameStat, this.maxValueGameStat});

  /// The game stat to use.
  final GameStat gameStat;

  /// The game stat which provides the max value for [gameStat].
  final GameStat? maxValueGameStat;
}
