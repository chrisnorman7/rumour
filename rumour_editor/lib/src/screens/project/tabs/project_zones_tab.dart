import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The zones tab.
class ProjectZonesTab extends ConsumerWidget {
  /// Create an instance.
  const ProjectZonesTab({super.key});

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final database = ref.watch(databaseProvider);
    final zoneManager = database.managers.zones;
    final value = ref.watch(zonesProvider);
    return value.simpleWhen(
      (final zones) => ListView.builder(
        itemBuilder: (final context, final index) {
          final zone = zones[index];
          final query = zoneManager.filter((final f) => f.id.equals(zone.id));
          return PlaySoundReferenceSemantics(
            soundReferenceId: zone.musicId,
            looping: true,
            child: Builder(
              builder:
                  (final builderContext) => PerformableActionsListTile(
                    autofocus: index == 0,
                    actions: [
                      RenameAction(
                        context: builderContext,
                        oldName: zone.name,
                        onRename: (final name) async {
                          await query.update((final f) => f(name: Value(name)));
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
                        invoke:
                            () => context.showConfirmMessage(
                              message: 'Really delete the ${zone.name} zone?',
                              title: confirmDeleteTitle,
                              yesCallback: () async {
                                await query.delete();
                                ref.invalidate(zonesProvider);
                              },
                            ),
                      ),
                    ],
                    title: Text(zone.name),
                    subtitle: Text(zone.description),
                    onTap:
                        () =>
                            builderContext..pushWidgetBuilder(
                              (final _) => EditZoneScreen(zoneId: zone.id),
                            ),
                  ),
            ),
          );
        },
        itemCount: zones.length,
        shrinkWrap: true,
      ),
    );
  }
}
