import 'dart:math';

import 'package:rumour_backend/rumour_backend.dart';

/// A class which gives the relative location of a [roomObject] to the player.
class RoomObjectLocation {
  /// Create an instance.
  const RoomObjectLocation({
    required this.roomObject,
    required this.playerCoordinates,
  });

  /// The room object to use.
  final RoomObject roomObject;

  /// The coordinates of the player.
  final Point<int> playerCoordinates;

  /// How many units north [roomObject] is from [playerCoordinates].
  int get north {
    if (playerCoordinates.y < roomObject.y) {
      return roomObject.y - playerCoordinates.y;
    }
    return 0;
  }

  /// How many units south [roomObject] is from [playerCoordinates].
  int get south {
    if (playerCoordinates.y > roomObject.y) {
      return playerCoordinates.y - roomObject.y;
    }
    return 0;
  }

  /// How many units east [roomObject] is from [playerCoordinates].
  int get east {
    if (playerCoordinates.x < roomObject.x) {
      return roomObject.x - playerCoordinates.x;
    }
    return 0;
  }

  /// How many units west [roomObject] is from [playerCoordinates].
  int get west {
    if (playerCoordinates.x > roomObject.x) {
      return playerCoordinates.x - roomObject.x;
    }
    return 0;
  }

  /// The distance between [roomObject] and [playerCoordinates].
  double get distance => playerCoordinates.distanceTo(roomObject.coordinates);
}
