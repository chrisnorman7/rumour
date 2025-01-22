import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:rumour_editor/rumour_editor.dart';

/// Add [performableActions] to a [TabbedScaffoldTab].
class PerformableActionsTabbedScaffoldTab extends TabbedScaffoldTab {
  /// Create an instance.
  PerformableActionsTabbedScaffoldTab({
    required this.performableActions,
    required super.title,
    required super.icon,
    required final WidgetBuilder builder,
    super.leading,
    super.floatingActionButton,
    final List<Widget> actions = const [],
  }) : super(
         actions: [
           ...actions,
           MenuAnchor(
             menuChildren: [
               for (var i = 0; i < performableActions.length; i++)
                 PerformableActionMenuItem(
                   action: performableActions[i],
                   autofocus: i == 0,
                 ),
             ],
             builder:
                 (final context, final controller, final child) =>
                     MenuButton(menuController: controller),
           ),
         ],
         builder:
             (final context) => CallbackShortcuts(
               bindings: {
                 for (final action in performableActions)
                   if (action.activator != null)
                     action.activator!: action.invoke,
               },
               child: builder(context),
             ),
       );

  /// The actions to use.
  final List<PerformableAction> performableActions;
}
