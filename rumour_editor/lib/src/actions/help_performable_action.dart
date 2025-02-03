import 'package:backstreets_widgets/extensions.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:rumour_editor/src/screens/help_screen.dart';

/// The help action.
class HelpPerformableAction extends PerformableAction {
  /// Create an instance.
  HelpPerformableAction({
    required final BuildContext context,
    required final String assetKey,
  }) : super(
         name: 'Help',
         invoke:
             () => context.pushWidgetBuilder(
               (_) => HelpScreen(assetKey: assetKey),
             ),
         activator: helpShortcut,
       );
}
