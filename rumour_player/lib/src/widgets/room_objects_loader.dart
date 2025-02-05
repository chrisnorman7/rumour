// ignore_for_file: avoid_print

import 'package:backstreets_widgets/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_player/rumour_player.dart';

/// Loads the room objects in the room with the given [roomId], and uses
/// [builder] to return their states.
class RoomObjectsLoader extends ConsumerWidget {
  /// Create an instance.
  const RoomObjectsLoader({
    required this.roomId,
    required this.error,
    required this.loading,
    required this.builder,
    this.extraAmbiances = const [],
    super.key,
  });

  /// The ID of the room to use.
  final int roomId;

  /// The function to call to show an error.
  final ErrorWidgetCallback error;

  /// The function to call to show a loading screen.
  final Widget Function() loading;

  /// The function to call to build this widget.
  final Widget Function(
    BuildContext context,
    List<RoomObjectState> states,
    List<SoundHandle> extraHandles,
  ) builder;

  /// Any extra ambiances to add.
  final List<Sound> extraAmbiances;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final project = projectContext.project;
    final value = ref.watch(objectsInRoomProvider(roomId));
    return value.when(
      data: (final objects) {
        final objectAmbianceSounds = <Sound>[];
        final value = ref.watch(roomObjectAmbiancesProvider(roomId));
        return value.when(
          data: (final soundReferences) => AmbiancesBuilder(
            ambiances: [
              ...soundReferences.map(
                (final soundReference) {
                  final sound = projectContext.getSound(
                    soundReference: soundReference.soundReference,
                    destroy: false,
                    looping: true,
                    position: soundReference.position,
                  );
                  objectAmbianceSounds.add(sound);
                  return sound;
                },
              ),
              ...extraAmbiances,
            ],
            fadeInTime: project.mainMenuMusicFadeIn,
            fadeOutTime: project.mainMenuMusicFadeOut,
            builder: (final context, final handles) {
              final states = <RoomObjectState>[];
              var i = 0;
              for (final object in objects) {
                print('$i: ${object.name}');
                final ambiance =
                    object.ambianceId == null ? null : soundReferences[i];
                print(ambiance?.soundReference.path);
                final ambianceHandle =
                    object.ambianceId == null ? null : handles[i];
                print(ambianceHandle);
                if (ambianceHandle != null) {
                  i++;
                  print(ambianceHandle.isValid);
                }
                states.add(
                  RoomObjectState(
                    object: object,
                    ambiance: ambiance?.soundReference,
                    ambianceHandle: ambianceHandle,
                  ),
                );
              }
              final extraHandles = handles.length >= soundReferences.length
                  ? handles.sublist(soundReferences.length)
                  : <SoundHandle>[];
              return ProtectSounds(
                sounds: objectAmbianceSounds,
                child: Builder(
                  builder: (final context) => builder(
                    context,
                    states,
                    extraHandles,
                  ),
                ),
              );
            },
            error: error,
            loading: loading,
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
