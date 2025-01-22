import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:backstreets_widgets/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_player/rumour_player.dart';

/// A screen which will load a [ProjectContext] from the given [assetKey].
class PlayProjectContextLoaderScreen extends ConsumerStatefulWidget {
  /// Create an instance.
  const PlayProjectContextLoaderScreen({
    required this.assetKey,
    super.key,
  });

  /// The key to load the asset from.
  final String assetKey;

  /// Create state for this widget.
  @override
  PlayProjectContextLoaderScreenState createState() =>
      PlayProjectContextLoaderScreenState();
}

/// State for [PlayProjectContextLoaderScreen].
class PlayProjectContextLoaderScreenState
    extends ConsumerState<PlayProjectContextLoaderScreen> {
  /// An error to show.
  Object? _error;

  /// The stack trace from an error.
  StackTrace? _stackTrace;

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final error = _error;
    if (error != null) {
      return ErrorScreen(
        error: error,
        stackTrace: _stackTrace,
      );
    }
    final projectContext = ref.watch(currentProjectContextProvider);
    if (projectContext != null) {
      return const CloseProject(child: PlayProjectScreen());
    }
    _loadProjectContext();
    return const LoadingScreen();
  }

  /// Load the project.
  Future<void> _loadProjectContext() async {
    try {
      final bundle = DefaultAssetBundle.of(context);
      final source = await bundle.loadString(widget.assetKey);
      final json = jsonDecode(source) as Map<String, dynamic>;
      final loader = ProjectContextLoader.fromJson(json);
      final projectSource = await bundle.loadString(loader.projectAssetKey);
      final project = Project.fromJson(
        jsonDecode(projectSource) as Map<String, dynamic>,
      );
      final directory =
          await ref.read(projectDataDirectoryProvider(project).future);
      final file = File(
        path.join(
          directory.path,
          path.basename(loader.projectAssetKey),
        ),
      )..writeAsStringSync(projectSource);
      final databaseBuffer = await bundle.load(project.databaseFilename);
      final databaseFile = File(
        path.join(
          directory.path,
          path.basename(project.databaseFilename),
        ),
      )..writeAsBytesSync(Uint8List.sublistView(databaseBuffer));
      final database = AppDatabase(file: databaseFile);
      final projectContext = ProjectContext(
        file: file,
        database: database,
        loader: loader,
      );
      if (mounted) {
        ref
            .read(currentProjectContextProvider.notifier)
            .setProjectContext(projectContext);
      }
      // ignore: avoid_catches_without_on_clauses
    } catch (e, s) {
      if (mounted) {
        setState(() {
          _error = e;
          _stackTrace = s;
        });
      }
    }
  }
}
