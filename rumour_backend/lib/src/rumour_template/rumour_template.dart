import 'package:rumour_backend/rumour_backend.dart';
import 'package:rumour_player/rumour_player.dart';

/// A rumour template.
class RumourTemplate<T> {
  /// Create an instance.
  const RumourTemplate({required this.values});

  /// The values to contain in this template.
  final List<RumourTemplateValue<T>> values;

  /// Get globals which can be passed to a jinja environment.
  Map<String, Object?> getLocals(final T value) =>
      {for (final v in values) v.name: v.getValue(value)};

  /// The stat template to use.
  static RumourTemplate<GameStatValueContext> playerStatTemplate =
      RumourTemplate(
    values: [
      RumourTemplateValue(
        name: 'statName',
        description: 'The name of this stat.',
        getValue: (final value) => value.gameStat.name,
      ),
      RumourTemplateValue(
        name: 'statValue',
        description: 'The value of this stat.',
        getValue: (final value) => value.value,
      ),
      RumourTemplateValue(
        name: 'maxStatName',
        description: 'The name of the max stat.',
        getValue: (final value) => value.maxValueGameStat?.name,
      ),
      RumourTemplateValue(
        name: 'maxValue',
        description: 'The value of the max stat.',
        getValue: (final value) => value.maxValue,
      ),
    ],
  );

  /// A template for showing room objects.
  static RumourTemplate<RoomObjectLocation> roomObjectTemplate = RumourTemplate(
    values: [
      RumourTemplateValue(
        name: 'name',
        description: 'The name of this object.',
        getValue: (final value) => value.roomObject.name,
      ),
      RumourTemplateValue(
        name: 'description',
        description: 'The description of this object.',
        getValue: (final value) => value.roomObject.description,
      ),
      RumourTemplateValue(
        name: 'x',
        description: 'The x coordinate of the object.',
        getValue: (final value) => value.roomObject.x,
      ),
      RumourTemplateValue(
        name: 'y',
        description: 'The y coordinate of the object.',
        getValue: (final value) => value.roomObject.y,
      ),
      RumourTemplateValue(
        name: 'north',
        description: 'How many units north this object is.',
        getValue: (final value) => value.north,
      ),
      RumourTemplateValue(
        name: 'east',
        description: 'How many units east this object is.',
        getValue: (final value) => value.east,
      ),
      RumourTemplateValue(
        name: 'south',
        description: 'How many units south this object is.',
        getValue: (final value) => value.south,
      ),
      RumourTemplateValue(
        name: 'west',
        description: 'How many units west this object is.',
        getValue: (final value) => value.west,
      ),
      RumourTemplateValue(
        name: 'distance',
        description: 'The distance between the room object and the player.',
        getValue: (final value) => value.distance,
      ),
    ],
  );
}
