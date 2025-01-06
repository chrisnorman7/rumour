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

/// Provide a project context.
@riverpod
class ProjectContextNotifier extends _$ProjectContextNotifier {
  /// Build the initial value
  @override
  ProjectContext? build() => null;

  /// Load a new value from the given [filename].
  Future<void> setProjectContext(final String filename) async {
    await clear();
    final file = File(filename);
    final project = Project.fromFile(file);
    final databaseFile = File(
      path.join(file.parent.path, project.databaseFilename),
    );
    final database = AppDatabase(file: databaseFile);
    final projectContext = ProjectContext(
      file: file,
      database: database,
    );
    state = projectContext;
  }

  /// Clear the value.
  Future<void> clear() async {
    final old = state;
    state = null;
    if (old != null) {
      await old.database.close();
    }
  }
}
