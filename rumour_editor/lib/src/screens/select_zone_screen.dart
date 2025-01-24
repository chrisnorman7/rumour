import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// A screen for selecting a new zone.
class SelectZoneScreen extends ConsumerWidget {
  /// Create an instance.
  const SelectZoneScreen({
    required this.onChanged,
    required this.currentZoneId,
    this.title = 'Select Zone',
    super.key,
  });

  /// The function to call when the zone changes.
  final ValueChanged<int> onChanged;

  /// The ID of the current zone.
  final int? currentZoneId;

  /// The title of the screen.
  final String title;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(zonesProvider);
    return Cancel(
      child: SimpleScaffold(
        title: title,
        body: value.simpleWhen(
          (final zones) => ListView.builder(
            itemBuilder: (final context, final index) {
              final zone = zones[index];
              return PlaySoundReferenceSemantics(
                soundReferenceId: zone.musicId,
                child: ListTile(
                  autofocus: index == 0,
                  title: Text(zone.name),
                  subtitle: Text(zone.description),
                  selected: zone.id == currentZoneId,
                  onTap: () {
                    Navigator.pop(context);
                    onChanged(zone.id);
                  },
                ),
              );
            },
            itemCount: zones.length,
            shrinkWrap: true,
          ),
        ),
      ),
    );
  }
}
