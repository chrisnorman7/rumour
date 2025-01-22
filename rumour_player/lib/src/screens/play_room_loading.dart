import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// The screen to show while [room] is loading.
class PlayRoomLoading extends StatelessWidget {
  /// Create an instance.
  const PlayRoomLoading({
    required this.room,
    super.key,
  });

  /// The room which is loading.
  final Room room;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => SimpleScaffold(
        title: room.name,
        body: GameShortcuts(shortcuts: const [], child: Text(room.name)),
      );
}
