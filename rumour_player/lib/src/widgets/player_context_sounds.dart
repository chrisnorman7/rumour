import 'package:backstreets_widgets/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
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
  final Widget Function(
    BuildContext context,
    SoundHandle? roomAmbianceHandle,
    List<RoomObjectState> roomObjectStates,
  ) builder;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final value = ref.watch(gamePlayerContextProvider(playerId));
    return value.when(
      data: (final playerContext) {
        final room = playerContext.room;
        final roomAmbiance = playerContext.roomAmbiance;
        return RoomObjectsLoader(
          roomId: room.id,
          error: error,
          loading: loading,
          extraAmbiances: [
            if (roomAmbiance != null)
              projectContext.getSound(
                soundReference: roomAmbiance,
                destroy: false,
                looping: true,
              ),
          ],
          builder: (final context, final states, final extraHandles) {
            final roomAmbianceHandle =
                extraHandles.isEmpty ? null : extraHandles.single;
            final value = ref.watch(roomSoundsProvider(room.id));
            return value.when(
              data: (final sounds) => ProtectSounds(
                sounds: sounds,
                child: LoadSounds(
                  sounds: sounds,
                  loading: loading,
                  error: error,
                  child: RoomSurfaceBoostTimers(
                    playerId: playerId,
                    roomSurfaceId: room.surfaceId,
                    getPaused: getPaused,
                    error: error,
                    loading: loading,
                    child: Builder(
                      builder: (final builderContext) => builder(
                        builderContext,
                        roomAmbianceHandle,
                        states,
                      ),
                    ),
                  ),
                ),
              ),
              error: error,
              loading: loading,
            );
          },
        );
      },
      error: error,
      loading: loading,
    );
  }
}
