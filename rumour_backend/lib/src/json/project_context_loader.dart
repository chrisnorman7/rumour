import 'package:json_annotation/json_annotation.dart';

part 'project_context_loader.g.dart';

/// Metadata about a project context.
@JsonSerializable()
class ProjectContextLoader {
  /// Create an instance.
  const ProjectContextLoader({
    required this.projectAssetKey,
    required this.directories,
  });

  /// Create an instance from a JSON object.
  factory ProjectContextLoader.fromJson(final Map<String, dynamic> json) =>
      _$ProjectContextLoaderFromJson(json);

  /// The asset key where the project will be found.
  final String projectAssetKey;

  /// The directory asset names.
  final Map<String, List<String>> directories;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$ProjectContextLoaderToJson(this);
}
