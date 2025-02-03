import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// A [ListTile] which shows a player stat.
class PlayerStatListTile extends ConsumerWidget {
  /// Create an instance.
  const PlayerStatListTile({
    required this.playerId,
    required this.gameStatId,
    this.autofocus = false,
    super.key,
  });

  /// The ID of the player to load.
  final String playerId;

  /// The ID of the game stat to use.
  final int gameStatId;

  /// Whether the [ListTile] should be autofocused.
  final bool autofocus;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final project = projectContext.project;
    final template = projectContext.jinjaEnvironment.fromString(
      project.statMenuItemFormat,
    );
    final value = ref.watch(gameStatContextProvider(gameStatId));
    return value.when(
      data: (final gameStatContext) {
        final gameStat = gameStatContext.gameStat;
        final value = ref.watch(
          gameStatValueContextProvider(playerId, gameStatId),
        );
        return value.when(
          data: (final gameStatValueContext) => AudioGameMenuItemListTile(
            menuItem: AudioGameMenuItem(
              title: projectContext.renderTemplate(
                rumourTemplate: RumourTemplate.playerStatTemplate,
                template: template,
                value: gameStatValueContext,
              ),
              onActivate: (final innerContext) {},
            ),
            selectSound: projectContext.maybeGetSound(
              soundReference: project.menuSelectSound?.getSoundReference(),
              destroy: false,
            ),
            activateSound: projectContext.maybeGetSound(
              soundReference: project.menuActivateSound?.getSoundReference(),
              destroy: true,
            ),
            autofocus: autofocus,
          ),
          error: ErrorListTile.withPositional,
          loading: () => ListTile(
            autofocus: autofocus,
            title: Text(gameStat.name),
            subtitle: const CircularProgressIndicator(
              semanticsLabel: 'Loading...',
            ),
            onTap: () {},
          ),
        );
      },
      error: ErrorListTile.withPositional,
      loading: () => ListTile(
        autofocus: autofocus,
        title: const CircularProgressIndicator(
          semanticsLabel: 'Loading...',
        ),
        onTap: () {},
      ),
    );
  }
}
