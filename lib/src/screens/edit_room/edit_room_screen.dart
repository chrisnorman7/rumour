import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A screen for editing a room.
class EditRoomScreen extends ConsumerWidget {
  /// Create an instance.
  const EditRoomScreen({
    required this.roomId,
    super.key,
  });

  /// The ID of the room to edit.
  final int roomId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) => Cancel(
        child: SimpleScaffold(
          title: 'Edit Room',
          body: CenterText(
            text: '#$roomId.',
            autofocus: true,
          ),
        ),
      );
}
