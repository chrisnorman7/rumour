import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/database.dart';
import '../json/serializable_sound_reference.dart';
import '../providers.dart';
import '../screens/editor/select_sound_screen.dart';
import 'unset.dart';

/// A [ListTile] which allows editing [soundReference].
class SerializableSoundReferenceListTile extends ConsumerWidget {
  /// Create an instance.
  const SerializableSoundReferenceListTile({
    required this.soundReference,
    required this.onChanged,
    required this.title,
    this.autofocus = false,
    this.looping = false,
    super.key,
  });

  /// The sound reference to use.
  final SerializableSoundReference? soundReference;

  /// The function to call when [soundReference] has changed.
  final ValueChanged<SerializableSoundReference?> onChanged;

  /// The title of the [ListTile].
  final String title;

  /// Whether the [ListTile] should be autofocused.
  final bool autofocus;

  /// Whether the sound should loop.
  final bool looping;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final reference = soundReference;
    if (reference != null) {
      return PlaySoundSemantics(
        sound: projectContext.getSound(
          soundReference: SoundReference(
            id: -1,
            path: reference.path,
            volume: reference.volume,
          ),
          destroy: false,
          looping: looping,
        ),
        child: Builder(
          builder: (final builderContext) => PerformableActionsListTile(
            actions: [
              PerformableAction(
                name: 'Delete',
                activator: deleteShortcut,
                invoke: () => onChanged(null),
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
                    onChanged: (final value) => onChanged(
                      SerializableSoundReference(
                        path: value,
                        volume: reference.volume,
                      ),
                    ),
                    path: reference.path,
                    volume: reference.volume,
                    looping: looping,
                  ),
                );
            },
          ),
        ),
      );
    }
    return ListTile(
      autofocus: autofocus,
      title: Text(title),
      subtitle: const Unset(),
      onTap: () => context.pushWidgetBuilder(
        (final _) => SelectSoundScreen(
          onChanged: (final value) =>
              onChanged(SerializableSoundReference(path: value)),
        ),
      ),
    );
  }
}
