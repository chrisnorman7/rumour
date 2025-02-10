import 'package:backstreets_widgets/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_player/rumour_player.dart';

/// The type for a room objects loader widget builder.
typedef RoomObjectsLoaderBuilder = Widget Function(
  BuildContext context,
  List<RoomObjectState> states,
  List<SoundHandle> extraHandles,
);

/// Loads the room objects in the room with the given [roomId], and uses
/// [builder] to return their states.
class RoomObjectsLoader extends ConsumerWidget {
  /// Create an instance.
  const RoomObjectsLoader({
    required this.roomId,
    required this.error,
    required this.loading,
    required this.builder,
    super.key,
  });

  /// The ID of the room to use.
  final int roomId;

  /// The function to call to show an error.
  final ErrorWidgetCallback error;

  /// The function to call to show a loading screen.
  final Widget Function() loading;

  /// The function to call to build this widget.
  final RoomObjectsLoaderBuilder builder;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final roomObjectsValue = ref.watch(objectsInRoomProvider(roomId));
    return roomObjectsValue.when(
      data: (final objects) => _RoomObjectsLoader(
        roomId: roomId,
        objects: objects,
        builder: builder,
        error: error,
        loading: loading,
      ),
      error: error,
      loading: loading,
    );
  }
}

class _RoomObjectsLoader extends ConsumerWidget {
  const _RoomObjectsLoader({
    required this.roomId,
    required this.objects,
    required this.error,
    required this.loading,
    required this.builder,
  });

  /// The ID of the room to use.
  final int roomId;

  /// The objects to use.
  final List<RoomObject> objects;

  /// The function to show an error widget.
  final ErrorWidgetCallback error;

  /// The function to use to show a loading widget.
  final Widget Function() loading;

  /// The builder to use.
  final RoomObjectsLoaderBuilder builder;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final project = projectContext.project;
    final roomAmbiancesValue = ref.watch(roomAmbiancesProvider(roomId));
    return roomAmbiancesValue.when(
      data: (final roomAmbiancesContext) {
        final roomAmbiance = roomAmbiancesContext.roomAmbiance;
        final roomObjectAmbiances = roomAmbiancesContext.roomObjectAmbiances;
        final sounds = <Sound>[
          ...roomObjectAmbiances.map(
            (final soundReference) => projectContext.getSound(
              soundReference: soundReference.soundReference,
              destroy: false,
              looping: true,
              position: soundReference.position,
            ),
          ),
          if (roomAmbiance != null)
            projectContext.getSound(
              soundReference: roomAmbiance,
              destroy: false,
              looping: true,
            ),
        ];
        return AmbiancesBuilder(
          ambiances: sounds,
          fadeInTime: project.mainMenuMusicFadeIn,
          fadeOutTime: project.mainMenuMusicFadeOut,
          builder: (final context, final handles) {
            final states = <RoomObjectState>[];
            var i = 0;
            for (final object in objects) {
              final ambianceId = object.ambianceId;
              final SoundReference? ambiance;
              final SoundHandle? ambianceHandle;
              if (ambianceId != null) {
                ambiance = roomObjectAmbiances[i].soundReference;
                ambianceHandle = handles[i];
                i++;
              } else {
                ambiance = null;
                ambianceHandle = null;
              }
              states.add(
                RoomObjectState(
                  object: object,
                  ambiance: ambiance,
                  ambianceHandle: ambianceHandle,
                ),
              );
            }
            final extraHandles = handles.length >= roomObjectAmbiances.length
                ? handles.sublist(roomObjectAmbiances.length)
                : <SoundHandle>[];
            return Builder(
              builder: (final context) {
                try {
                  return builder(
                    context,
                    states,
                    extraHandles,
                  );
                  // ignore: avoid_catches_without_on_clauses
                } catch (e, s) {
                  return error(e, s);
                }
              },
            );
          },
          error: error,
          loading: loading,
        );
      },
      error: error,
      loading: loading,
    );
  }
}
