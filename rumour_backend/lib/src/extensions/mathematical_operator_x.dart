import 'dart:math';

import 'package:rumour_backend/rumour_backend.dart';

/// Methods for calculating with operators.
extension MathematicalOperatorX on MathematicalOperator {
  /// Calculate the sum of [a] and [b] according to `this`.
  int calculate(final int a, final int b) {
    switch (this) {
      case MathematicalOperator.plus:
        return a + b;
      case MathematicalOperator.minus:
        return a - b;
      case MathematicalOperator.multiply:
        return a * b;
      case MathematicalOperator.divide:
        return (a / b).round();
      case MathematicalOperator.power:
        return pow(a, b).toInt();
    }
  }
}
