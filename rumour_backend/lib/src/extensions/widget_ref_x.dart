import 'package:backstreets_widgets/extensions.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:time/time.dart';
import 'package:url_launcher/url_launcher.dart';

/// Useful extensions for [WidgetRef]s.
extension WidgetRefX on WidgetRef {
  /// Run a [CommandCaller] by its [commandCallerId].
  Future<void> runCommandCaller({
    required final int commandCallerId,
    required final String playerId,
    final SoundPosition position = unpanned,
  }) async {
    final caller = await read(commandCallerProvider(commandCallerId).future);
    final callAfter = caller.callAfter;
    if (callAfter != null) {
      await Future<void>.delayed(callAfter.seconds);
    }
    if (context.mounted) {
      return runCommand(
        commandId: caller.childCommandId,
        playerId: playerId,
        position: position,
      );
    }
  }

  /// Call a command by its [commandId].
  Future<void> runCommand({
    required final int commandId,
    required final String playerId,
    final SoundPosition position = unpanned,
  }) async {
    final command = await read(commandProvider(commandId).future);
    if (context.mounted) {
      final spokenMessage = command.spokenMessage;
      if (spokenMessage != null) {
        context.announce(spokenMessage);
      }
      final url = command.url;
      if (url != null) {
        await launchUrl(Uri.parse(url));
      }
      await maybePlaySoundReferenceId(
        id: command.soundId,
        destroy: true,
        position: position,
      );
      final commandGameStats = await read(
        commandGameStatsProvider(commandId).future,
      );
      final playerContext = await read(
        gamePlayerContextProvider(playerId).future,
      );
      final gamePlayer = playerContext.gamePlayer;
      final stats = gamePlayer.stats;
      for (final commandGameStat in commandGameStats) {
        final value = stats[commandGameStat.gameStatId]!;
        stats[commandGameStat.gameStatId] =
            commandGameStat.mathematicalOperator.calculate(
          value,
          commandGameStat.amount,
        );
      }
      final stageId = command.questStageId;
      if (stageId != null) {
        final stage = await read(
          questStageProvider(stageId).future,
        );
        gamePlayer.setQuestAchievement(stage);
      }
      invalidate(GamePlayerContextProvider(playerId));
      final possibleCommandCaller = await read(
        commandCallerFromParentCommandIdProvider(commandId).future,
      );
      if (possibleCommandCaller != null) {
        return runCommandCaller(
          commandCallerId: possibleCommandCaller.id,
          playerId: playerId,
          position: position,
        );
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

  /// Possibly run the command caller with the given [commandCallerId].
  ///
  /// If [commandCallerId] is `null`, nothing will happen.
  Future<void> maybeRunCommandCaller({
    required final int? commandCallerId,
    required final String playerId,
    final SoundPosition position = unpanned,
  }) async {
    if (commandCallerId == null) {
      return;
    }
    return runCommandCaller(
      commandCallerId: commandCallerId,
      playerId: playerId,
    );
  }
}
