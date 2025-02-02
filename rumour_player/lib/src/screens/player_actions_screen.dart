import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// A screen to select a player action from [playerActions].
class PlayerActionsScreen extends StatelessWidget {
  /// Create an instance.
  const PlayerActionsScreen({
    required this.title,
    required this.playerActions,
    super.key,
  });

  /// The title of this screen.
  final String title;

  /// The actions to use.
  final List<PlayerAction> playerActions;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => Cancel(
        child: SimpleScaffold(
          title: title,
          body: AudioGameMenuListView(
            menuItems: [
              ...playerActions.map(
                (final playerAction) => AudioGameMenuItem(
                  title: playerAction.name,
                  onActivate: (final innerContext) {
                    innerContext.pop();
                    playerAction.performAction();
                  },
                  earcon: playerAction.earcon,
                ),
              ),
            ],
          ),
        ),
      );
}
