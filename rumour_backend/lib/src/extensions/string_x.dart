/// Useful string methods.
extension StringX on String {
  /// Return a plural of this [String].
  String pluralise(final int n, {final String? plural}) {
    if (n == 1) {
      return this;
    }
    return plural ?? '${this}s';
  }
}
