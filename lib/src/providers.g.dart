// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appPreferencesHash() => r'4c30d7a80677a208c8639b19fce8bb6467776709';

/// Provide the app preferences.
///
/// Copied from [appPreferences].
@ProviderFor(appPreferences)
final appPreferencesProvider =
    AutoDisposeFutureProvider<AppPreferences>.internal(
  appPreferences,
  name: r'appPreferencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appPreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppPreferencesRef = AutoDisposeFutureProviderRef<AppPreferences>;
String _$recentFilesHash() => r'c62a19e54c5e134c0b77cd4b1446eadecf660e9f';

/// Provide the recently-opened files.
///
/// Copied from [recentFiles].
@ProviderFor(recentFiles)
final recentFilesProvider = AutoDisposeFutureProvider<List<File>>.internal(
  recentFiles,
  name: r'recentFilesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$recentFilesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RecentFilesRef = AutoDisposeFutureProviderRef<List<File>>;
String _$projectContextHash() => r'97b4cd1d3e1daa63effcb5c4c011c0d15b9cc273';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Provide the current project context.
///
/// Copied from [projectContext].
@ProviderFor(projectContext)
const projectContextProvider = ProjectContextFamily();

/// Provide the current project context.
///
/// Copied from [projectContext].
class ProjectContextFamily extends Family<ProjectContext> {
  /// Provide the current project context.
  ///
  /// Copied from [projectContext].
  const ProjectContextFamily();

  /// Provide the current project context.
  ///
  /// Copied from [projectContext].
  ProjectContextProvider call(
    String filename,
  ) {
    return ProjectContextProvider(
      filename,
    );
  }

  @override
  ProjectContextProvider getProviderOverride(
    covariant ProjectContextProvider provider,
  ) {
    return call(
      provider.filename,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'projectContextProvider';
}

/// Provide the current project context.
///
/// Copied from [projectContext].
class ProjectContextProvider extends Provider<ProjectContext> {
  /// Provide the current project context.
  ///
  /// Copied from [projectContext].
  ProjectContextProvider(
    String filename,
  ) : this._internal(
          (ref) => projectContext(
            ref as ProjectContextRef,
            filename,
          ),
          from: projectContextProvider,
          name: r'projectContextProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectContextHash,
          dependencies: ProjectContextFamily._dependencies,
          allTransitiveDependencies:
              ProjectContextFamily._allTransitiveDependencies,
          filename: filename,
        );

  ProjectContextProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filename,
  }) : super.internal();

  final String filename;

  @override
  Override overrideWith(
    ProjectContext Function(ProjectContextRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProjectContextProvider._internal(
        (ref) => create(ref as ProjectContextRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filename: filename,
      ),
    );
  }

  @override
  ProviderElement<ProjectContext> createElement() {
    return _ProjectContextProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectContextProvider && other.filename == filename;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filename.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProjectContextRef on ProviderRef<ProjectContext> {
  /// The parameter `filename` of this provider.
  String get filename;
}

class _ProjectContextProviderElement extends ProviderElement<ProjectContext>
    with ProjectContextRef {
  _ProjectContextProviderElement(super.provider);

  @override
  String get filename => (origin as ProjectContextProvider).filename;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
