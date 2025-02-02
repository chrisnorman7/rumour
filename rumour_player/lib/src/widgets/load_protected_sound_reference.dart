import 'package:backstreets_widgets/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// A widget which uses [ProtectSounds] to protect all sounds which match the
/// provided [soundReferenceId].
class LoadProtectedSoundReference extends ConsumerWidget {
  /// Create an instance.
  const LoadProtectedSoundReference({
    required this.soundReferenceId,
    required this.destroy,
    required this.child,
    required this.error,
    required this.loading,
    super.key,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// The ID of the sound reference to use.
  ///
  /// If [soundReferenceId] is `null`, then [child] will be returned.
  final int? soundReferenceId;

  /// Whether to destroy the sounds.
  final bool destroy;

  /// The function to call to show an error.
  final ErrorWidgetCallback error;

  /// The function to call to show a loading screen.
  final Widget Function() loading;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final id = soundReferenceId;
    if (id == null) {
      return child;
    }
    final value = ref.watch(soundReferenceProvider(id));
    final projectContext = ref.watch(projectContextProvider);
    return value.when(
      data: (final soundReference) {
        final sounds = projectContext.getSounds(
          soundReference: soundReference,
          destroy: destroy,
        );
        return ProtectSounds(
          sounds: sounds,
          child: LoadSounds(
            sounds: sounds,
            loading: loading,
            error: error,
            child: child,
          ),
        );
      },
      error: error,
      loading: loading,
    );
  }
}
