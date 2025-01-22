// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppPreferences _$AppPreferencesFromJson(Map<String, dynamic> json) =>
    AppPreferences(
      recentFiles: (json['recentFiles'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AppPreferencesToJson(AppPreferences instance) =>
    <String, dynamic>{
      'recentFiles': instance.recentFiles,
    };
