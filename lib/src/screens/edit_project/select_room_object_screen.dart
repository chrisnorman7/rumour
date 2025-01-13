import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../database/database.dart';
import '../../extensions/async_value_x.dart';
import '../../providers.dart';
import '../../room_object_context.dart';
import '../../widgets/play_sound_reference_semantics.dart';

/// A list tile to show objects.
class _ObjectsListTile extends ConsumerWidget {
  /// Create an instance.
  const _ObjectsListTile({
    required this.room,
    required this.selectObject,
    this.roomObjectContext,
  });

  /// The room to use.
  final Room room;

  /// The room object context to use.
  final RoomObjectContext? roomObjectContext;

  /// The function to call when an object is selected.
  final ValueChanged<RoomObject> selectObject;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(objectsInRoomProvider(room.id));
    return PlaySoundReferenceSemantics(
      soundReferenceId: room.ambianceId,
      looping: true,
      child: value.when(
        data: (final objects) => ExpansionTile(
          initiallyExpanded: objects
              .where(
                (final object) => object.id == roomObjectContext?.roomObject.id,
              )
              .isNotEmpty,
          title: Text(room.name),
          subtitle: Text(room.description),
          children: objects
              .map(
                (final object) => PlaySoundReferenceSemantics(
                  soundReferenceId: object.ambianceId,
                  looping: true,
                  child: ListTile(
                    autofocus: object.id == roomObjectContext?.roomObject.id,
                    title: Text(object.name),
                    subtitle: Text(object.description),
                    onTap: () {
                      Navigator.pop(context);
                      selectObject(object);
                    },
                  ),
                ),
              )
              .toList(),
        ),
        error: ErrorListTile.withPositional,
        loading: () => ListTile(
          title: Text(room.name),
          subtitle: Text(room.description),
        ),
      ),
    );
  }
}

/// A list tile to show a zone.
class _ZoneListTile extends ConsumerWidget {
  /// Create an instance.
  const _ZoneListTile({
    required this.zone,
    required this.selectObject,
    this.roomObjectContext,
  });

  /// The zone to use.
  final Zone zone;

  /// The function to call when an object is selected.
  final ValueChanged<RoomObject> selectObject;

  /// The room object context to use.
  final RoomObjectContext? roomObjectContext;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(roomsProvider(zone.id));
    return PlaySoundReferenceSemantics(
      soundReferenceId: zone.musicId,
      looping: true,
      child: value.when(
        data: (final rooms) => ExpansionTile(
          initiallyExpanded: roomObjectContext?.room.zoneId == zone.id,
          title: Text(zone.name),
          subtitle: Text(zone.description),
          children: rooms
              .map(
                (final room) => _ObjectsListTile(
                  room: room,
                  roomObjectContext: roomObjectContext,
                  selectObject: selectObject,
                ),
              )
              .toList(),
        ),
        error: ErrorListTile.withPositional,
        loading: () => ListTile(
          title: Text(zone.name),
          subtitle: Text(zone.description),
          onTap: () {},
        ),
      ),
    );
  }
}

/// A [ListView] containing all zones.
class _ZonesListView extends ConsumerWidget {
  /// Create an instance.
  const _ZonesListView({
    required this.selectObject,
    this.roomObjectContext,
  });

  /// The function to call when a new room object is selected.
  final ValueChanged<RoomObject> selectObject;

  /// The room object context to use.
  final RoomObjectContext? roomObjectContext;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(zonesProvider);
    return value.simpleWhen(
      (final zones) => ListView.builder(
        itemBuilder: (final context, final index) {
          final zone = zones[index];
          return _ZoneListTile(
            zone: zone,
            roomObjectContext: roomObjectContext,
            selectObject: selectObject,
          );
        },
        itemCount: zones.length,
        shrinkWrap: true,
      ),
    );
  }
}

/// A screen for selecting room objects.
class SelectRoomObjectScreen extends ConsumerWidget {
  /// Create an instance.
  const SelectRoomObjectScreen({
    required this.selectObject,
    this.roomObjectId,
    this.title = 'Select Object',
    super.key,
  });

  /// The ID of the currently-selected object.
  final int? roomObjectId;

  /// The function to call when an object is selected.
  final ValueChanged<RoomObject> selectObject;

  /// The title of this screen.
  final String title;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final id = roomObjectId;
    if (id == null) {
      return Cancel(
        child: SimpleScaffold(
          title: title,
          body: _ZonesListView(
            selectObject: selectObject,
          ),
        ),
      );
    }
    final value = ref.watch(roomObjectContextProvider(id));
    return Cancel(
      child: SimpleScaffold(
        title: title,
        body: value.simpleWhen(
          (final roomObjectContext) => _ZonesListView(
            roomObjectContext: roomObjectContext,
            selectObject: selectObject,
          ),
        ),
      ),
    );
  }
}
