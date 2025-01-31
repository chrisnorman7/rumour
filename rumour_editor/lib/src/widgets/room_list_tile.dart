import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// A list tile which shows a room.
class RoomListTile extends ConsumerWidget {
  /// Create an instance.
  const RoomListTile({
    required this.roomId,
    required this.onChanged,
    this.title = 'Room',
    this.autofocus = false,
    super.key,
  });

  /// The ID of the room to use.
  final int roomId;

  /// The function to call when the room changes.
  final void Function(Room room) onChanged;

  /// The title of the [ListTile].
  final String title;

  /// Whether the [ListTile] should be autofocused.
  final bool autofocus;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(roomProvider(roomId));
    return value.when(
      data:
          (final room) => PlaySoundReferenceSemantics(
            soundReferenceId: room.ambianceId,
            child: Builder(
              builder:
                  (final builderContext) => ListTile(
                    autofocus: autofocus,
                    title: Text(title),
                    subtitle: Text(room.name),
                    onTap:
                        () =>
                            builderContext..pushWidgetBuilder(
                              (final _) => SelectRoomScreen(
                                onChanged: onChanged,
                                roomId: roomId,
                                zoneId: room.zoneId,
                              ),
                            ),
                  ),
            ),
          ),
      error: ErrorListTile.withPositional,
      loading:
          () => ListTile(
            autofocus: autofocus,
            title: Text(title),
            subtitle: const LoadingWidget(),
            onTap: () {},
          ),
    );
  }
}
