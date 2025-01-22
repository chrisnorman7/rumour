import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// A widget for selecting a room.
class SelectRoomScreen extends ConsumerWidget {
  /// Create an instance.
  const SelectRoomScreen({
    required this.onChanged,
    this.zoneId,
    this.roomId,
    super.key,
  });

  /// The ID of the zone to pick from.
  ///

  /// The function to call when a new room is selected.
  final ValueChanged<Room> onChanged;

  /// If [zoneId] is `null`, then a zone will be selected first.
  final int? zoneId;

  /// The ID of the currently-selected room.
  final int? roomId;

  /// Build a widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(zonesProvider);
    return Cancel(
      child: SimpleScaffold(
        title: 'Select Zone',
        body: value.simpleWhen((final zones) {
          if (zones.isEmpty) {
            return const NothingToSee(
              message: 'No zones have been created yet.',
            );
          }
          return ListView.builder(
            itemBuilder: (final context, final index) {
              final zone = zones[index];
              return ZoneListTile(
                zoneId: zone.id,
                onRoomSelected: (final value) {
                  Navigator.pop(context);
                  onChanged(value);
                },
                autofocus: index == 0,
              );
            },
            itemCount: zones.length,
            shrinkWrap: true,
          );
        }),
      ),
    );
  }
}
