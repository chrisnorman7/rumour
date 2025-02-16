import 'dart:io';

import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_player/rumour_player.dart';

class _NewPlayer extends ConsumerStatefulWidget {
  /// Create an instance.
  const _NewPlayer({
    required this.playerClass,
    required this.onPlayerCreated,
  });

  /// The player class to use.
  final PlayerClass playerClass;

  /// The function to call to when the new player is created.
  final ValueChanged<String> onPlayerCreated;

  /// Create state for this widget.
  @override
  _NewPlayerState createState() => _NewPlayerState();
}

/// State for [_NewPlayer].
class _NewPlayerState extends ConsumerState<_NewPlayer> {
  /// The text editing controller to use.
  late final TextEditingController _controller;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  /// Dispose of the widget.
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) => Cancel(
        child: SimpleScaffold(
          title: 'Create Player',
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                autofocus: true,
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Player name',
                ),
                enableSuggestions: false,
                onSubmitted: (final value) => newPlayer(),
              ),
            ],
          ),
          floatingActionButton: SaveButton(
            onPressed: newPlayer,
            tooltip: 'Save player',
          ),
        ),
      );

  /// Create the new player.
  Future<void> newPlayer() async {
    final playerClass = widget.playerClass;
    final player = GamePlayer(
      name: _controller.text,
      classId: playerClass.id,
      roomId: playerClass.roomId,
      x: playerClass.x,
      y: playerClass.y,
    );
    final directory = await ref.read(gamePlayersDirectoryProvider.future);
    final file = File(path.join(directory.path, '${getUuid()}.player'));
    final gamePlayerFile = GamePlayerFile(file: file, gamePlayer: player)
      ..save();
    ref.invalidate(gamePlayersProvider);
    widget.onPlayerCreated(gamePlayerFile.id);
  }
}

/// A screen to create a new player.
class NewPlayerScreen extends ConsumerStatefulWidget {
  /// Create an instance.
  const NewPlayerScreen({
    super.key,
  });

  /// Create state for this widget.
  @override
  NewPlayerScreenState createState() => NewPlayerScreenState();
}

/// State for [NewPlayerScreen].
class NewPlayerScreenState extends ConsumerState<NewPlayerScreen> {
  /// The player class to use.
  PlayerClass? _playerClass;

  /// The ID of the created player.
  String? _playerId;

  /// Build a widget.
  @override
  Widget build(final BuildContext context) {
    final id = _playerId;
    if (id != null) {
      return PlayRoomScreen(playerId: id);
    }
    final playerClass = _playerClass;
    if (playerClass == null) {
      final value = ref.watch(playerClassesProvider);
      return Cancel(
        child: value.when(
          data: (final playerClasses) {
            if (playerClasses.length == 1) {
              _playerClass = playerClasses.single;
              return _NewPlayer(
                playerClass: playerClasses.single,
                onPlayerCreated: (final value) =>
                    setState(() => _playerId = value),
              );
            }
            return AudioGameMenu(
              title: 'Select Class',
              menuItems: playerClasses
                  .map(
                    (final playerClass) => AudioGameMenuItem(
                      title: '${playerClass.name}: ${playerClass.description}',
                      onActivate: (final innerContext) => setState(
                        () => _playerClass = playerClass,
                      ),
                    ),
                  )
                  .toList(),
            );
          },
          error: ErrorScreen.withPositional,
          loading: LoadingScreen.new,
        ),
      );
    }
    return _NewPlayer(
      playerClass: playerClass,
      onPlayerCreated: (final value) => setState(() => _playerId = value),
    );
  }
}
