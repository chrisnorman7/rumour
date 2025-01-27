import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';
import 'package:rumour_editor/src/screens/player_class/tabs/player_class_game_stats_tab.dart';

/// A screen for editing player classes.
class EditPlayerClassScreen extends ConsumerWidget {
  /// Create an instance.
  const EditPlayerClassScreen({required this.playerClassId, super.key});

  /// The ID of the player class to edit.
  final int playerClassId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) => Cancel(
    child: TabbedScaffold(
      tabs: [
        TabbedScaffoldTab(
          title: 'Player Class Settings',
          icon: const Text('Settings for the player class'),
          builder: (_) => PlayerClassSettingsTab(playerClassId: playerClassId),
        ),
        TabbedScaffoldTab(
          title: 'Stats',
          icon: const Text('The stat defaults for this class'),
          builder: (_) => PlayerClassGameStatsTab(playerClassId: playerClassId),
        ),
      ],
    ),
  );

  /// Invalidate providers.
  void invalidateProviders(final WidgetRef ref) =>
      ref
        ..invalidate(playerClassesProvider)
        ..invalidate(playerClassProvider(playerClassId));
}
