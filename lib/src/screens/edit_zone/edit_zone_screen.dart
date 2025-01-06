import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'tabs/zone_rooms_tab.dart';
import 'tabs/zone_settings_tab.dart';

/// A screen for editing a zone.
class EditZoneScreen extends ConsumerWidget {
  /// Create an instance.
  const EditZoneScreen({
    required this.zoneId,
    super.key,
  });

  /// The ID of the zone to edit.
  final int zoneId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) => Cancel(
        child: TabbedScaffold(
          tabs: [
            TabbedScaffoldTab(
              title: 'Settings',
              icon: const Text('Zone settings'),
              builder: (final _) => ZoneSettingsTab(zoneId: zoneId),
            ),
            TabbedScaffoldTab(
              title: 'Rooms',
              icon: const Text('The rooms in this zone'),
              builder: (final _) => ZoneRoomsTab(zoneId: zoneId),
            ),
          ],
        ),
      );
}
