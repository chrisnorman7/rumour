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
String _$projectContextHash() => r'd386411ba91e458f176e4f5b6be024d40f3dad83';

/// Provide the current project context.
///
/// Copied from [projectContext].
@ProviderFor(projectContext)
final projectContextProvider = Provider<ProjectContext>.internal(
  projectContext,
  name: r'projectContextProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectContextHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProjectContextRef = ProviderRef<ProjectContext>;
String _$projectContextFilenameNotifierHash() =>
    r'3a503f3f5c36a6143b8544f40b41596d9ee99b8a';

/// Provide the filename of a project context.
///
/// Copied from [ProjectContextFilenameNotifier].
@ProviderFor(ProjectContextFilenameNotifier)
final projectContextFilenameNotifierProvider = AutoDisposeNotifierProvider<
    ProjectContextFilenameNotifier, String?>.internal(
  ProjectContextFilenameNotifier.new,
  name: r'projectContextFilenameNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectContextFilenameNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProjectContextFilenameNotifier = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
