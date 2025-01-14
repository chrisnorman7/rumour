import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;

import 'json/game_player.dart';

/// A [gamePlayer] with a [file].
class GamePlayerFile {
  /// Create an instance.
  const GamePlayerFile({
    required this.file,
    required this.gamePlayer,
  });

  /// Create an instance from [file].
  GamePlayerFile.fromFile(this.file)
      : gamePlayer = GamePlayer.fromJson(jsonDecode(file.readAsStringSync()));

  /// The file that [gamePlayer] was loaded from.
  final File file;

  /// The ID of this [gamePlayer].
  String get id => path.basenameWithoutExtension(file.path);

  /// The game player which was loaded from [file].
  final GamePlayer gamePlayer;

  /// Save the [gamePlayer].
  void save() {
    final json = gamePlayer.toJson();
    final string = jsonEncode(json);
    file.writeAsStringSync(string);
  }
}
