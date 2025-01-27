import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// A [ListView] which constructs an audio game menu with the correct values.
class AudioGameMenuListView extends ConsumerWidget {
  /// Create an instance.
  const AudioGameMenuListView({
    required this.menuItems,
    super.key,
  });

  /// The menu items to use.
  final List<AudioGameMenuItem> menuItems;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final project = projectContext.project;
    return ListView(
      shrinkWrap: true,
      children: [
        for (var i = 0; i < menuItems.length; i++)
          AudioGameMenuItemListTile(
            menuItem: menuItems[i],
            autofocus: i == 0,
            selectSound: projectContext.maybeGetSound(
              soundReference: project.menuSelectSound?.getSoundReference(),
              destroy: false,
            ),
            activateSound: projectContext.maybeGetSound(
              soundReference: project.menuActivateSound?.getSoundReference(),
              destroy: false,
            ),
          ),
      ],
    );
  }
}
