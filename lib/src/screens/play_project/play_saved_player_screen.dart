import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../actions/rename_action.dart';
import '../../constants.dart';
import '../../providers.dart';
import 'play_room_screen.dart';

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
    final selectSound = project.menuSelectSound?.getSoundReference();
    final activateSound = project.menuActivateSound?.getSoundReference();
    final value = ref.watch(gameOptionsContextProvider);
    return Cancel(
      child: SimpleScaffold(
        title: 'Select Player',
        body: value.when(
          data: (final gameOptionsContext) {
            final players = gameOptionsContext.gameOptions.players;
            return ListView.builder(
              itemBuilder: (final context, final index) {
                final player = players[index];
                return MaybePlaySoundSemantics(
                  sound: selectSound == null
                      ? null
                      : projectContext.getSound(
                          soundReference: selectSound,
                          destroy: false,
                        ),
                  child: PerformableActionsListTile(
                    actions: [
                      RenameAction(
                        context: context,
                        oldName: player.name,
                        onRename: (final name) async {
                          player.name = name;
                          gameOptionsContext.save();
                          ref.invalidate(gameOptionsContextProvider);
                        },
                        title: 'Rename Player',
                      ),
                      PerformableAction(
                        name: 'Delete',
                        invoke: () => context.confirm(
                          message: 'Really delete ${player.name}?',
                          title: confirmDeleteTitle,
                          yesCallback: () async {
                            Navigator.pop(context);
                            if (players.length == 1) {
                              Navigator.pop(context);
                            }
                            players.removeWhere(
                              (final player) => player.id == player.id,
                            );
                            gameOptionsContext.save();
                            ref.invalidate(gameOptionsContextProvider);
                          },
                        ),
                        activator: deleteShortcut,
                      ),
                    ],
                    autofocus: index == 0,
                    title: Text(player.name),
                    onTap: () {
                      if (activateSound != null) {
                        context.playSound(
                          projectContext.getSound(
                            soundReference: activateSound,
                            destroy: true,
                          ),
                        );
                      }
                      setState(() => _playerId = player.id);
                    },
                  ),
                );
              },
              itemCount: players.length,
              shrinkWrap: true,
            );
          },
          error: ErrorScreen.withPositional,
          loading: LoadingScreen.new,
        ),
      ),
    );
  }
}
