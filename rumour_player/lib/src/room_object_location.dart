import 'dart:math';

import 'package:rumour_player/rumour_player.dart';

/// A class which gives the relative location of [roomObjectState] to the
/// player.
class RoomObjectLocation {
  /// Create an instance.
  const RoomObjectLocation({
    required this.roomObjectState,
    required this.playerCoordinates,
  });

  /// The room object to use.
  final RoomObjectState roomObjectState;

  /// The coordinates of the player.
  final Point<int> playerCoordinates;

  /// How many units north [roomObjectState] is from [playerCoordinates].
  int get north {
    if (playerCoordinates.y < roomObjectState.coordinates.y) {
      return roomObjectState.coordinates.y - playerCoordinates.y;
    }
    return 0;
  }

  /// How many units south [roomObjectState] is from [playerCoordinates].
  int get south {
    if (playerCoordinates.y > roomObjectState.coordinates.y) {
      return playerCoordinates.y - roomObjectState.coordinates.y;
    }
    return 0;
  }

  /// How many units east [roomObjectState] is from [playerCoordinates].
  int get east {
    if (playerCoordinates.x < roomObjectState.coordinates.x) {
      return roomObjectState.coordinates.x - playerCoordinates.x;
    }
    return 0;
  }

  /// How many units west [roomObjectState] is from [playerCoordinates].
  int get west {
    if (playerCoordinates.x > roomObjectState.coordinates.x) {
      return playerCoordinates.x - roomObjectState.coordinates.x;
    }
    return 0;
  }

  /// The distance between [roomObjectState] and [playerCoordinates].
  double get distance =>
      playerCoordinates.distanceTo(roomObjectState.coordinates);
}
