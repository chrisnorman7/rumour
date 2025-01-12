import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../extensions/async_value_x.dart';
import '../../providers.dart';
import '../../widgets/sound_reference_list_tile.dart';

/// A widget to edit a room exit.
class EditRoomExitScreen extends ConsumerWidget {
  /// Create an instance.
  const EditRoomExitScreen({
    required this.roomExitId,
    super.key,
  });

  /// The ID of the room exit to edit.
  final int roomExitId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final query = projectContext.database.managers.roomExits
        .filter((final f) => f.id.equals(roomExitId));
    final provider = roomExitProvider(roomExitId);
    final value = ref.watch(provider);
    return Cancel(
      child: SimpleScaffold(
        title: 'Edit Exit',
        body: value.simpleWhen(
          (final roomExit) => ListView(
            shrinkWrap: true,
            children: [
              SoundReferenceListTile(
                soundReferenceId: roomExit.useSoundId,
                onChanged: (final value) async {
                  await query.update(
                    (final o) => o(useSoundId: Value(value)),
                  );
                  ref.invalidate(provider);
                },
                title: 'Use sound',
                autofocus: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
