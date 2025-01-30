import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// The type of a function which is called to change the selection of a room
/// object.
typedef RoomObjectSelectChange = void Function(RoomObject object);

/// A tile which shows a room object.
class RoomObjectTile extends ConsumerWidget {
  /// Create an instance.
  const RoomObjectTile({
    required this.roomObjectId,
    required this.onSelectChange,
    this.selected = false,
    super.key,
  });

  /// The ID of the object to show.
  final int roomObjectId;

  /// Whether or not the object is selected.
  final bool selected;

  /// The function to call to select or unselect the object.
  final RoomObjectSelectChange onSelectChange;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final defaultTextStyle = Theme.of(context).textTheme.bodyMedium;
    return RoomObjectPerformableActionsBuilder(
      roomObjectId: roomObjectId,
      builder:
          (final context, final object, final controller) => Row(
            children: [
              Expanded(
                flex: 2,
                child: DefaultTextStyle(
                  style: defaultTextStyle!.copyWith(
                    fontSize: selected ? 18.0 : null,
                    fontWeight: selected ? FontWeight.bold : null,
                    color: selected ? Colors.blue : null,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(child: Text(object.name)),
                      Flexible(flex: 2, child: Text(object.description)),
                    ],
                  ),
                ),
              ),
              Expanded(child: MenuButton(menuController: controller)),
            ],
          ),
      isSelected: selected,
      onSelectChange: onSelectChange,
      error: ErrorText.withPositional,
    );
  }
}
