import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_player/rumour_player.dart';

/// A screen to play a saved player.
class PlaySavedPlayerScreen extends ConsumerStatefulWidget {
  /// Create an instance.
  const PlaySavedPlayerScreen({
    super.key,
  });

  /// Create state for this widget.
  @override
  PlaySavedPlayerScreenState createState() => PlaySavedPlayerScreenState();
}

/// State for [PlaySavedPlayerScreen].
class PlaySavedPlayerScreenState extends ConsumerState<PlaySavedPlayerScreen> {
  /// The ID of the player to play.
  String? _playerId;

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final id = _playerId;
    if (id != null) {
      return PlayRoomScreen(playerId: id);
    }
    final projectContext = ref.watch(projectContextProvider);
    final project = projectContext.project;
    final selectSound = projectContext.maybeGetSound(
      soundReference: project.menuSelectSound?.getSoundReference(),
      destroy: false,
    );
    final activateSound = projectContext.maybeGetSound(
      soundReference: project.menuActivateSound?.getSoundReference(),
      destroy: true,
    );
    final value = ref.watch(gamePlayersProvider);
    return Cancel(
      child: SimpleScaffold(
        title: 'Select Player',
        body: value.when(
          data: (final players) => ListView.builder(
            itemBuilder: (final context, final index) {
              final gamePlayerFile = players[index];
              final player = gamePlayerFile.gamePlayer;
              return MaybePlaySoundSemantics(
                sound: selectSound,
                child: PerformableActionsListTile(
                  actions: [
                    RenameAction(
                      context: context,
                      oldName: player.name,
                      onRename: (final name) async {
                        player.name = name;
                        gamePlayerFile.save();
                        ref
                          ..invalidate(gamePlayersProvider)
                          ..invalidate(
                            gamePlayerContextProvider(gamePlayerFile.id),
                          );
                      },
                      title: 'Rename Player',
                    ),
                    PerformableAction(
                      name: 'Delete',
                      invoke: () => context.showConfirmMessage(
                        message: 'Really delete ${player.name}?',
                        title: confirmDeleteTitle,
                        yesCallback: () async {
                          if (players.length == 1) {
                            context.pop();
                          }
                          gamePlayerFile.file.deleteSync(recursive: true);
                          ref.invalidate(gamePlayersProvider);
                        },
                      ),
                      activator: deleteShortcut,
                    ),
                  ],
                  autofocus: index == 0,
                  title: Text(player.name),
                  onTap: () {
                    context.maybePlaySound(activateSound);
                    setState(() => _playerId = gamePlayerFile.id);
                  },
                ),
              );
            },
            itemCount: players.length,
            shrinkWrap: true,
          ),
          error: ErrorScreen.withPositional,
          loading: LoadingScreen.new,
        ),
      ),
    );
  }
}
