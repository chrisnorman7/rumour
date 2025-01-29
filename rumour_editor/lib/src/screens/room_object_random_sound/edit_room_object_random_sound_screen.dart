import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// A screen to edit a room object random sound.
class EditRoomObjectRandomSoundScreen extends ConsumerWidget {
  /// Create an instance.
  const EditRoomObjectRandomSoundScreen({
    required this.roomObjectRandomSoundId,
    super.key,
  });

  /// The ID of the random sound to edit.
  final int roomObjectRandomSoundId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final query = database.managers.roomObjectRandomSounds.filter(
      (final f) => f.id.equals(roomObjectRandomSoundId),
    );
    final value = ref.watch(
      roomObjectRandomSoundProvider(roomObjectRandomSoundId),
    );
    return Cancel(
      child: SimpleScaffold(
        title: 'Edit Random Sound',
        body: value.simpleWhen((final randomSound) {
          final minSeconds = randomSound.minInterval;
          final maxSeconds = randomSound.maxInterval;
          return ListView(
            shrinkWrap: true,
            children: [
              // TODO(chrisnorman7): Make sure the sound reference can't be deleted.
              SoundReferenceListTile(
                soundReferenceId: randomSound.soundId,
                onChanged: (final value) async {
                  await query.update((final o) => o(soundId: Value(value!)));
                  invalidateProviders(ref, randomSound.roomObjectId);
                },
                title: 'Sound',
                autofocus: true,
              ),
              IntListTile(
                value: minSeconds,
                onChanged: (final value) async {
                  await query.update((final o) => o(minInterval: Value(value)));
                  invalidateProviders(ref, randomSound.roomObjectId);
                },
                max: randomSound.maxInterval,
                min: 1,
                title: 'Minimum interval',
                subtitle: '$minSeconds ${"second".pluralise(minSeconds)}',
              ),
              IntListTile(
                value: maxSeconds,
                onChanged: (final value) async {
                  await query.update((final o) => o(maxInterval: Value(value)));
                  invalidateProviders(ref, randomSound.roomObjectId);
                },
                min: randomSound.minInterval,
                title: 'Maximum interval',
                subtitle: '$maxSeconds ${"second".pluralise(maxSeconds)}',
              ),
            ],
          );
        }),
      ),
    );
  }

  /// Invalidate providers.
  void invalidateProviders(final WidgetRef ref, final int roomObjectId) =>
      ref
        ..invalidate(roomObjectRandomSoundProvider(roomObjectRandomSoundId))
        ..invalidate(roomObjectRandomSoundsProvider(roomObjectId));
}
