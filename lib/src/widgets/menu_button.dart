import 'package:backstreets_widgets/extensions.dart';
import 'package:flutter/material.dart';

/// The menu button for all project tabs.
class MenuButton extends StatelessWidget {
  /// Create an instance.
  const MenuButton({
    required this.menuController,
    super.key,
  });

  /// The menu controller to use.
  final MenuController menuController;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => ElevatedButton(
        onPressed: menuController.toggle,
        child: const Icon(
          Icons.menu,
          semanticLabel: 'Menu',
        ),
      );
}
