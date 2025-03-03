/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

class $HelpGen {
  const $HelpGen();

  /// Directory path: help/commands
  $HelpCommandsGen get commands => const $HelpCommandsGen();

  /// Directory path: help/room_objects
  $HelpRoomObjectsGen get roomObjects => const $HelpRoomObjectsGen();

  /// Directory path: help/rooms
  $HelpRoomsGen get rooms => const $HelpRoomsGen();
}

class $HelpCommandsGen {
  const $HelpCommandsGen();

  /// File path: help/commands/sub_command.md
  String get subCommand => 'help/commands/sub_command.md';

  /// List of all assets
  List<String> get values => [subCommand];
}

class $HelpRoomObjectsGen {
  const $HelpRoomObjectsGen();

  /// File path: help/room_objects/on_approach.md
  String get onApproach => 'help/room_objects/on_approach.md';

  /// File path: help/room_objects/on_leave.md
  String get onLeave => 'help/room_objects/on_leave.md';

  /// File path: help/room_objects/on_move.md
  String get onMove => 'help/room_objects/on_move.md';

  /// List of all assets
  List<String> get values => [onApproach, onLeave, onMove];
}

class $HelpRoomsGen {
  const $HelpRoomsGen();

  /// File path: help/rooms/on_enter.md
  String get onEnter => 'help/rooms/on_enter.md';

  /// File path: help/rooms/on_exit.md
  String get onExit => 'help/rooms/on_exit.md';

  /// File path: help/rooms/on_teleport.md
  String get onTeleport => 'help/rooms/on_teleport.md';

  /// List of all assets
  List<String> get values => [onEnter, onExit, onTeleport];
}

class Assets {
  const Assets._();

  static const $HelpGen help = $HelpGen();
}
