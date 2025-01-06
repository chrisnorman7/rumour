import 'package:flutter/material.dart';

import '../constants.dart';

/// A [Text] widget which shows [unsetMessage].
class Unset extends StatelessWidget {
  /// Create an instance.
  const Unset({
    super.key,
  });

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => const Text(unsetMessage);
}
