import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

/// The current project context.
ProjectContext? currentProjectContext;

/// Provide the current project context.
@riverpod
ProjectContext projectContext(final Ref ref) {
  final project = currentProjectContext;
  if (project == null) {
    throw StateError('No project has been loaded.');
  }
  return project;
}

/// Provide the current project.
@riverpod
Project project(final Ref ref) {
  final projectContext = ref.watch(projectContextProvider);
  return projectContext.project;
}
