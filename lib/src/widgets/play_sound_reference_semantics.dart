import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

/// A [PlaySoundSemantics] widget that works with a [soundReferenceId]s.
class PlaySoundReferenceSemantics extends ConsumerWidget {
  /// Create an instance.
  const PlaySoundReferenceSemantics({
    required this.soundReferenceId,
    required this.child,
    this.looping = false,
    super.key,
  });

  /// The ID of the sound reference to use.
  final int? soundReferenceId;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Whether this sound should loop or not.
  final bool looping;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final id = soundReferenceId;
    if (id == null) {
      return child;
    }
    final value = ref.watch(soundReferenceProvider(id));
    return value.when(
      data: (final soundReference) {
        final sound = projectContext.getSound(
          soundReference: soundReference,
          destroy: false,
          looping: looping,
        );
        return PlaySoundSemantics(sound: sound, child: child);
      },
      error: ErrorListTile.withPositional,
      loading: () => child,
    );
  }
}
