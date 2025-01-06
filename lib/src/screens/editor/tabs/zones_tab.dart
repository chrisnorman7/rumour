import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../extensions/async_value_x.dart';
import '../../../providers.dart';
import '../../../widgets/nothing_to_see.dart';

/// The zones tab.
class ZonesTab extends ConsumerWidget {
  /// Create an instance.
  const ZonesTab({
    super.key,
  });

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
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
          return ListTile(
            autofocus: index == 0,
            title: Text(zone.name),
            subtitle: Text(zone.description),
          );
        },
        itemCount: zones.length,
        shrinkWrap: true,
      );
    });
  }
}
