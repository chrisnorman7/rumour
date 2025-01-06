import 'package:json_annotation/json_annotation.dart';

import '../database/database.dart';

part 'serializable_sound_reference.g.dart';

/// A [SoundReference] which can be serialized.
@JsonSerializable()
class SerializableSoundReference {
  /// Create an instance.
  const SerializableSoundReference({
    required this.path,
    this.volume = 0.7,
  });

  /// Create an instance from a JSON object.
  factory SerializableSoundReference.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _$SerializableSoundReferenceFromJson(json);

  /// The path where the sound lives.
  final String path;

  /// The volume of the sound.
  final double volume;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$SerializableSoundReferenceToJson(this);
}
