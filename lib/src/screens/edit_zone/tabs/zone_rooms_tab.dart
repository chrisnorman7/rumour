import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../extensions/async_value_x.dart';
import '../../../providers.dart';
import '../../../widgets/nothing_to_see.dart';

/// The zone rooms tab.
class ZoneRoomsTab extends ConsumerWidget {
  /// Create an instance.
  const ZoneRoomsTab({
    required this.zoneId,
    super.key,
  });

  /// The ID of the zone to get rooms for.
  final int zoneId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(roomsProvider(zoneId));
    return value.simpleWhen((final rooms) {
      if (rooms.isEmpty) {
        return const NothingToSee(
          message: "You haven't created any rooms yet.",
        );
      }
      return ListView.builder(
        itemBuilder: (final context, final index) {
          final room = rooms[index];
          return ListTile(
            autofocus: index == 0,
            title: Text(room.name),
            onTap: () {},
          );
        },
        itemCount: rooms.length,
        shrinkWrap: true,
      );
    });
  }
}
