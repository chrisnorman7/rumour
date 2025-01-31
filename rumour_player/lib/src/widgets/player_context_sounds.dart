import 'package:backstreets_widgets/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_player/rumour_player.dart';

/// A stack of widgets for a player context.
class PlayerContextSounds extends ConsumerWidget {
  /// Create an instance.
  const PlayerContextSounds({
    required this.playerId,
    required this.getPaused,
    required this.error,
    required this.loading,
    required this.builder,
    super.key,
  });

  /// The ID of the player whose context will be loaded.
  final String playerId;

  /// The function to call to check if the game is paused.
  final bool Function() getPaused;

  /// The function to call to show an error.
  final ErrorWidgetCallback error;

  /// The function to call to show a loading screen.
  final Widget Function() loading;

  /// The function to call to build this widget.
  final WidgetBuilder builder;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(gamePlayerContextProvider(playerId));
    return value.when(
      data: (final playerContext) {
        final player = playerContext.gamePlayer;
        final roomId = player.roomId;
        final value = ref.watch(roomProvider(roomId));
        return value.when(
          data: (final room) => RoomRandomSounds(
            roomId: roomId,
            getPaused: getPaused,
            error: error,
            loading: loading,
            child: RoomSurfaceBoostTimers(
              playerId: playerId,
              roomSurfaceId: room.surfaceId,
              getPaused: getPaused,
              error: error,
              loading: loading,
              child: RoomAmbiances(
                roomId: roomId,
                error: error,
                loading: loading,
                child: ZoneMusic(
                  zoneId: room.zoneId,
                  error: error,
                  loading: loading,
                  builder: builder,
                ),
              ),
            ),
          ),
          error: error,
          loading: loading,
        );
      },
      error: error,
      loading: loading,
    );
  }
}
