import 'dart:io';

import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;

import '../../constants.dart';
import '../../database/database.dart';
import '../../game_player_file.dart';
import '../../json/game_player.dart';
import '../../providers.dart';
import 'play_room_screen.dart';

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
          data: (final playerClasses) => AudioGameMenu(
            title: 'Select Class',
            menuItems: playerClasses
                .map(
                  (final playerClass) => AudioGameMenuItem(
                    title: '${playerClass.name}: ${playerClass.description}',
                    onActivate: (final innerContext) =>
                        setState(() => _playerClass = playerClass),
                  ),
                )
                .toList(),
          ),
          error: ErrorScreen.withPositional,
          loading: LoadingScreen.new,
        ),
      );
    }
    return Cancel(
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
  }

  /// Create the new player.
  Future<void> newPlayer() async {
    final playerClass = _playerClass;
    if (playerClass == null) {
      return;
    }
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
    setState(() {
      _playerId = gamePlayerFile.id;
    });
  }
}
