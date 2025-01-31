import 'package:backstreets_widgets/extensions.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      final callerId = command.commandCallerId;
      if (callerId != null && context.mounted) {
        return runCommandCaller(callerId);
      }
    }
  }
}
