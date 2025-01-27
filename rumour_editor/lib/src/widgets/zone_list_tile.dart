import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// A [ListTile] which shows a [zone] and its attached rooms.
class ZoneListTile extends ConsumerWidget {
  /// Create an instance.
  const ZoneListTile({
    required this.zoneId,
    required this.onRoomSelected,
    this.roomId,
    this.autofocus = false,
    super.key,
  });

  /// The ID of the zone to show.
  final int zoneId;

  /// The function to call when a room is selected.
  final ValueChanged<Room> onRoomSelected;

  /// The ID of the currently-selected room.
  final int? roomId;

  /// Whether this list tile should be autofocused.
  final bool autofocus;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final zoneValue = ref.watch(zoneProvider(zoneId));
    return zoneValue.when(
      data: (final zone) {
        final roomsValue = ref.watch(roomsProvider(zoneId));
        return roomsValue.when(
          data:
              (final rooms) => PlaySoundReferenceSemantics(
                soundReferenceId: zone.musicId,
                looping: true,
                child: ExpansionTile(
                  initiallyExpanded: autofocus,
                  title: Text(zone.name),
                  subtitle: Text(zone.description),
                  children:
                      rooms
                          .map(
                            (final room) => PlaySoundReferenceSemantics(
                              soundReferenceId: room.ambianceId,
                              looping: true,
                              child: ListTile(
                                autofocus:
                                    autofocus && room.id == rooms.first.id,
                                selected: room.id == roomId,
                                title: Text(room.name),
                                subtitle: Text(room.description),
                                onTap: () => onRoomSelected(room),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
          error: ErrorListTile.withPositional,
          loading:
              () => PlaySoundReferenceSemantics(
                soundReferenceId: zone.musicId,
                child: ListTile(
                  autofocus: autofocus,
                  title: Text(zone.name),
                  subtitle: Text(zone.description),
                  onTap: () {},
                ),
              ),
        );
      },
      error: ErrorListTile.withPositional,
      loading: LoadingWidget.new,
    );
  }
}
