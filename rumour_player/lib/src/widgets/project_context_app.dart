import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_player/rumour_player.dart';

/// A [MaterialApp] that created a [PlayProjectContextLoaderScreen].
class ProjectContextApp extends StatelessWidget {
  /// Create an instance.
  const ProjectContextApp({
    required this.title,
    required this.assetKey,
    super.key,
  });

  /// The title of this app.
  final String title;

  /// The asset key where the project will be loaded from.
  final String assetKey;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => ProviderScope(
        child: SoLoudScope(
          child: MaterialApp(
            title: title,
            home: PlayProjectContextLoaderScreen(assetKey: assetKey),
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
          ),
        ),
      );
}
