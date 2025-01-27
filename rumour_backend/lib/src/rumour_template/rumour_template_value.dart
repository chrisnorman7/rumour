/// A template value.
class RumourTemplateValue<T> {
  /// Create an instance.
  const RumourTemplateValue({
    required this.name,
    required this.description,
    required this.getValue,
  });

  /// The name of this value.
  final String name;

  /// The description of this value.
  final String description;

  /// The function to call to get the value.
  final Object? Function(T value) getValue;
}
