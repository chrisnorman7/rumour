import 'package:backstreets_widgets/extensions.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:time/time.dart';
import 'package:url_launcher/url_launcher.dart';

/// Useful extensions for [WidgetRef]s.
extension WidgetRefX on WidgetRef {
  /// Run a [CommandCaller] by its [id].
  Future<void> runCommandCaller(final int id) async {
    final caller = await read(commandCallerProvider(id).future);
    final callAfter = caller.callAfter;
    if (callAfter != null) {
      await Future<void>.delayed(callAfter.seconds);
    }
    if (context.mounted) {
      return runCommand(caller.childCommandId);
    }
  }

  /// Call a command by its [id].
  Future<void> runCommand(final int id) async {
    final command = await read(commandProvider(id).future);
    if (context.mounted) {
      final spokenMessage = command.spokenMessage;
      if (spokenMessage != null) {
        context.announce(spokenMessage);
      }
      final url = command.url;
      if (url != null) {
        await launchUrl(Uri.parse(url));
      }
      final soundId = command.soundId;
      if (soundId != null) {
        final projectContext = read(projectContextProvider);
        final soundReference =
            await read(soundReferenceProvider(soundId).future);
        if (context.mounted) {
          await context.playSound(
            projectContext.getSound(
              soundReference: soundReference,
              destroy: true,
            ),
          );
        }
      }
      final possibleCommandCaller = await read(
        commandCallerFromParentCommandIdProvider(id).future,
      );
      if (possibleCommandCaller != null) {
        return runCommandCaller(possibleCommandCaller.id);
      }
    }
  }

  /// Maybe play [soundReference].
  ///
  /// If [soundReference] is `null`, then nothing will happen.
  Future<SoundHandle?> maybePlaySoundReference({
    required final SoundReference? soundReference,
    required final bool destroy,
    final bool looping = false,
    final Duration loopingStart = Duration.zero,
    final bool paused = false,
    final SoundPosition position = unpanned,
  }) async {
    if (context.mounted) {
      final projectContext = read(projectContextProvider);
      return context.maybePlaySound(
        projectContext.maybeGetSound(
          soundReference: soundReference,
          destroy: destroy,
          looping: looping,
          loopingStart: loopingStart,
          paused: paused,
          position: position,
        ),
      );
    }
    return null;
  }

  /// Maybe play a [SoundReference] with the given [id].
  Future<SoundHandle?> maybePlaySoundReferenceId({
    required final int? id,
    required final bool destroy,
    final bool looping = false,
    final Duration loopingStart = Duration.zero,
    final bool paused = false,
    final SoundPosition position = unpanned,
  }) async {
    if (id != null) {
      final soundReference = await read(soundReferenceProvider(id).future);
      return maybePlaySoundReference(
        soundReference: soundReference,
        destroy: destroy,
        looping: looping,
        loopingStart: loopingStart,
        paused: paused,
        position: position,
      );
    }
    return null;
  }

  /// Possibly run the command caller with the given [id].
  ///
  /// If [id] is `null`, nothing will happen.
  Future<void> maybeRunCommandCaller(final int? id) async {
    if (id == null) {
      return;
    }
    return runCommandCaller(id);
  }
}
