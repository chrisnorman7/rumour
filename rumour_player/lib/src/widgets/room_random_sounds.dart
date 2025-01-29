import 'package:backstreets_widgets/typedefs.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:time/time.dart';

/// Uses [RandomTasks] to play room object random sounds.
class RoomRandomSounds extends ConsumerWidget {
  /// Create an instance.
  const RoomRandomSounds({
    required this.roomId,
    required this.error,
    required this.loading,
    required this.child,
    required this.getPaused,
    super.key,
  });

  /// The ID of the room to load random sounds for.
  final int roomId;

  /// The function to call to check if the game is paused.
  final bool Function() getPaused;

  /// The function to call to build an error widget.
  final ErrorWidgetCallback error;

  /// The function to call to build a loading widget.
  final Widget Function() loading;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final value = ref.watch(roomObjectRandomSoundsForRoomProvider(roomId));
    return value.when(
      data: (final randomSoundContexts) => RandomTasks(
        tasks: randomSoundContexts.map(
          (final randomSoundContext) {
            final randomSound = randomSoundContext.randomSound;
            final maxSeconds = randomSound.maxInterval;
            final minSeconds = randomSound.minInterval;
            final roomObject = randomSoundContext.roomObject;
            return RandomTask(
              getDuration: () {
                final seed = random.nextInt(
                  maxSeconds - minSeconds,
                );
                return (seed + minSeconds).seconds;
              },
              onTick: () {
                if (getPaused()) {
                  return;
                }
                context.playSound(
                  projectContext.getSound(
                    soundReference: randomSoundContext.sound,
                    destroy: true,
                    position: SoundPosition3d(
                      roomObject.x.toDouble(),
                      roomObject.y.toDouble(),
                      0,
                    ),
                  ),
                );
              },
            );
          },
        ).toList(),
        child: child,
      ),
      error: error,
      loading: loading,
    );
  }
}
