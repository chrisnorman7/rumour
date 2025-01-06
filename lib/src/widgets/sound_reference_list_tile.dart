import 'dart:math';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';
import '../providers.dart';
import '../screens/editor/select_sound_screen.dart';
import 'unset.dart';

/// A [ListTile] which allows configuring a [soundReference].
class SoundReferenceListTile extends ConsumerWidget {
  /// Create an instance.
  const SoundReferenceListTile({
    required this.soundReferenceId,
    required this.onChanged,
    required this.title,
    this.autofocus = false,
    this.looping = false,
    super.key,
  });

  /// The ID of the sound reference to use.
  final int? soundReferenceId;

  /// The function to call when [soundReference] has changed.
  final VoidCallback onChanged;

  /// The title of the [ListTile].
  final String title;

  /// Whether the [ListTile] should be autofocused.
  final bool autofocus;

  /// Whether the sound should loop.
  final bool looping;

  /// Build a widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final id = soundReferenceId;
    if (id == null) {
      return ListTile(
        autofocus: autofocus,
        title: Text(title),
        subtitle: const Unset(),
        onTap: () => context.pushWidgetBuilder(
          (final _) => SelectSoundScreen(
            onChanged: (final value) async {
              await projectContext.database.managers.soundReferences
                  .createReturning((final f) => f(path: value));
              onChanged();
            },
          ),
        ),
      );
    }
    final value = ref.watch(soundReferenceProvider(id));
    return value.when(
      data: (final reference) => PlaySoundSemantics(
        sound: projectContext.getSound(
          soundReference: reference,
          destroy: false,
          looping: looping,
        ),
        child: Builder(
          builder: (final builderContext) {
            final state = builderContext
                .findAncestorStateOfType<PlaySoundSemanticsState>();
            return PerformableActionsListTile(
              actions: [
                if (reference.volume < maxVolume)
                  PerformableAction(
                    name: 'Increase volume',
                    activator: moveUpShortcut,
                    invoke: () async {
                      final volume = min(
                        maxVolume,
                        reference.volume + volumeAdjust,
                      );
                      await projectContext.database.managers.soundReferences
                          .filter((final f) => f.id.equals(id))
                          .update((final f) => f(volume: Value(volume)));
                      onChanged();
                      state?.handle?.volume.value = volume;
                    },
                  ),
                if (reference.volume > minVolume)
                  PerformableAction(
                    name: 'Decrease volume',
                    activator: moveDownShortcut,
                    invoke: () async {
                      final volume = max(
                        minVolume,
                        reference.volume - volumeAdjust,
                      );
                      await projectContext.database.managers.soundReferences
                          .filter((final f) => f.id.equals(id))
                          .update((final f) => f(volume: Value(volume)));
                      onChanged();
                      state?.handle?.volume.value = volume;
                    },
                  ),
                PerformableAction(
                  name: 'Delete',
                  activator: deleteShortcut,
                  invoke: () async {
                    await projectContext.database.managers.soundReferences
                        .filter((final f) => f.id.equals(id))
                        .delete();
                    onChanged();
                  },
                ),
              ],
              title: Text(title),
              subtitle: Text(
                '${reference.path} (${reference.volume.toStringAsFixed(1)})',
              ),
              onTap: () {
                builderContext
                  ..stopPlaySoundSemantics()
                  ..pushWidgetBuilder(
                    (final context) => SelectSoundScreen(
                      onChanged: (final value) async {
                        await projectContext.database.managers.soundReferences
                            .update(
                          (final f) => f(path: Value(value)),
                        );
                        onChanged();
                      },
                      path: reference.path,
                      volume: reference.volume,
                      looping: looping,
                    ),
                  );
              },
            );
          },
        ),
      ),
      error: ErrorListTile.withPositional,
      loading: LoadingWidget.new,
    );
  }
}
