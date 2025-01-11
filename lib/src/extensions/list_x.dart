/// Useful methods.
extension ListX on List<String> {
  /// Turns an English list.
  String englishList({
    final String separator = ', ',
    final String andString = 'and ',
  }) {
    if (length == 1) {
      return single;
    }
    final entries = [...sublist(0, length - 1), '$andString$last'];
    return entries.join(separator);
  }
}
