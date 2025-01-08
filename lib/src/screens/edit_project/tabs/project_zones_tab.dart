import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../actions/describe_action.dart';
import '../../../actions/rename_action.dart';
import '../../../constants.dart';
import '../../../extensions/async_value_x.dart';
import '../../../providers.dart';
import '../../../widgets/nothing_to_see.dart';
import '../../../widgets/play_sound_reference_semantics.dart';
import '../../edit_zone/edit_zone_screen.dart';

/// The zones tab.
class ProjectZonesTab extends ConsumerWidget {
  /// Create an instance.
  const ProjectZonesTab({
    super.key,
  });

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final zoneManager = projectContext.database.managers.zones;
    final value = ref.watch(zonesProvider);
    return value.simpleWhen((final zones) {
      if (zones.isEmpty) {
        return const NothingToSee(
          message: "You haven't created any zones yet.",
        );
      }
      return ListView.builder(
        itemBuilder: (final context, final index) {
          final zone = zones[index];
          final query = zoneManager.filter((final f) => f.id.equals(zone.id));
          return PlaySoundReferenceSemantics(
            soundReferenceId: zone.musicId,
            looping: true,
            child: Builder(
              builder: (final builderContext) => PerformableActionsListTile(
                autofocus: index == 0,
                actions: [
                  RenameAction(
                    context: builderContext,
                    oldName: zone.name,
                    onRename: (final name) async {
                      await query.update(
                        (final f) => f(name: Value(name)),
                      );
                      ref
                        ..invalidate(zonesProvider)
                        ..invalidate(zoneProvider(zone.id));
                    },
                    title: 'Rename Zone',
                  ),
                  DescribeAction(
                    context: builderContext,
                    oldDescription: zone.description,
                    onDescribe: (final description) async {
                      await query.update(
                        (final f) => f(description: Value(description)),
                      );
                      ref
                        ..invalidate(zonesProvider)
                        ..invalidate(zoneProvider(zone.id));
                    },
                    title: 'Rename Zone',
                  ),
                  PerformableAction(
                    name: 'Delete',
                    activator: deleteShortcut,
                    invoke: () => context.confirm(
                      message: 'Really delete the ${zone.name} zone?',
                      title: confirmDeleteTitle,
                      yesCallback: () async {
                        Navigator.pop(context);
                        await query.delete();
                        ref.invalidate(zonesProvider);
                      },
                    ),
                  ),
                ],
                title: Text(zone.name),
                subtitle: Text(zone.description),
                onTap: () => builderContext
                  ..stopPlaySoundSemantics()
                  ..pushWidgetBuilder(
                    (final _) => EditZoneScreen(zoneId: zone.id),
                  ),
              ),
            ),
          );
        },
        itemCount: zones.length,
        shrinkWrap: true,
      );
    });
  }
}
