// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_context_loader.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectContextLoader _$ProjectContextLoaderFromJson(
        Map<String, dynamic> json) =>
    ProjectContextLoader(
      projectAssetKey: json['projectAssetKey'] as String,
      directories: (json['directories'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$ProjectContextLoaderToJson(
        ProjectContextLoader instance) =>
    <String, dynamic>{
      'projectAssetKey': instance.projectAssetKey,
      'directories': instance.directories,
    };
