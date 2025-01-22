import 'dart:convert';
import 'dart:io';

import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// A screen which shows the most recent project.
class ProjectsScreen extends ConsumerWidget {
  /// Create an instance.
  const ProjectsScreen({super.key});

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(recentFilesProvider);
    return CommonShortcuts(
      newCallback: () => _createProject(ref),
      openCallback: () => _openProject(ref),
      child: SimpleScaffold(
        title: 'Projects',
        actions: [
          ElevatedButton(
            onPressed: () => _openProject(ref),
            child: const Icon(Icons.file_open, semanticLabel: 'Open'),
          ),
        ],
        body: value.when(
          data: (final files) {
            if (files.isEmpty) {
              return const NothingToSee(
                message: 'There are no recent projects.',
              );
            }
            return ListView.builder(
              itemBuilder: (final context, final index) {
                final file = files[index];
                final project = Project.fromFile(file);
                final music = project.mainMenuMusic;
                return MaybePlaySoundSemantics(
                  sound:
                      music == null
                          ? null
                          : Sound(
                            path: path.join(
                              file.parent.path,
                              project.soundsDirectoryName,
                              music.path,
                            ),
                            soundType: SoundType.file,
                            destroy: false,
                            loadMode: LoadMode.disk,
                            looping: true,
                            volume: music.volume,
                          ),
                  child: Builder(
                    builder:
                        (final builderContext) => ListTile(
                          autofocus: index == 0,
                          title: Text(project.name),
                          onTap: () {
                            builderContext.stopPlaySoundSemantics();
                            _loadProjectFromFile(ref, file);
                          },
                        ),
                  ),
                );
              },
              itemCount: files.length,
              shrinkWrap: true,
            );
          },
          error: ErrorScreen.withPositional,
          loading: LoadingScreen.new,
        ),
        floatingActionButton: NewButton(onPressed: () => _createProject(ref)),
      ),
    );
  }

  /// Load a project from [file].
  Future<void> _loadProjectFromFile(
    final WidgetRef ref,
    final File file,
  ) async {
    final preferences = await ref.read(appPreferencesProvider.future);
    if (!preferences.recentFiles.contains(file.path)) {
      preferences.recentFiles.add(file.path);
      await preferences.save(ref: ref);
    }
    if (ref.context.mounted) {
      ref
          .read(currentProjectContextProvider.notifier)
          .setProjectContext(ProjectContext.fromFile(file));
      await ref.context.pushWidgetBuilder(
        (final _) => const EditProjectScreen(),
      );
    }
  }

  /// Create a new project.
  Future<void> _createProject(final WidgetRef ref) async {
    final directory = Directory(
      path.join((await getApplicationDocumentsDirectory()).path, 'rumour'),
    );
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }
    final filename = await FilePicker.platform.saveFile(
      dialogTitle: 'Save Project',
      fileName: 'project.json',
      initialDirectory: directory.path,
    );
    if (filename == null) {
      return;
    }
    final project = Project();
    final file = File(filename)..writeAsStringSync(jsonEncode(project));
    await _loadProjectFromFile(ref, file);
  }

  /// Open an existing project.
  Future<void> _openProject(final WidgetRef ref) async {
    final directory = Directory(
      path.join((await getApplicationDocumentsDirectory()).path, 'rumour'),
    );
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }
    final result = await FilePicker.platform.pickFiles(
      dialogTitle: 'Open Project',
      initialDirectory: directory.path,
    );
    if (result == null) {
      return;
    }
    final filename = result.files.single.path;
    if (filename == null) {
      return;
    }
    final file = File(filename);
    await _loadProjectFromFile(ref, file);
  }
}
