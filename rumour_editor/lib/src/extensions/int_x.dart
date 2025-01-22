/// Useful extension methods.
extension IntX on int {
  /// Pluralise `this`.
  String pluralise(final String single, {final String? plural}) {
    if (this == 1) {
      return single;
    }
    return plural ?? '${single}s';
  }
}
