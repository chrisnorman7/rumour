import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'database/database.dart';
import 'json/app_preferences.dart';
import 'json/project.dart';
import 'project_context.dart';

part 'providers.g.dart';

/// Provide the app preferences.
@riverpod
Future<AppPreferences> appPreferences(final Ref ref) async {
  final preferences = SharedPreferencesAsync();
  final string = await preferences.getString(AppPreferences.preferencesKey);
  if (string == null) {
    return AppPreferences(recentFiles: []);
  }
  final json = jsonDecode(string);
  return AppPreferences.fromJson(json);
}

/// Provide the recently-opened files.
@riverpod
Future<List<File>> recentFiles(final Ref ref) async {
  final preferences = await ref.watch(appPreferencesProvider.future);
  final files = preferences.recentFiles
      .map(File.new)
      .where((final file) => file.existsSync())
      .toList()
    ..sort(
      (final a, final b) =>
          a.statSync().changed.compareTo(b.statSync().changed),
    );
  return files;
}

/// Provide the current project context.
@Riverpod(keepAlive: true)
ProjectContext projectContext(final Ref ref) {
  final filename = ref.watch(projectContextFilenameNotifierProvider);
  if (filename == null) {
    throw StateError('No project has been loaded yet.');
  }
  final file = File(filename);
  final project = Project.fromFile(file);
  final databaseFilename = path.join(
    file.parent.path,
    project.databaseFilename,
  );
  final databaseFile = File(databaseFilename);
  final database = AppDatabase(file: databaseFile);
  ref.onDispose(database.close);
  return ProjectContext(file: file, database: database);
}

/// Provide the filename of a project context.
@riverpod
class ProjectContextFilenameNotifier extends _$ProjectContextFilenameNotifier {
  /// Build the initial value
  @override
  String? build() => null;

  /// Load a new value from the given [filename].
  // ignore: use_setters_to_change_properties
  void setFilename(final String filename) {
    state = filename;
  }

  /// Clear the value.
  Future<void> clear() async {
    state = null;
  }
}
