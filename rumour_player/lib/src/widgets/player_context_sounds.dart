import 'package:backstreets_widgets/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_player/rumour_player.dart';

class _PlayerContextSounds extends ConsumerWidget {
  const _PlayerContextSounds({
    required this.room,
    required this.loading,
    required this.error,
    required this.playerId,
    required this.getPaused,
    required this.roomAmbianceHandle,
    required this.states,
    required this.builder,
  });

  /// The room to be watched.
  final Room room;

  /// The function to call to show an error widget.
  final ErrorWidgetCallback error;

  /// The function to call to show a loading widget.
  final Widget Function() loading;

  /// The ID of the player to use.
  final String playerId;

  /// The function to get whether the game is paused or not.
  final bool Function() getPaused;

  /// The sound handle for the [room] ambiance.
  final SoundHandle? roomAmbianceHandle;

  /// The states to use.
  final List<RoomObjectState> states;

  /// The function to call to build the widget.
  final Widget Function(
    BuildContext context,
    SoundHandle? roomAmbianceHandle,
    List<RoomObjectState> roomObjectStates,
  ) builder;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
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
  }
}

/// A stack of widgets for a player context.
class PlayerContextSounds extends ConsumerWidget {
  /// Create an instance.
  const PlayerContextSounds({
    required this.gamePlayerContext,
    required this.getPaused,
    required this.error,
    required this.loading,
    required this.builder,
    super.key,
  });

  /// The player context to use.
  final GamePlayerContext gamePlayerContext;

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
    final playerId = gamePlayerContext.gamePlayerFile.id;
    final room = gamePlayerContext.room;
    return ZoneMusic(
      zoneId: room.zoneId,
      error: error,
      loading: loading,
      child: RoomObjectsLoader(
        roomId: room.id,
        error: error,
        loading: loading,
        builder: (final context, final states, final extraHandles) {
          final roomAmbianceHandle =
              extraHandles.isEmpty ? null : extraHandles.single;
          return _PlayerContextSounds(
            room: room,
            error: error,
            loading: loading,
            playerId: playerId,
            getPaused: getPaused,
            roomAmbianceHandle: roomAmbianceHandle,
            states: states,
            builder: builder,
          );
        },
        key: ValueKey('$playerId-${room.id}'),
      ),
    );
  }
}
