import 'package:rumour_backend/rumour_backend.dart';

/// A class which holds a [roomAmbiance] and a list of [roomObjectAmbiances].
class RoomAmbiancesContext {
  /// Create an instance.
  const RoomAmbiancesContext({
    required this.roomAmbiance,
    required this.roomObjectAmbiances,
  });

  /// The ambiance for the room.
  final SoundReference? roomAmbiance;

  /// The ambiances for the room objects in the room.
  final List<PositionedSoundReference> roomObjectAmbiances;
}
