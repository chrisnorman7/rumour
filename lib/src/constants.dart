import 'dart:math';

import 'package:backstreets_widgets/shortcuts.dart';
import 'package:flutter/services.dart';

/// The random number generator to use.
final random = Random();

/// The message to show when something is unset.
const unsetMessage = 'Not set';

/// The file extensions of valid sound files.
const soundFileExtensions = ['.mp3', '.wav'];

/// The minimum volume for sounds.
const minVolume = 0.0;

/// How much volumes should be adjusted.
const volumeAdjust = 0.1;

/// The maximum volume for sounds.
const maxVolume = 5.0;

/// The title of confirm delete dialogs.
const confirmDeleteTitle = 'Confirm Delete';

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
