import 'dart:math';

import 'package:json_annotation/json_annotation.dart';

part 'game_player.g.dart';

/// A player of a game.
@JsonSerializable()
class GamePlayer {
  /// Create an instance.
  GamePlayer({
    required this.id,
    required this.name,
    required this.roomId,
    required this.x,
    required this.y,
  });

  /// Create an instance from a JSON object.
  factory GamePlayer.fromJson(final Map<String, dynamic> json) =>
      _$GamePlayerFromJson(json);

  /// The ID of this player.
  final String id;

  /// The name of this player.
  String name;

  /// The ID of the room where this player last saved.
  int roomId;

  /// The player's x coordinate.
  int x;

  /// The player's y coordinate.
  int y;

  /// The coordinates of the player.
  @JsonKey(includeFromJson: false, includeToJson: false)
  Point<int> get coordinates => Point(x, y);

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$GamePlayerToJson(this);
}
