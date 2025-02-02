import 'dart:async';

import 'package:flutter_audio_games/flutter_audio_games.dart';

/// A class which holds information about an action which can be performed by a
/// player.
class PlayerAction {
  /// Create an instance.
  const PlayerAction({
    required this.name,
    required this.performAction,
    this.earcon,
  });

  /// The name of this action.
  final String name;

  /// The earcon of this action.
  final Sound? earcon;

  /// The function to call to perform this action.
  final FutureOr<void> Function() performAction;
}
