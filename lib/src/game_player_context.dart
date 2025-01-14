import 'database/database.dart';
import 'game_player_file.dart';
import 'json/game_player.dart';

/// Context for a [gamePlayer].
class GamePlayerContext {
  /// Create an instance.
  const GamePlayerContext({
    required this.gamePlayerFile,
    required this.room,
    required this.zone,
    required this.zoneMusic,
    required this.roomAmbiance,
    required this.roomSurface,
    required this.footsteps,
    required this.wallSound,
  });

  /// The game player to use.
  final GamePlayerFile gamePlayerFile;

  /// The game player from [gamePlayerFile].
  GamePlayer get gamePlayer => gamePlayerFile.gamePlayer;

  /// The room where [gamePlayer] is situated.
  final Room room;

  /// The zone which [room] is part of.
  final Zone zone;

  /// The music for [zone].
  final SoundReference? zoneMusic;

  /// The ambiance for [room].
  final SoundReference? roomAmbiance;

  /// The surface of [room].
  final RoomSurface roomSurface;

  /// The footstep sound to loaded from [roomSurface].
  final SoundReference? footsteps;

  /// The wall sound loaded from [roomSurface].
  final SoundReference? wallSound;

  /// Save the [gamePlayer].
  void save() => gamePlayerFile.save();
}
