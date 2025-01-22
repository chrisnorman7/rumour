import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// A screen to select a player class.
class SelectPlayerClass extends ConsumerWidget {
  /// Create an instance.
  const SelectPlayerClass({
    required this.onChanged,
    this.playerClassId,
    super.key,
  });

  /// The function to call when a new player class is selected.
  final ValueChanged<PlayerClass> onChanged;

  /// The ID of the currently-selected player class.
  final int? playerClassId;

  /// Build the widget.
  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final value = ref.watch(playerClassesProvider);
    return Cancel(
      child: SimpleScaffold(
        title: 'Select Player Class',
        body: value.simpleWhen(
          (final playerClasses) => ListView.builder(
            itemBuilder: (final context, final index) {
              final playerClass = playerClasses[index];
              return ListTile(
                autofocus: index == 0 || playerClass.id == playerClassId,
                title: Text(playerClass.name),
                subtitle: Text(playerClass.description),
                onTap: () {
                  Navigator.pop(context);
                  onChanged(playerClass);
                },
              );
            },
            itemCount: playerClasses.length,
            shrinkWrap: true,
          ),
        ),
      ),
    );
  }
}
