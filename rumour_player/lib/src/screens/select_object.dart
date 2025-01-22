import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:rumour_backend/rumour_backend.dart';

/// A widget which lets the player select an object from [objects].
class SelectObject extends StatelessWidget {
  /// Create an instance.
  const SelectObject({
    required this.objects,
    required this.onObjectSelect,
    super.key,
  });

  /// The objects which the player can select from.
  final List<RoomObject> objects;

  /// The function to call when an object is selected from [objects].
  final void Function(RoomObject object) onObjectSelect;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => Cancel(
        child: SimpleScaffold(
          title: 'Select Object',
          body: ListView.builder(
            itemBuilder: (final context, final index) {
              final object = objects[index];
              return ListTile(
                autofocus: index == 0,
                title: Text(object.name),
                onTap: () {
                  Navigator.pop(context);
                  onObjectSelect(object);
                },
              );
            },
            itemCount: objects.length,
            shrinkWrap: true,
          ),
        ),
      );
}
