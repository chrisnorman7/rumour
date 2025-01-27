import 'package:rumour_backend/rumour_backend.dart';

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
}
