import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:rumour_editor/rumour_editor.dart';

void main(final List<String> arguments) {
  runApp(ProviderScope(child: MyApp(enableLogging: arguments.contains('-l'))));
}

/// The top-level app class.
class MyApp extends StatelessWidget {
  /// Create an instance.
  const MyApp({this.enableLogging = false, super.key});

  /// Whether to enable logging.
  final bool enableLogging;

  /// This widget is the root of your application.
  @override
  Widget build(final BuildContext context) {
    if (enableLogging) {
      Logger.root
        ..level = Level.ALL
        ..onRecord.listen((final record) {
          final name = record.loggerName;
          final message = record.message;
          // ignore: avoid_print
          print('$name: $message');
        });
    }
    return SoLoudScope(
      child: MaterialApp(
        title: 'Rumour',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ProjectsScreen(),
      ),
    );
  }
}
