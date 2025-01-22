import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Useful methods on async values.
extension AsyncValueX<T> on AsyncValue<T> {
  /// A simpler version of [when].
  Widget simpleWhen(final Widget Function(T data) data) => when(
        data: data,
        error: ErrorListView.withPositional,
        loading: LoadingWidget.new,
      );
}
