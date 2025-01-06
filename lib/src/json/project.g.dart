// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      name: json['name'] as String? ?? 'Untitled Project',
      databaseFilename: json['databaseFilename'] as String? ?? 'db.sqlite3',
      soundsDirectoryName: json['soundsDirectoryName'] as String? ?? 'sounds',
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'name': instance.name,
      'databaseFilename': instance.databaseFilename,
      'soundsDirectoryName': instance.soundsDirectoryName,
    };
