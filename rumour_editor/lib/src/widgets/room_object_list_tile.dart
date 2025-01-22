import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// A [ListTile] which can be used to select a new room object.
class RoomObjectListTile extends ConsumerWidget {
  /// Create an instance.
  const RoomObjectListTile({
    required this.roomObjectId,
    required this.onChanged,
    this.title = 'Object',
    this.autofocus = false,
    super.key,
  });

  /// The ID of the current room object.
  final int roomObjectId;

  /// The function to call when [roomObjectId] changes.
  final ValueChanged<RoomObject> onChanged;

  /// The title of this [ListTile].
  final String title;

  /// Whether this [ListTile] should be autofocused.
  final bool autofocus;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(roomObjectContextProvider(roomObjectId));
    return value.when(
      data: (final roomObjectContext) {
        final object = roomObjectContext.roomObject;
        final room = roomObjectContext.room;
        return PlaySoundReferenceSemantics(
          soundReferenceId: object.ambianceId,
          child: Builder(
            builder:
                (final builderContext) => ListTile(
                  autofocus: autofocus,
                  title: Text(title),
                  subtitle: Text('${room.name} -> ${object.name}'),
                  onTap:
                      () =>
                          builderContext
                            ..stopPlaySoundSemantics()
                            ..pushWidgetBuilder(
                              (final _) => SelectRoomObjectScreen(
                                selectObject: onChanged,
                                roomObjectId: roomObjectId,
                              ),
                            ),
                ),
          ),
        );
      },
      error: ErrorListTile.withPositional,
      loading:
          () => ListTile(
            autofocus: autofocus,
            title: Text(title),
            subtitle: const LoadingWidget(),
          ),
    );
  }
}
