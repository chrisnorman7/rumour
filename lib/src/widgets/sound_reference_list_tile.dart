import 'dart:math';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

import '../constants.dart';
import '../providers.dart';
import '../screens/select_sound_screen.dart';
import 'play_sound_reference_semantics.dart';
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
  final ValueChanged<int?> onChanged;

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
    final soundReferences = projectContext.database.managers.soundReferences;
    final id = soundReferenceId;
    if (id == null) {
      return ListTile(
        autofocus: autofocus,
        title: Text(title),
        subtitle: const Unset(),
        onTap: () => context.pushWidgetBuilder(
          (final _) => SelectSoundScreen(
            onChanged: (final value) async {
              final reference = await soundReferences.createReturning(
                (final f) => f(path: value),
              );
              onChanged(reference.id);
            },
          ),
        ),
      );
    }
    final query = soundReferences.filter((final f) => f.id.equals(id));
    final provider = soundReferenceProvider(id);
    final value = ref.watch(provider);
    return value.when(
      data: (final reference) => PlaySoundReferenceSemantics(
        soundReferenceId: id,
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
                      ref.invalidate(provider);
                      await query.update(
                        (final f) => f(volume: Value(volume)),
                      );
                      onChanged(id);
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
                      ref.invalidate(provider);
                      await query.update(
                        (final f) => f(volume: Value(volume)),
                      );
                      onChanged(id);
                      state?.handle?.volume.value = volume;
                    },
                  ),
                PerformableAction(
                  name: 'Delete',
                  activator: deleteShortcut,
                  invoke: () async {
                    onChanged(null);
                    await query.delete();
                  },
                ),
                for (final loadMode in LoadMode.values)
                  PerformableAction(
                    name: 'Play sound from ${loadMode.name}',
                    invoke: () async {
                      await query.update(
                        (final f) => f(loadMode: Value(loadMode)),
                      );
                      ref.invalidate(provider);
                      onChanged(id);
                    },
                    checked: reference.loadMode == loadMode,
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
                        await query.update(
                          (final f) => f(path: Value(value)),
                        );
                        onChanged(id);
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
