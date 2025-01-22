import 'dart:math';

import 'package:uuid/uuid.dart';

/// The UUID generator.
const uuid = Uuid();

/// Get a new UUID.
String getUuid() => uuid.v4();

/// The random number generator to use.
final random = Random();

/// The message to show when something is unset.
const unsetMessage = 'Not set';

/// The file extensions of valid sound files.
const soundFileExtensions = ['.mp3', '.wav', '.ogg'];

/// The minimum volume for sounds.
const minVolume = 0.0;

/// How much volumes should be adjusted.
const volumeAdjust = 0.1;

/// The maximum volume for sounds.
const maxVolume = 5.0;

/// The title of confirm delete dialogs.
const confirmDeleteTitle = 'Confirm Delete';
