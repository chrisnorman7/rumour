import 'database/database.dart';
import 'game_options_context.dart';
import 'json/game_options.dart';
import 'json/game_player.dart';

/// Context for a [gamePlayer].
class GamePlayerContext {
  /// Create an instance.
  const GamePlayerContext({
    required this.gamePlayer,
    required this.gameOptionsContext,
    required this.room,
    required this.zone,
    required this.zoneMusic,
    required this.roomAmbiance,
    required this.roomSurface,
    required this.footsteps,
    required this.wallSound,
  });

  /// The game player to use.
  final GamePlayer gamePlayer;

  /// The options context which [gamePlayer] is part of.
  final GameOptionsContext gameOptionsContext;

  /// The game options from [gameOptionsContext].
  GameOptions get gameOptions => gameOptionsContext.gameOptions;

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
  void save() {
    gameOptions.players
        .removeWhere((final player) => player.id == gamePlayer.id);
    gameOptions.players.add(gamePlayer);
    gameOptionsContext.save();
  }
}
