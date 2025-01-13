import 'dart:convert';
import 'dart:io';

import 'json/game_options.dart';

/// A context for [gameOptions].
class GameOptionsContext {
  /// Create an instance.
  const GameOptionsContext({
    required this.gameOptions,
    required this.gameOptionsFile,
  });

  /// Load an instance from [gameOptionsFile].
  GameOptionsContext.fromFile(this.gameOptionsFile)
      : gameOptions = gameOptionsFile.existsSync()
            ? GameOptions.fromJson(
                jsonDecode(gameOptionsFile.readAsStringSync()),
              )
            : GameOptions(players: []);

  /// The game options which have been loaded.
  final GameOptions gameOptions;

  /// The file which [gameOptions] was loaded from.
  final File gameOptionsFile;

  /// The directory where [gameOptionsFile] resides.
  Directory get gameOptionsDirectory => gameOptionsFile.parent;

  /// Save [gameOptions].
  void save() {
    final source = jsonEncode(gameOptions);
    gameOptionsFile.writeAsStringSync(source);
  }
}
