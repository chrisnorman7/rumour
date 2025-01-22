import 'package:backstreets_widgets/shortcuts.dart';
import 'package:flutter/services.dart';

/// The shortcut for renaming things.
final renameShortcut = CrossPlatformSingleActivator(LogicalKeyboardKey.keyR);

/// The shortcut for changing a description.
final describeShortcut = CrossPlatformSingleActivator(LogicalKeyboardKey.keyD);

/// The shortcut key for moving things.
final moveShortcut = CrossPlatformSingleActivator(LogicalKeyboardKey.period);

/// The shortcut for editing things.
final editShortcut = CrossPlatformSingleActivator(LogicalKeyboardKey.keyE);

/// The shortcut for selecting an deselecting things.
final changeSelectionShortcut = CrossPlatformSingleActivator(
  LogicalKeyboardKey.space,
);

/// The paste shortcut.
final pasteShortcut = CrossPlatformSingleActivator(LogicalKeyboardKey.keyV);

/// The paste and move shortcut.
final pasteAndMoveShortcut = CrossPlatformSingleActivator(
  LogicalKeyboardKey.keyV,
  shift: true,
);

/// The select all shortcut.
final selectAllShortcut = CrossPlatformSingleActivator(LogicalKeyboardKey.keyA);

/// The deselect all shortcut key.
final deselectShortcut = CrossPlatformSingleActivator(
  LogicalKeyboardKey.keyA,
  shift: true,
);

/// The build shortcut.
final buildShortcut = CrossPlatformSingleActivator(LogicalKeyboardKey.keyB);

/// The play project shortcut.
final playShortcut = CrossPlatformSingleActivator(LogicalKeyboardKey.keyP);

/// The shortcut for editing exits.
final editExitShortcut = CrossPlatformSingleActivator(LogicalKeyboardKey.keyX);

/// The shortcut for building projects.
final buildProjectShortcut = CrossPlatformSingleActivator(
  LogicalKeyboardKey.keyB,
);

/// The preferences shortcut.
final preferencesShortcut = CrossPlatformSingleActivator(
  LogicalKeyboardKey.comma,
);

/// The sounds directory shortcut.
final soundsDirectoryShortcut = CrossPlatformSingleActivator(
  LogicalKeyboardKey.keyS,
  shift: true,
);
