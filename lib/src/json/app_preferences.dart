import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers.dart';

part 'app_preferences.g.dart';

/// The preferences for the application.
@JsonSerializable()
class AppPreferences {
  /// Create an instance.
  AppPreferences({
    required this.recentFiles,
  });

  /// Create an instance from a JSON object.
  factory AppPreferences.fromJson(final Map<String, dynamic> json) =>
      _$AppPreferencesFromJson(json);

  /// The key where preferences are stored.
  @JsonKey(includeFromJson: false, includeToJson: false)
  static const String preferencesKey = 'rumour_app_preferences';

  /// The list of recently-opened files.
  final List<String> recentFiles;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$AppPreferencesToJson(this);

  /// Save the preferences.
  ///
  /// If [ref] is `null`, then the provider will not be invalidated.
  Future<void> save({final WidgetRef? ref}) async {
    final json = toJson();
    final string = jsonEncode(json);
    final preferences = SharedPreferencesAsync();
    await preferences.setString(AppPreferences.preferencesKey, string);
    if (ref != null) {
      ref.invalidate(appPreferencesProvider);
    }
  }
}
