import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The room object random sounds tab.
class RoomObjectRandomSoundsTab extends ConsumerWidget {
  /// Create an instance.
  const RoomObjectRandomSoundsTab({required this.roomObjectId, super.key});

  /// The ID of the room object to get random sounds for.
  final int roomObjectId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final provider = roomObjectRandomSoundsProvider(roomObjectId);
    final value = ref.watch(provider);
    final database = ref.watch(databaseProvider);
    final managers = database.managers;
    final manager = managers.roomObjectRandomSounds;
    return value.simpleWhen((final randomSounds) {
      if (randomSounds.isEmpty) {
        return const NothingToSee();
      }
      return ListView.builder(
        itemBuilder: (final context, final index) {
          final randomSound = randomSounds[index];
          final query = manager.filter(
            (final f) => f.id.equals(randomSound.id),
          );
          final value = ref.watch(soundReferenceProvider(randomSound.soundId));
          final minSeconds = randomSound.minInterval;
          final maxSeconds = randomSound.maxInterval;
          final seconds = 'second'.pluralise(maxSeconds);
          return PlaySoundReferenceSemantics(
            soundReferenceId: randomSound.soundId,
            child: Builder(
              builder:
                  (final builderContext) => PerformableActionsListTile(
                    actions: [
                      PerformableAction(
                        name: 'Delete',
                        invoke: () async {
                          managers.soundReferences.filter(
                            (final f) => f.id.equals(randomSound.soundId),
                          );
                          await query.delete();
                          ref.invalidate(provider);
                        },
                        activator: deleteShortcut,
                      ),
                    ],
                    autofocus: index == 0,
                    title: value.when(
                      data: (final soundReference) {
                        final basename = path.basename(soundReference.path);
                        return Text(
                          // ignore: lines_longer_than_80_chars
                          '$basename (${soundReference.volume.toStringAsFixed(1)})',
                        );
                      },
                      error: ErrorText.withPositional,
                      loading: LoadingWidget.new,
                    ),
                    subtitle: Text(
                      minSeconds == maxSeconds
                          ? '$maxSeconds ${"second".pluralise(maxSeconds)}'
                          : 'Between $minSeconds and $maxSeconds $seconds',
                    ),
                    onTap: () {
                      builderContext
                        ..stopPlaySoundSemantics()
                        ..pushWidgetBuilder(
                          (_) => EditRoomObjectRandomSoundScreen(
                            roomObjectRandomSoundId: randomSound.id,
                          ),
                        );
                    },
                  ),
            ),
          );
        },
        itemCount: randomSounds.length,
        shrinkWrap: true,
      );
    });
  }
}
