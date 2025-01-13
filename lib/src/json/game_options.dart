import 'package:json_annotation/json_annotation.dart';

import 'game_player.dart';

part 'game_options.g.dart';

/// The options for a game.
@JsonSerializable()
class GameOptions {
  /// Create an instance.
  GameOptions({
    required this.players,
    this.masterVolume = 1.0,
  });

  /// Create an instance from a JSON object.
  factory GameOptions.fromJson(final Map<String, dynamic> json) =>
      _$GameOptionsFromJson(json);

  /// The master volume to use.
  double masterVolume;

  /// The players which have been created.
  final List<GamePlayer> players;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$GameOptionsToJson(this);
}
