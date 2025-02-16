import 'dart:math';

import 'package:json_annotation/json_annotation.dart';

part 'game_player.g.dart';

/// A player of a game.
@JsonSerializable()
class GamePlayer {
  /// Create an instance.
  GamePlayer({
    required this.name,
    required this.classId,
    required this.roomId,
    required this.x,
    required this.y,
    final Map<int, int>? stats,
  }) : stats = stats ?? {};

  /// Create an instance from a JSON object.
  factory GamePlayer.fromJson(final Map<String, dynamic> json) =>
      _$GamePlayerFromJson(json);

  /// The name of this player.
  String name;

  /// The ID of the player class which created this player.
  final int classId;

  /// The ID of the room where this player last saved.
  int roomId;

  /// The player's x coordinate.
  int x;

  /// The player's y coordinate.
  int y;

  /// The coordinates of the player.
  @JsonKey(includeFromJson: false, includeToJson: false)
  Point<int> get coordinates => Point(x, y);

  /// Set [coordinates].
  set coordinates(final Point<int> value) {
    x = value.x;
    y = value.y;
  }

  /// The stats for this player.
  final Map<int, int> stats;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$GamePlayerToJson(this);
}
