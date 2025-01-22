import 'dart:io';

import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:rumour_backend/rumour_backend.dart';

/// A screen for selecting a new sound [path].
class SelectSoundScreen extends ConsumerStatefulWidget {
  /// Create an instance.
  const SelectSoundScreen({
    required this.onChanged,
    this.path,
    this.volume = 0.7,
    this.looping = false,
    super.key,
  });

  /// The function to call when [path] changes.
  final ValueChanged<String> onChanged;

  /// The path to start with.
  final String? path;

  /// The volume of the sound.
  final double volume;

  /// Whether or not the sound should loop.
  final bool looping;

  /// Create state for this widget.
  @override
  SelectSoundScreenState createState() => SelectSoundScreenState();
}

/// State for [SelectSoundScreen].
class SelectSoundScreenState extends ConsumerState<SelectSoundScreen> {
  /// The current directory.
  Directory? _directory;

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final projectContext = ref.watch(projectContextProvider);
    final soundsPath = projectContext.soundsDirectory.path;
    final Directory directory;
    final d = _directory;
    if (d != null) {
      directory = d;
    } else {
      final soundPath = widget.path;
      if (soundPath != null) {
        directory = File(path.join(soundsPath, soundPath)).parent;
      } else {
        directory = projectContext.soundsDirectory;
      }
    }
    final contents = directory.listSync();
    final directories = contents.whereType<Directory>();
    final files = contents.whereType<File>().where(
      (final file) => soundFileExtensions.contains(path.extension(file.path)),
    );
    final Widget child;
    if (directories.isEmpty && files.isEmpty) {
      child = const CenterText(
        text: 'There are no sound files to show.',
        autofocus: true,
      );
    } else {
      final entities = [
        if (d != null && files.isNotEmpty) d,
        ...directories,
        ...files,
      ];
      child = ListView.builder(
        shrinkWrap: true,
        itemCount: entities.length,
        itemBuilder: (final context, final index) {
          final entity = entities[index];
          if (d != null && path.equals(entity.path, d.path)) {
            return ListTile(
              autofocus: true,
              title: const Text('Use Directory'),
              onTap: () {
                Navigator.pop(context);
                widget.onChanged(path.relative(entity.path, from: soundsPath));
              },
            );
          }
          if (entity is File) {
            return PlaySoundSemantics(
              sound: entity.asSound(
                destroy: false,
                looping: widget.looping,
                volume: widget.volume,
              ),
              child: ListTile(
                autofocus: index == 0,
                title: Text(path.basename(entity.path)),
                subtitle: Text(filesize(entity.statSync().size)),
                onTap: () {
                  Navigator.pop(context);
                  widget.onChanged(
                    path.relative(entity.path, from: soundsPath),
                  );
                },
              ),
            );
          } else if (entity is Directory) {
            return ListTile(
              autofocus: index == 0,
              title: Text(path.basename(entity.path)),
              onTap: () => setState(() => _directory = entity),
            );
          } else {
            throw UnsupportedError('Cannot show entity $entity.');
          }
        },
      );
    }
    return Cancel(
      child: SimpleScaffold(title: 'Select Sound', body: child),
      onCancel: () {
        if (path.equals(directory.path, projectContext.soundsDirectory.path)) {
          Navigator.pop(context);
        } else {
          setState(() {
            _directory = directory.parent;
          });
        }
      },
    );
  }
}
