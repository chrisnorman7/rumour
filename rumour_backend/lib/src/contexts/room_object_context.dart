import 'package:rumour_backend/rumour_backend.dart';

/// The context for a [roomObject].
class RoomObjectContext {
  /// Create an instance.
  const RoomObjectContext({
    required this.roomObject,
    required this.room,
  });

  /// The room object to use.
  final RoomObject roomObject;

  /// The room that [roomObject] belongs in.
  final Room room;
}
