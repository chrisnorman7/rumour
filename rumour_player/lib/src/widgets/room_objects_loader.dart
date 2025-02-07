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
    required this.extraAmbiances,
    required this.error,
    required this.loading,
    required this.builder,
  });

  /// The ID of the room to use.
  final int roomId;

  /// Any extra ambiances to add.
  final List<Sound> extraAmbiances;

  /// The function to call to show an error.
  final ErrorWidgetCallback error;

  /// The function to call to show a loading screen.
  final Widget Function() loading;

  /// The function to call to build this widget.
  final RoomObjectsLoaderBuilder builder;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final project = projectContext.project;
    final value = ref.watch(roomObjectAmbiancesProvider(roomId));
    return value.when(
      data: (final soundReferences) {
        final sounds = [
          ...soundReferences.map(
            (final soundReference) => projectContext.getSound(
              soundReference: soundReference.soundReference,
              destroy: false,
              looping: true,
              position: soundReference.position,
            ),
          ),
          ...extraAmbiances,
        ];
        print('RoomObjectsLoader.');
        return AmbiancesBuilder(
          ambiances: sounds,
          fadeInTime: project.mainMenuMusicFadeIn,
          fadeOutTime: project.mainMenuMusicFadeOut,
          builder: (final context, final handles) {
            print('AmbiancesBuilder.');
            final value = ref.watch(objectsInRoomProvider(roomId));
            return value.when(
              data: (final objects) {
                print(
                  'RoomObjectsLoader ${objects.map((final object) => '${object.name} (#${object.id})').join(', ')}.',
                );
                final states = <RoomObjectState>[];
                var i = 0;
                for (final object in objects) {
                  final ambiance =
                      object.ambianceId == null ? null : soundReferences[i];
                  final ambianceHandle =
                      object.ambianceId == null ? null : handles[i];
                  if (ambianceHandle != null) {
                    i++;
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
                return Builder(
                  builder: (final context) {
                    print('Returning builder.');
                    try {
                      return builder(
                        context,
                        states,
                        extraHandles,
                      );
                    } catch (e, s) {
                      print(e);
                      print(s);
                      return const Placeholder();
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
      },
      error: error,
      loading: loading,
    );
  }
}
