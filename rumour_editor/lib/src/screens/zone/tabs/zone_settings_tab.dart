import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The zone settings tab.
class ZoneSettingsTab extends ConsumerWidget {
  /// Create an instance.
  const ZoneSettingsTab({required this.zoneId, super.key});

  /// The ID of the zone to edit.
  final int zoneId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final projectContext = ref.watch(projectContextProvider);
    final database = projectContext.database;
    final zones = database.managers.zones;
    final query = zones.filter((final f) => f.id.equals(zoneId));
    final value = ref.watch(zoneProvider(zoneId));
    return value.simpleWhen(
      (final zone) => ListView(
        shrinkWrap: true,
        children: [
          TextListTile(
            value: zone.name,
            onChanged: (final value) async {
              await query.update((final f) => f(name: Value(value)));
              invalidateProviders(ref);
            },
            header: 'Name',
            autofocus: true,
            title: 'Rename Zone',
          ),
          TextListTile(
            value: zone.description,
            onChanged: (final value) async {
              await query.update((final f) => f(description: Value(value)));
              invalidateProviders(ref);
            },
            header: 'Description',
            title: 'Describe Zone',
          ),
          SoundReferenceListTile(
            soundReferenceId: zone.musicId,
            onChanged: (final id) async {
              await query.update((final f) => f(musicId: Value(id)));
              invalidateProviders(ref);
            },
            title: 'Music',
            looping: true,
          ),
        ],
      ),
    );
  }

  /// Invalidate providers.
  void invalidateProviders(final WidgetRef ref) =>
      ref
        ..invalidate(zonesProvider)
        ..invalidate(zoneProvider(zoneId));
}
