// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appPreferencesHash() => r'5b45ecef8eb8e3eb691676ff8a3288387300be56';

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
String _$projectContextHash() => r'7f0406e66b1f84835a67cc52f6a57609ddadffff';

/// Provide the current project context.
///
/// Copied from [projectContext].
@ProviderFor(projectContext)
final projectContextProvider = AutoDisposeProvider<ProjectContext>.internal(
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
typedef ProjectContextRef = AutoDisposeProviderRef<ProjectContext>;
String _$databaseHash() => r'87897a8d9a0865b8172a8b6999a4a7d005d93d41';

/// Provide the database.
///
/// Copied from [database].
@ProviderFor(database)
final databaseProvider = AutoDisposeProvider<AppDatabase>.internal(
  database,
  name: r'databaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$databaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DatabaseRef = AutoDisposeProviderRef<AppDatabase>;
String _$projectHash() => r'458ea92a732d811b52536f1491db283fd04da821';

/// Provide the current project.
///
/// Copied from [project].
@ProviderFor(project)
final projectProvider = AutoDisposeProvider<Project>.internal(
  project,
  name: r'projectProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$projectHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProjectRef = AutoDisposeProviderRef<Project>;
String _$soundReferenceHash() => r'8cf356cf55af940428b65d9fbc8d47ffd1e8d7fe';

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

/// Provide a singe sound reference.
///
/// Copied from [soundReference].
@ProviderFor(soundReference)
const soundReferenceProvider = SoundReferenceFamily();

/// Provide a singe sound reference.
///
/// Copied from [soundReference].
class SoundReferenceFamily extends Family<AsyncValue<SoundReference>> {
  /// Provide a singe sound reference.
  ///
  /// Copied from [soundReference].
  const SoundReferenceFamily();

  /// Provide a singe sound reference.
  ///
  /// Copied from [soundReference].
  SoundReferenceProvider call(
    int id,
  ) {
    return SoundReferenceProvider(
      id,
    );
  }

  @override
  SoundReferenceProvider getProviderOverride(
    covariant SoundReferenceProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'soundReferenceProvider';
}

/// Provide a singe sound reference.
///
/// Copied from [soundReference].
class SoundReferenceProvider extends AutoDisposeFutureProvider<SoundReference> {
  /// Provide a singe sound reference.
  ///
  /// Copied from [soundReference].
  SoundReferenceProvider(
    int id,
  ) : this._internal(
          (ref) => soundReference(
            ref as SoundReferenceRef,
            id,
          ),
          from: soundReferenceProvider,
          name: r'soundReferenceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$soundReferenceHash,
          dependencies: SoundReferenceFamily._dependencies,
          allTransitiveDependencies:
              SoundReferenceFamily._allTransitiveDependencies,
          id: id,
        );

  SoundReferenceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<SoundReference> Function(SoundReferenceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SoundReferenceProvider._internal(
        (ref) => create(ref as SoundReferenceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SoundReference> createElement() {
    return _SoundReferenceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SoundReferenceProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SoundReferenceRef on AutoDisposeFutureProviderRef<SoundReference> {
  /// The parameter `id` of this provider.
  int get id;
}

class _SoundReferenceProviderElement
    extends AutoDisposeFutureProviderElement<SoundReference>
    with SoundReferenceRef {
  _SoundReferenceProviderElement(super.provider);

  @override
  int get id => (origin as SoundReferenceProvider).id;
}

String _$zonesHash() => r'c7f76ac8c03bfaafca976f77127c5fe307fb26aa';

/// Provide all zones.
///
/// Copied from [zones].
@ProviderFor(zones)
final zonesProvider = AutoDisposeFutureProvider<List<Zone>>.internal(
  zones,
  name: r'zonesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$zonesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ZonesRef = AutoDisposeFutureProviderRef<List<Zone>>;
String _$zoneHash() => r'd4bea3ab6749892402667c139c2d7e4f5203c9a4';

/// Provide a single zone with the given [id].
///
/// Copied from [zone].
@ProviderFor(zone)
const zoneProvider = ZoneFamily();

/// Provide a single zone with the given [id].
///
/// Copied from [zone].
class ZoneFamily extends Family<AsyncValue<Zone>> {
  /// Provide a single zone with the given [id].
  ///
  /// Copied from [zone].
  const ZoneFamily();

  /// Provide a single zone with the given [id].
  ///
  /// Copied from [zone].
  ZoneProvider call(
    int id,
  ) {
    return ZoneProvider(
      id,
    );
  }

  @override
  ZoneProvider getProviderOverride(
    covariant ZoneProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'zoneProvider';
}

/// Provide a single zone with the given [id].
///
/// Copied from [zone].
class ZoneProvider extends AutoDisposeFutureProvider<Zone> {
  /// Provide a single zone with the given [id].
  ///
  /// Copied from [zone].
  ZoneProvider(
    int id,
  ) : this._internal(
          (ref) => zone(
            ref as ZoneRef,
            id,
          ),
          from: zoneProvider,
          name: r'zoneProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$zoneHash,
          dependencies: ZoneFamily._dependencies,
          allTransitiveDependencies: ZoneFamily._allTransitiveDependencies,
          id: id,
        );

  ZoneProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Zone> Function(ZoneRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ZoneProvider._internal(
        (ref) => create(ref as ZoneRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Zone> createElement() {
    return _ZoneProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ZoneProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ZoneRef on AutoDisposeFutureProviderRef<Zone> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ZoneProviderElement extends AutoDisposeFutureProviderElement<Zone>
    with ZoneRef {
  _ZoneProviderElement(super.provider);

  @override
  int get id => (origin as ZoneProvider).id;
}

String _$roomsHash() => r'055dffe9583c005f3dc019bc9718e8dd0abdfb07';

/// Provide all rooms with the given [zoneId].
///
/// Copied from [rooms].
@ProviderFor(rooms)
const roomsProvider = RoomsFamily();

/// Provide all rooms with the given [zoneId].
///
/// Copied from [rooms].
class RoomsFamily extends Family<AsyncValue<List<Room>>> {
  /// Provide all rooms with the given [zoneId].
  ///
  /// Copied from [rooms].
  const RoomsFamily();

  /// Provide all rooms with the given [zoneId].
  ///
  /// Copied from [rooms].
  RoomsProvider call(
    int zoneId,
  ) {
    return RoomsProvider(
      zoneId,
    );
  }

  @override
  RoomsProvider getProviderOverride(
    covariant RoomsProvider provider,
  ) {
    return call(
      provider.zoneId,
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
  String? get name => r'roomsProvider';
}

/// Provide all rooms with the given [zoneId].
///
/// Copied from [rooms].
class RoomsProvider extends AutoDisposeFutureProvider<List<Room>> {
  /// Provide all rooms with the given [zoneId].
  ///
  /// Copied from [rooms].
  RoomsProvider(
    int zoneId,
  ) : this._internal(
          (ref) => rooms(
            ref as RoomsRef,
            zoneId,
          ),
          from: roomsProvider,
          name: r'roomsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomsHash,
          dependencies: RoomsFamily._dependencies,
          allTransitiveDependencies: RoomsFamily._allTransitiveDependencies,
          zoneId: zoneId,
        );

  RoomsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.zoneId,
  }) : super.internal();

  final int zoneId;

  @override
  Override overrideWith(
    FutureOr<List<Room>> Function(RoomsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomsProvider._internal(
        (ref) => create(ref as RoomsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        zoneId: zoneId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Room>> createElement() {
    return _RoomsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomsProvider && other.zoneId == zoneId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, zoneId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RoomsRef on AutoDisposeFutureProviderRef<List<Room>> {
  /// The parameter `zoneId` of this provider.
  int get zoneId;
}

class _RoomsProviderElement extends AutoDisposeFutureProviderElement<List<Room>>
    with RoomsRef {
  _RoomsProviderElement(super.provider);

  @override
  int get zoneId => (origin as RoomsProvider).zoneId;
}

String _$roomHash() => r'2ee5fefaa61b055c42e1f0aac59ef01462428ddd';

/// Provide a single room by its [id].
///
/// Copied from [room].
@ProviderFor(room)
const roomProvider = RoomFamily();

/// Provide a single room by its [id].
///
/// Copied from [room].
class RoomFamily extends Family<AsyncValue<Room>> {
  /// Provide a single room by its [id].
  ///
  /// Copied from [room].
  const RoomFamily();

  /// Provide a single room by its [id].
  ///
  /// Copied from [room].
  RoomProvider call(
    int id,
  ) {
    return RoomProvider(
      id,
    );
  }

  @override
  RoomProvider getProviderOverride(
    covariant RoomProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'roomProvider';
}

/// Provide a single room by its [id].
///
/// Copied from [room].
class RoomProvider extends AutoDisposeFutureProvider<Room> {
  /// Provide a single room by its [id].
  ///
  /// Copied from [room].
  RoomProvider(
    int id,
  ) : this._internal(
          (ref) => room(
            ref as RoomRef,
            id,
          ),
          from: roomProvider,
          name: r'roomProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$roomHash,
          dependencies: RoomFamily._dependencies,
          allTransitiveDependencies: RoomFamily._allTransitiveDependencies,
          id: id,
        );

  RoomProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Room> Function(RoomRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomProvider._internal(
        (ref) => create(ref as RoomRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Room> createElement() {
    return _RoomProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RoomRef on AutoDisposeFutureProviderRef<Room> {
  /// The parameter `id` of this provider.
  int get id;
}

class _RoomProviderElement extends AutoDisposeFutureProviderElement<Room>
    with RoomRef {
  _RoomProviderElement(super.provider);

  @override
  int get id => (origin as RoomProvider).id;
}

String _$roomSurfacesHash() => r'335cc10ce70ec86d903d9ddb5dfec52556d4a54e';

/// Provide all room surfaces.
///
/// Copied from [roomSurfaces].
@ProviderFor(roomSurfaces)
final roomSurfacesProvider =
    AutoDisposeFutureProvider<List<RoomSurface>>.internal(
  roomSurfaces,
  name: r'roomSurfacesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$roomSurfacesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RoomSurfacesRef = AutoDisposeFutureProviderRef<List<RoomSurface>>;
String _$roomSurfaceHash() => r'f7f5ec485c0ff79ad40aecd8aab30c7c82567e1d';

/// Provide a single room surface by its [id].
///
/// Copied from [roomSurface].
@ProviderFor(roomSurface)
const roomSurfaceProvider = RoomSurfaceFamily();

/// Provide a single room surface by its [id].
///
/// Copied from [roomSurface].
class RoomSurfaceFamily extends Family<AsyncValue<RoomSurface>> {
  /// Provide a single room surface by its [id].
  ///
  /// Copied from [roomSurface].
  const RoomSurfaceFamily();

  /// Provide a single room surface by its [id].
  ///
  /// Copied from [roomSurface].
  RoomSurfaceProvider call(
    int id,
  ) {
    return RoomSurfaceProvider(
      id,
    );
  }

  @override
  RoomSurfaceProvider getProviderOverride(
    covariant RoomSurfaceProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'roomSurfaceProvider';
}

/// Provide a single room surface by its [id].
///
/// Copied from [roomSurface].
class RoomSurfaceProvider extends AutoDisposeFutureProvider<RoomSurface> {
  /// Provide a single room surface by its [id].
  ///
  /// Copied from [roomSurface].
  RoomSurfaceProvider(
    int id,
  ) : this._internal(
          (ref) => roomSurface(
            ref as RoomSurfaceRef,
            id,
          ),
          from: roomSurfaceProvider,
          name: r'roomSurfaceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomSurfaceHash,
          dependencies: RoomSurfaceFamily._dependencies,
          allTransitiveDependencies:
              RoomSurfaceFamily._allTransitiveDependencies,
          id: id,
        );

  RoomSurfaceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<RoomSurface> Function(RoomSurfaceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomSurfaceProvider._internal(
        (ref) => create(ref as RoomSurfaceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RoomSurface> createElement() {
    return _RoomSurfaceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomSurfaceProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RoomSurfaceRef on AutoDisposeFutureProviderRef<RoomSurface> {
  /// The parameter `id` of this provider.
  int get id;
}

class _RoomSurfaceProviderElement
    extends AutoDisposeFutureProviderElement<RoomSurface> with RoomSurfaceRef {
  _RoomSurfaceProviderElement(super.provider);

  @override
  int get id => (origin as RoomSurfaceProvider).id;
}

String _$roomObjectsHash() => r'acef4bb244a68664d25c454359984a9e6bb11876';

/// Provide room objects for a given room and coordinates.
///
/// Copied from [roomObjects].
@ProviderFor(roomObjects)
const roomObjectsProvider = RoomObjectsFamily();

/// Provide room objects for a given room and coordinates.
///
/// Copied from [roomObjects].
class RoomObjectsFamily extends Family<AsyncValue<List<RoomObject>>> {
  /// Provide room objects for a given room and coordinates.
  ///
  /// Copied from [roomObjects].
  const RoomObjectsFamily();

  /// Provide room objects for a given room and coordinates.
  ///
  /// Copied from [roomObjects].
  RoomObjectsProvider call(
    int roomId,
    Point<int> coordinates,
  ) {
    return RoomObjectsProvider(
      roomId,
      coordinates,
    );
  }

  @override
  RoomObjectsProvider getProviderOverride(
    covariant RoomObjectsProvider provider,
  ) {
    return call(
      provider.roomId,
      provider.coordinates,
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
  String? get name => r'roomObjectsProvider';
}

/// Provide room objects for a given room and coordinates.
///
/// Copied from [roomObjects].
class RoomObjectsProvider extends AutoDisposeFutureProvider<List<RoomObject>> {
  /// Provide room objects for a given room and coordinates.
  ///
  /// Copied from [roomObjects].
  RoomObjectsProvider(
    int roomId,
    Point<int> coordinates,
  ) : this._internal(
          (ref) => roomObjects(
            ref as RoomObjectsRef,
            roomId,
            coordinates,
          ),
          from: roomObjectsProvider,
          name: r'roomObjectsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomObjectsHash,
          dependencies: RoomObjectsFamily._dependencies,
          allTransitiveDependencies:
              RoomObjectsFamily._allTransitiveDependencies,
          roomId: roomId,
          coordinates: coordinates,
        );

  RoomObjectsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.roomId,
    required this.coordinates,
  }) : super.internal();

  final int roomId;
  final Point<int> coordinates;

  @override
  Override overrideWith(
    FutureOr<List<RoomObject>> Function(RoomObjectsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomObjectsProvider._internal(
        (ref) => create(ref as RoomObjectsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        roomId: roomId,
        coordinates: coordinates,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<RoomObject>> createElement() {
    return _RoomObjectsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomObjectsProvider &&
        other.roomId == roomId &&
        other.coordinates == coordinates;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, roomId.hashCode);
    hash = _SystemHash.combine(hash, coordinates.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RoomObjectsRef on AutoDisposeFutureProviderRef<List<RoomObject>> {
  /// The parameter `roomId` of this provider.
  int get roomId;

  /// The parameter `coordinates` of this provider.
  Point<int> get coordinates;
}

class _RoomObjectsProviderElement
    extends AutoDisposeFutureProviderElement<List<RoomObject>>
    with RoomObjectsRef {
  _RoomObjectsProviderElement(super.provider);

  @override
  int get roomId => (origin as RoomObjectsProvider).roomId;
  @override
  Point<int> get coordinates => (origin as RoomObjectsProvider).coordinates;
}

String _$roomObjectHash() => r'fdd223fb56d3abd009b6e270b1e5fa5b72d24cc1';

/// Provide a single room object.
///
/// Copied from [roomObject].
@ProviderFor(roomObject)
const roomObjectProvider = RoomObjectFamily();

/// Provide a single room object.
///
/// Copied from [roomObject].
class RoomObjectFamily extends Family<AsyncValue<RoomObject>> {
  /// Provide a single room object.
  ///
  /// Copied from [roomObject].
  const RoomObjectFamily();

  /// Provide a single room object.
  ///
  /// Copied from [roomObject].
  RoomObjectProvider call(
    int id,
  ) {
    return RoomObjectProvider(
      id,
    );
  }

  @override
  RoomObjectProvider getProviderOverride(
    covariant RoomObjectProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'roomObjectProvider';
}

/// Provide a single room object.
///
/// Copied from [roomObject].
class RoomObjectProvider extends AutoDisposeFutureProvider<RoomObject> {
  /// Provide a single room object.
  ///
  /// Copied from [roomObject].
  RoomObjectProvider(
    int id,
  ) : this._internal(
          (ref) => roomObject(
            ref as RoomObjectRef,
            id,
          ),
          from: roomObjectProvider,
          name: r'roomObjectProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomObjectHash,
          dependencies: RoomObjectFamily._dependencies,
          allTransitiveDependencies:
              RoomObjectFamily._allTransitiveDependencies,
          id: id,
        );

  RoomObjectProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<RoomObject> Function(RoomObjectRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomObjectProvider._internal(
        (ref) => create(ref as RoomObjectRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RoomObject> createElement() {
    return _RoomObjectProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomObjectProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RoomObjectRef on AutoDisposeFutureProviderRef<RoomObject> {
  /// The parameter `id` of this provider.
  int get id;
}

class _RoomObjectProviderElement
    extends AutoDisposeFutureProviderElement<RoomObject> with RoomObjectRef {
  _RoomObjectProviderElement(super.provider);

  @override
  int get id => (origin as RoomObjectProvider).id;
}

String _$roomExitHash() => r'dbd744b30ab2a5d5cb9f62a9252207dcfd2ee28e';

/// Provide a room exit.
///
/// Copied from [roomExit].
@ProviderFor(roomExit)
const roomExitProvider = RoomExitFamily();

/// Provide a room exit.
///
/// Copied from [roomExit].
class RoomExitFamily extends Family<AsyncValue<RoomExit>> {
  /// Provide a room exit.
  ///
  /// Copied from [roomExit].
  const RoomExitFamily();

  /// Provide a room exit.
  ///
  /// Copied from [roomExit].
  RoomExitProvider call(
    int id,
  ) {
    return RoomExitProvider(
      id,
    );
  }

  @override
  RoomExitProvider getProviderOverride(
    covariant RoomExitProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'roomExitProvider';
}

/// Provide a room exit.
///
/// Copied from [roomExit].
class RoomExitProvider extends AutoDisposeFutureProvider<RoomExit> {
  /// Provide a room exit.
  ///
  /// Copied from [roomExit].
  RoomExitProvider(
    int id,
  ) : this._internal(
          (ref) => roomExit(
            ref as RoomExitRef,
            id,
          ),
          from: roomExitProvider,
          name: r'roomExitProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomExitHash,
          dependencies: RoomExitFamily._dependencies,
          allTransitiveDependencies: RoomExitFamily._allTransitiveDependencies,
          id: id,
        );

  RoomExitProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<RoomExit> Function(RoomExitRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomExitProvider._internal(
        (ref) => create(ref as RoomExitRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RoomExit> createElement() {
    return _RoomExitProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomExitProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RoomExitRef on AutoDisposeFutureProviderRef<RoomExit> {
  /// The parameter `id` of this provider.
  int get id;
}

class _RoomExitProviderElement
    extends AutoDisposeFutureProviderElement<RoomExit> with RoomExitRef {
  _RoomExitProviderElement(super.provider);

  @override
  int get id => (origin as RoomExitProvider).id;
}

String _$objectsInRoomHash() => r'36aae93db0064e43a1b196d063bdf5b5dfc5a7aa';

/// Provide all objects in a room.
///
/// Copied from [objectsInRoom].
@ProviderFor(objectsInRoom)
const objectsInRoomProvider = ObjectsInRoomFamily();

/// Provide all objects in a room.
///
/// Copied from [objectsInRoom].
class ObjectsInRoomFamily extends Family<AsyncValue<List<RoomObject>>> {
  /// Provide all objects in a room.
  ///
  /// Copied from [objectsInRoom].
  const ObjectsInRoomFamily();

  /// Provide all objects in a room.
  ///
  /// Copied from [objectsInRoom].
  ObjectsInRoomProvider call(
    int id,
  ) {
    return ObjectsInRoomProvider(
      id,
    );
  }

  @override
  ObjectsInRoomProvider getProviderOverride(
    covariant ObjectsInRoomProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'objectsInRoomProvider';
}

/// Provide all objects in a room.
///
/// Copied from [objectsInRoom].
class ObjectsInRoomProvider
    extends AutoDisposeFutureProvider<List<RoomObject>> {
  /// Provide all objects in a room.
  ///
  /// Copied from [objectsInRoom].
  ObjectsInRoomProvider(
    int id,
  ) : this._internal(
          (ref) => objectsInRoom(
            ref as ObjectsInRoomRef,
            id,
          ),
          from: objectsInRoomProvider,
          name: r'objectsInRoomProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$objectsInRoomHash,
          dependencies: ObjectsInRoomFamily._dependencies,
          allTransitiveDependencies:
              ObjectsInRoomFamily._allTransitiveDependencies,
          id: id,
        );

  ObjectsInRoomProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<List<RoomObject>> Function(ObjectsInRoomRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ObjectsInRoomProvider._internal(
        (ref) => create(ref as ObjectsInRoomRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<RoomObject>> createElement() {
    return _ObjectsInRoomProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ObjectsInRoomProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ObjectsInRoomRef on AutoDisposeFutureProviderRef<List<RoomObject>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ObjectsInRoomProviderElement
    extends AutoDisposeFutureProviderElement<List<RoomObject>>
    with ObjectsInRoomRef {
  _ObjectsInRoomProviderElement(super.provider);

  @override
  int get id => (origin as ObjectsInRoomProvider).id;
}

String _$roomObjectContextHash() => r'a5495d7d1b3b8b196e272f99e6d0e9f8b678ea57';

/// Provide a room object context.
///
/// Copied from [roomObjectContext].
@ProviderFor(roomObjectContext)
const roomObjectContextProvider = RoomObjectContextFamily();

/// Provide a room object context.
///
/// Copied from [roomObjectContext].
class RoomObjectContextFamily extends Family<AsyncValue<RoomObjectContext>> {
  /// Provide a room object context.
  ///
  /// Copied from [roomObjectContext].
  const RoomObjectContextFamily();

  /// Provide a room object context.
  ///
  /// Copied from [roomObjectContext].
  RoomObjectContextProvider call(
    int id,
  ) {
    return RoomObjectContextProvider(
      id,
    );
  }

  @override
  RoomObjectContextProvider getProviderOverride(
    covariant RoomObjectContextProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'roomObjectContextProvider';
}

/// Provide a room object context.
///
/// Copied from [roomObjectContext].
class RoomObjectContextProvider
    extends AutoDisposeFutureProvider<RoomObjectContext> {
  /// Provide a room object context.
  ///
  /// Copied from [roomObjectContext].
  RoomObjectContextProvider(
    int id,
  ) : this._internal(
          (ref) => roomObjectContext(
            ref as RoomObjectContextRef,
            id,
          ),
          from: roomObjectContextProvider,
          name: r'roomObjectContextProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomObjectContextHash,
          dependencies: RoomObjectContextFamily._dependencies,
          allTransitiveDependencies:
              RoomObjectContextFamily._allTransitiveDependencies,
          id: id,
        );

  RoomObjectContextProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<RoomObjectContext> Function(RoomObjectContextRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomObjectContextProvider._internal(
        (ref) => create(ref as RoomObjectContextRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RoomObjectContext> createElement() {
    return _RoomObjectContextProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomObjectContextProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RoomObjectContextRef on AutoDisposeFutureProviderRef<RoomObjectContext> {
  /// The parameter `id` of this provider.
  int get id;
}

class _RoomObjectContextProviderElement
    extends AutoDisposeFutureProviderElement<RoomObjectContext>
    with RoomObjectContextRef {
  _RoomObjectContextProviderElement(super.provider);

  @override
  int get id => (origin as RoomObjectContextProvider).id;
}

String _$playerClassesHash() => r'ef89bcd9bda2716e7c6484b66b5282e45cfb4945';

/// Provide all player classes.
///
/// Copied from [playerClasses].
@ProviderFor(playerClasses)
final playerClassesProvider =
    AutoDisposeFutureProvider<List<PlayerClass>>.internal(
  playerClasses,
  name: r'playerClassesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$playerClassesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PlayerClassesRef = AutoDisposeFutureProviderRef<List<PlayerClass>>;
String _$playerClassHash() => r'97091bec19d44186ad288d9bff948bcbeb3b6223';

/// Provide a single player class.
///
/// Copied from [playerClass].
@ProviderFor(playerClass)
const playerClassProvider = PlayerClassFamily();

/// Provide a single player class.
///
/// Copied from [playerClass].
class PlayerClassFamily extends Family<AsyncValue<PlayerClass>> {
  /// Provide a single player class.
  ///
  /// Copied from [playerClass].
  const PlayerClassFamily();

  /// Provide a single player class.
  ///
  /// Copied from [playerClass].
  PlayerClassProvider call(
    int id,
  ) {
    return PlayerClassProvider(
      id,
    );
  }

  @override
  PlayerClassProvider getProviderOverride(
    covariant PlayerClassProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'playerClassProvider';
}

/// Provide a single player class.
///
/// Copied from [playerClass].
class PlayerClassProvider extends AutoDisposeFutureProvider<PlayerClass> {
  /// Provide a single player class.
  ///
  /// Copied from [playerClass].
  PlayerClassProvider(
    int id,
  ) : this._internal(
          (ref) => playerClass(
            ref as PlayerClassRef,
            id,
          ),
          from: playerClassProvider,
          name: r'playerClassProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playerClassHash,
          dependencies: PlayerClassFamily._dependencies,
          allTransitiveDependencies:
              PlayerClassFamily._allTransitiveDependencies,
          id: id,
        );

  PlayerClassProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<PlayerClass> Function(PlayerClassRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlayerClassProvider._internal(
        (ref) => create(ref as PlayerClassRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PlayerClass> createElement() {
    return _PlayerClassProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerClassProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PlayerClassRef on AutoDisposeFutureProviderRef<PlayerClass> {
  /// The parameter `id` of this provider.
  int get id;
}

class _PlayerClassProviderElement
    extends AutoDisposeFutureProviderElement<PlayerClass> with PlayerClassRef {
  _PlayerClassProviderElement(super.provider);

  @override
  int get id => (origin as PlayerClassProvider).id;
}

String _$gameOptionsDirectoryHash() =>
    r'bd6457c238273b9c23894a4c149196098e05f897';

/// Provide the game options directory.
///
/// Copied from [gameOptionsDirectory].
@ProviderFor(gameOptionsDirectory)
final gameOptionsDirectoryProvider =
    AutoDisposeFutureProvider<Directory>.internal(
  gameOptionsDirectory,
  name: r'gameOptionsDirectoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gameOptionsDirectoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GameOptionsDirectoryRef = AutoDisposeFutureProviderRef<Directory>;
String _$gamePlayersHash() => r'81ed60b6e7fe19751b5ec6adf7266d382d02c0b5';

/// Provide the players which have been created.
///
/// Copied from [gamePlayers].
@ProviderFor(gamePlayers)
final gamePlayersProvider =
    AutoDisposeFutureProvider<List<GamePlayerFile>>.internal(
  gamePlayers,
  name: r'gamePlayersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gamePlayersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GamePlayersRef = AutoDisposeFutureProviderRef<List<GamePlayerFile>>;
String _$gamePlayersDirectoryHash() =>
    r'36b7aed126b8f7188e9572b1152321ee370f36a7';

/// Provide the game players directory.
///
/// Copied from [gamePlayersDirectory].
@ProviderFor(gamePlayersDirectory)
final gamePlayersDirectoryProvider =
    AutoDisposeFutureProvider<Directory>.internal(
  gamePlayersDirectory,
  name: r'gamePlayersDirectoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gamePlayersDirectoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GamePlayersDirectoryRef = AutoDisposeFutureProviderRef<Directory>;
String _$gamePlayerContextHash() => r'c71fdb71728d43c7ca8b7b5782da66ea60fa3ee1';

/// Provide a whole game player context from [id].
///
/// Copied from [gamePlayerContext].
@ProviderFor(gamePlayerContext)
const gamePlayerContextProvider = GamePlayerContextFamily();

/// Provide a whole game player context from [id].
///
/// Copied from [gamePlayerContext].
class GamePlayerContextFamily extends Family<AsyncValue<GamePlayerContext>> {
  /// Provide a whole game player context from [id].
  ///
  /// Copied from [gamePlayerContext].
  const GamePlayerContextFamily();

  /// Provide a whole game player context from [id].
  ///
  /// Copied from [gamePlayerContext].
  GamePlayerContextProvider call(
    String id,
  ) {
    return GamePlayerContextProvider(
      id,
    );
  }

  @override
  GamePlayerContextProvider getProviderOverride(
    covariant GamePlayerContextProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'gamePlayerContextProvider';
}

/// Provide a whole game player context from [id].
///
/// Copied from [gamePlayerContext].
class GamePlayerContextProvider
    extends AutoDisposeFutureProvider<GamePlayerContext> {
  /// Provide a whole game player context from [id].
  ///
  /// Copied from [gamePlayerContext].
  GamePlayerContextProvider(
    String id,
  ) : this._internal(
          (ref) => gamePlayerContext(
            ref as GamePlayerContextRef,
            id,
          ),
          from: gamePlayerContextProvider,
          name: r'gamePlayerContextProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gamePlayerContextHash,
          dependencies: GamePlayerContextFamily._dependencies,
          allTransitiveDependencies:
              GamePlayerContextFamily._allTransitiveDependencies,
          id: id,
        );

  GamePlayerContextProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<GamePlayerContext> Function(GamePlayerContextRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GamePlayerContextProvider._internal(
        (ref) => create(ref as GamePlayerContextRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GamePlayerContext> createElement() {
    return _GamePlayerContextProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GamePlayerContextProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GamePlayerContextRef on AutoDisposeFutureProviderRef<GamePlayerContext> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GamePlayerContextProviderElement
    extends AutoDisposeFutureProviderElement<GamePlayerContext>
    with GamePlayerContextRef {
  _GamePlayerContextProviderElement(super.provider);

  @override
  String get id => (origin as GamePlayerContextProvider).id;
}

String _$roomAmbiancesHash() => r'b40b745be66d81630e737d9945731597d036a877';

/// Provide ambiances for a room with the given [id].
///
/// Copied from [roomAmbiances].
@ProviderFor(roomAmbiances)
const roomAmbiancesProvider = RoomAmbiancesFamily();

/// Provide ambiances for a room with the given [id].
///
/// Copied from [roomAmbiances].
class RoomAmbiancesFamily
    extends Family<AsyncValue<List<PositionedSoundReference>>> {
  /// Provide ambiances for a room with the given [id].
  ///
  /// Copied from [roomAmbiances].
  const RoomAmbiancesFamily();

  /// Provide ambiances for a room with the given [id].
  ///
  /// Copied from [roomAmbiances].
  RoomAmbiancesProvider call(
    int id,
  ) {
    return RoomAmbiancesProvider(
      id,
    );
  }

  @override
  RoomAmbiancesProvider getProviderOverride(
    covariant RoomAmbiancesProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'roomAmbiancesProvider';
}

/// Provide ambiances for a room with the given [id].
///
/// Copied from [roomAmbiances].
class RoomAmbiancesProvider
    extends AutoDisposeFutureProvider<List<PositionedSoundReference>> {
  /// Provide ambiances for a room with the given [id].
  ///
  /// Copied from [roomAmbiances].
  RoomAmbiancesProvider(
    int id,
  ) : this._internal(
          (ref) => roomAmbiances(
            ref as RoomAmbiancesRef,
            id,
          ),
          from: roomAmbiancesProvider,
          name: r'roomAmbiancesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomAmbiancesHash,
          dependencies: RoomAmbiancesFamily._dependencies,
          allTransitiveDependencies:
              RoomAmbiancesFamily._allTransitiveDependencies,
          id: id,
        );

  RoomAmbiancesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<List<PositionedSoundReference>> Function(RoomAmbiancesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomAmbiancesProvider._internal(
        (ref) => create(ref as RoomAmbiancesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PositionedSoundReference>>
      createElement() {
    return _RoomAmbiancesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomAmbiancesProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RoomAmbiancesRef
    on AutoDisposeFutureProviderRef<List<PositionedSoundReference>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _RoomAmbiancesProviderElement
    extends AutoDisposeFutureProviderElement<List<PositionedSoundReference>>
    with RoomAmbiancesRef {
  _RoomAmbiancesProviderElement(super.provider);

  @override
  int get id => (origin as RoomAmbiancesProvider).id;
}

String _$buildProjectHash() => r'0c8dd3b25f8a3cf485f5f826dcb912556caf9355';

/// Build the project context.
///
/// Copied from [buildProject].
@ProviderFor(buildProject)
final buildProjectProvider = AutoDisposeStreamProvider<String>.internal(
  buildProject,
  name: r'buildProjectProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$buildProjectHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef BuildProjectRef = AutoDisposeStreamProviderRef<String>;
String _$projectDataDirectoryHash() =>
    r'c853fac9334fa5991d7278e00eaabcba500e229e';

/// Provide the project data directory.
///
/// Copied from [projectDataDirectory].
@ProviderFor(projectDataDirectory)
const projectDataDirectoryProvider = ProjectDataDirectoryFamily();

/// Provide the project data directory.
///
/// Copied from [projectDataDirectory].
class ProjectDataDirectoryFamily extends Family<AsyncValue<Directory>> {
  /// Provide the project data directory.
  ///
  /// Copied from [projectDataDirectory].
  const ProjectDataDirectoryFamily();

  /// Provide the project data directory.
  ///
  /// Copied from [projectDataDirectory].
  ProjectDataDirectoryProvider call(
    Project project,
  ) {
    return ProjectDataDirectoryProvider(
      project,
    );
  }

  @override
  ProjectDataDirectoryProvider getProviderOverride(
    covariant ProjectDataDirectoryProvider provider,
  ) {
    return call(
      provider.project,
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
  String? get name => r'projectDataDirectoryProvider';
}

/// Provide the project data directory.
///
/// Copied from [projectDataDirectory].
class ProjectDataDirectoryProvider
    extends AutoDisposeFutureProvider<Directory> {
  /// Provide the project data directory.
  ///
  /// Copied from [projectDataDirectory].
  ProjectDataDirectoryProvider(
    Project project,
  ) : this._internal(
          (ref) => projectDataDirectory(
            ref as ProjectDataDirectoryRef,
            project,
          ),
          from: projectDataDirectoryProvider,
          name: r'projectDataDirectoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$projectDataDirectoryHash,
          dependencies: ProjectDataDirectoryFamily._dependencies,
          allTransitiveDependencies:
              ProjectDataDirectoryFamily._allTransitiveDependencies,
          project: project,
        );

  ProjectDataDirectoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.project,
  }) : super.internal();

  final Project project;

  @override
  Override overrideWith(
    FutureOr<Directory> Function(ProjectDataDirectoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProjectDataDirectoryProvider._internal(
        (ref) => create(ref as ProjectDataDirectoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        project: project,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Directory> createElement() {
    return _ProjectDataDirectoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectDataDirectoryProvider && other.project == project;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, project.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProjectDataDirectoryRef on AutoDisposeFutureProviderRef<Directory> {
  /// The parameter `project` of this provider.
  Project get project;
}

class _ProjectDataDirectoryProviderElement
    extends AutoDisposeFutureProviderElement<Directory>
    with ProjectDataDirectoryRef {
  _ProjectDataDirectoryProviderElement(super.provider);

  @override
  Project get project => (origin as ProjectDataDirectoryProvider).project;
}

String _$gameStatsHash() => r'e9b8d1e1e437e3c8624266b03680ef73ad752283';

/// Provide all game stats.
///
/// Copied from [gameStats].
@ProviderFor(gameStats)
final gameStatsProvider = AutoDisposeFutureProvider<List<GameStat>>.internal(
  gameStats,
  name: r'gameStatsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gameStatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GameStatsRef = AutoDisposeFutureProviderRef<List<GameStat>>;
String _$visibleGameStatsHash() => r'e08aad7af5d3c3edb5bd50aaa26bb13084af2b9e';

/// Provide all visible game stats.
///
/// Copied from [visibleGameStats].
@ProviderFor(visibleGameStats)
final visibleGameStatsProvider =
    AutoDisposeFutureProvider<List<GameStat>>.internal(
  visibleGameStats,
  name: r'visibleGameStatsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$visibleGameStatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef VisibleGameStatsRef = AutoDisposeFutureProviderRef<List<GameStat>>;
String _$playerClassGameStatHash() =>
    r'b705c73ebaf99e9fc852502161528ca1163b68a8';

/// Return a player class game stat for the given [playerClassId] and
/// [gameStatId].
///
/// Copied from [playerClassGameStat].
@ProviderFor(playerClassGameStat)
const playerClassGameStatProvider = PlayerClassGameStatFamily();

/// Return a player class game stat for the given [playerClassId] and
/// [gameStatId].
///
/// Copied from [playerClassGameStat].
class PlayerClassGameStatFamily
    extends Family<AsyncValue<PlayerClassGameStat?>> {
  /// Return a player class game stat for the given [playerClassId] and
  /// [gameStatId].
  ///
  /// Copied from [playerClassGameStat].
  const PlayerClassGameStatFamily();

  /// Return a player class game stat for the given [playerClassId] and
  /// [gameStatId].
  ///
  /// Copied from [playerClassGameStat].
  PlayerClassGameStatProvider call(
    int playerClassId,
    int gameStatId,
  ) {
    return PlayerClassGameStatProvider(
      playerClassId,
      gameStatId,
    );
  }

  @override
  PlayerClassGameStatProvider getProviderOverride(
    covariant PlayerClassGameStatProvider provider,
  ) {
    return call(
      provider.playerClassId,
      provider.gameStatId,
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
  String? get name => r'playerClassGameStatProvider';
}

/// Return a player class game stat for the given [playerClassId] and
/// [gameStatId].
///
/// Copied from [playerClassGameStat].
class PlayerClassGameStatProvider
    extends AutoDisposeFutureProvider<PlayerClassGameStat?> {
  /// Return a player class game stat for the given [playerClassId] and
  /// [gameStatId].
  ///
  /// Copied from [playerClassGameStat].
  PlayerClassGameStatProvider(
    int playerClassId,
    int gameStatId,
  ) : this._internal(
          (ref) => playerClassGameStat(
            ref as PlayerClassGameStatRef,
            playerClassId,
            gameStatId,
          ),
          from: playerClassGameStatProvider,
          name: r'playerClassGameStatProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playerClassGameStatHash,
          dependencies: PlayerClassGameStatFamily._dependencies,
          allTransitiveDependencies:
              PlayerClassGameStatFamily._allTransitiveDependencies,
          playerClassId: playerClassId,
          gameStatId: gameStatId,
        );

  PlayerClassGameStatProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.playerClassId,
    required this.gameStatId,
  }) : super.internal();

  final int playerClassId;
  final int gameStatId;

  @override
  Override overrideWith(
    FutureOr<PlayerClassGameStat?> Function(PlayerClassGameStatRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlayerClassGameStatProvider._internal(
        (ref) => create(ref as PlayerClassGameStatRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        playerClassId: playerClassId,
        gameStatId: gameStatId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PlayerClassGameStat?> createElement() {
    return _PlayerClassGameStatProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerClassGameStatProvider &&
        other.playerClassId == playerClassId &&
        other.gameStatId == gameStatId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, playerClassId.hashCode);
    hash = _SystemHash.combine(hash, gameStatId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PlayerClassGameStatRef
    on AutoDisposeFutureProviderRef<PlayerClassGameStat?> {
  /// The parameter `playerClassId` of this provider.
  int get playerClassId;

  /// The parameter `gameStatId` of this provider.
  int get gameStatId;
}

class _PlayerClassGameStatProviderElement
    extends AutoDisposeFutureProviderElement<PlayerClassGameStat?>
    with PlayerClassGameStatRef {
  _PlayerClassGameStatProviderElement(super.provider);

  @override
  int get playerClassId =>
      (origin as PlayerClassGameStatProvider).playerClassId;
  @override
  int get gameStatId => (origin as PlayerClassGameStatProvider).gameStatId;
}

String _$gamePlayerStatsHash() => r'2cf8db36dd4279db4f4687d2eec8228bfd5f096d';

/// Provide game stats for a player.
///
/// Copied from [gamePlayerStats].
@ProviderFor(gamePlayerStats)
const gamePlayerStatsProvider = GamePlayerStatsFamily();

/// Provide game stats for a player.
///
/// Copied from [gamePlayerStats].
class GamePlayerStatsFamily extends Family<AsyncValue<Map<int, int>>> {
  /// Provide game stats for a player.
  ///
  /// Copied from [gamePlayerStats].
  const GamePlayerStatsFamily();

  /// Provide game stats for a player.
  ///
  /// Copied from [gamePlayerStats].
  GamePlayerStatsProvider call(
    String id,
  ) {
    return GamePlayerStatsProvider(
      id,
    );
  }

  @override
  GamePlayerStatsProvider getProviderOverride(
    covariant GamePlayerStatsProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'gamePlayerStatsProvider';
}

/// Provide game stats for a player.
///
/// Copied from [gamePlayerStats].
class GamePlayerStatsProvider extends AutoDisposeFutureProvider<Map<int, int>> {
  /// Provide game stats for a player.
  ///
  /// Copied from [gamePlayerStats].
  GamePlayerStatsProvider(
    String id,
  ) : this._internal(
          (ref) => gamePlayerStats(
            ref as GamePlayerStatsRef,
            id,
          ),
          from: gamePlayerStatsProvider,
          name: r'gamePlayerStatsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gamePlayerStatsHash,
          dependencies: GamePlayerStatsFamily._dependencies,
          allTransitiveDependencies:
              GamePlayerStatsFamily._allTransitiveDependencies,
          id: id,
        );

  GamePlayerStatsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Map<int, int>> Function(GamePlayerStatsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GamePlayerStatsProvider._internal(
        (ref) => create(ref as GamePlayerStatsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<int, int>> createElement() {
    return _GamePlayerStatsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GamePlayerStatsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GamePlayerStatsRef on AutoDisposeFutureProviderRef<Map<int, int>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GamePlayerStatsProviderElement
    extends AutoDisposeFutureProviderElement<Map<int, int>>
    with GamePlayerStatsRef {
  _GamePlayerStatsProviderElement(super.provider);

  @override
  String get id => (origin as GamePlayerStatsProvider).id;
}

String _$gameStatContextHash() => r'09316e4bc5e21f4c0bc3a4b5dc5c2fe9abb913b2';

/// Provide a single game stat.
///
/// Copied from [gameStatContext].
@ProviderFor(gameStatContext)
const gameStatContextProvider = GameStatContextFamily();

/// Provide a single game stat.
///
/// Copied from [gameStatContext].
class GameStatContextFamily extends Family<AsyncValue<GameStatContext>> {
  /// Provide a single game stat.
  ///
  /// Copied from [gameStatContext].
  const GameStatContextFamily();

  /// Provide a single game stat.
  ///
  /// Copied from [gameStatContext].
  GameStatContextProvider call(
    int id,
  ) {
    return GameStatContextProvider(
      id,
    );
  }

  @override
  GameStatContextProvider getProviderOverride(
    covariant GameStatContextProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'gameStatContextProvider';
}

/// Provide a single game stat.
///
/// Copied from [gameStatContext].
class GameStatContextProvider
    extends AutoDisposeFutureProvider<GameStatContext> {
  /// Provide a single game stat.
  ///
  /// Copied from [gameStatContext].
  GameStatContextProvider(
    int id,
  ) : this._internal(
          (ref) => gameStatContext(
            ref as GameStatContextRef,
            id,
          ),
          from: gameStatContextProvider,
          name: r'gameStatContextProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gameStatContextHash,
          dependencies: GameStatContextFamily._dependencies,
          allTransitiveDependencies:
              GameStatContextFamily._allTransitiveDependencies,
          id: id,
        );

  GameStatContextProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<GameStatContext> Function(GameStatContextRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GameStatContextProvider._internal(
        (ref) => create(ref as GameStatContextRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GameStatContext> createElement() {
    return _GameStatContextProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GameStatContextProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GameStatContextRef on AutoDisposeFutureProviderRef<GameStatContext> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GameStatContextProviderElement
    extends AutoDisposeFutureProviderElement<GameStatContext>
    with GameStatContextRef {
  _GameStatContextProviderElement(super.provider);

  @override
  int get id => (origin as GameStatContextProvider).id;
}

String _$playerClassMaxStatHash() =>
    r'a5942b444c96b25c112e9b1a156a91db1798b79d';

/// Provide the maximum value for a player game stat.
///
/// Copied from [playerClassMaxStat].
@ProviderFor(playerClassMaxStat)
const playerClassMaxStatProvider = PlayerClassMaxStatFamily();

/// Provide the maximum value for a player game stat.
///
/// Copied from [playerClassMaxStat].
class PlayerClassMaxStatFamily extends Family<AsyncValue<int>> {
  /// Provide the maximum value for a player game stat.
  ///
  /// Copied from [playerClassMaxStat].
  const PlayerClassMaxStatFamily();

  /// Provide the maximum value for a player game stat.
  ///
  /// Copied from [playerClassMaxStat].
  PlayerClassMaxStatProvider call(
    int gameStatId,
    int playerClassId,
  ) {
    return PlayerClassMaxStatProvider(
      gameStatId,
      playerClassId,
    );
  }

  @override
  PlayerClassMaxStatProvider getProviderOverride(
    covariant PlayerClassMaxStatProvider provider,
  ) {
    return call(
      provider.gameStatId,
      provider.playerClassId,
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
  String? get name => r'playerClassMaxStatProvider';
}

/// Provide the maximum value for a player game stat.
///
/// Copied from [playerClassMaxStat].
class PlayerClassMaxStatProvider extends AutoDisposeFutureProvider<int> {
  /// Provide the maximum value for a player game stat.
  ///
  /// Copied from [playerClassMaxStat].
  PlayerClassMaxStatProvider(
    int gameStatId,
    int playerClassId,
  ) : this._internal(
          (ref) => playerClassMaxStat(
            ref as PlayerClassMaxStatRef,
            gameStatId,
            playerClassId,
          ),
          from: playerClassMaxStatProvider,
          name: r'playerClassMaxStatProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playerClassMaxStatHash,
          dependencies: PlayerClassMaxStatFamily._dependencies,
          allTransitiveDependencies:
              PlayerClassMaxStatFamily._allTransitiveDependencies,
          gameStatId: gameStatId,
          playerClassId: playerClassId,
        );

  PlayerClassMaxStatProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.gameStatId,
    required this.playerClassId,
  }) : super.internal();

  final int gameStatId;
  final int playerClassId;

  @override
  Override overrideWith(
    FutureOr<int> Function(PlayerClassMaxStatRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlayerClassMaxStatProvider._internal(
        (ref) => create(ref as PlayerClassMaxStatRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        gameStatId: gameStatId,
        playerClassId: playerClassId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _PlayerClassMaxStatProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerClassMaxStatProvider &&
        other.gameStatId == gameStatId &&
        other.playerClassId == playerClassId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, gameStatId.hashCode);
    hash = _SystemHash.combine(hash, playerClassId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PlayerClassMaxStatRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `gameStatId` of this provider.
  int get gameStatId;

  /// The parameter `playerClassId` of this provider.
  int get playerClassId;
}

class _PlayerClassMaxStatProviderElement
    extends AutoDisposeFutureProviderElement<int> with PlayerClassMaxStatRef {
  _PlayerClassMaxStatProviderElement(super.provider);

  @override
  int get gameStatId => (origin as PlayerClassMaxStatProvider).gameStatId;
  @override
  int get playerClassId => (origin as PlayerClassMaxStatProvider).playerClassId;
}

String _$gamePlayerStatHash() => r'9f4fd4773889d2c1c764bee1fd9f3262f2288084';

/// Provide a single player stat.
///
/// Copied from [gamePlayerStat].
@ProviderFor(gamePlayerStat)
const gamePlayerStatProvider = GamePlayerStatFamily();

/// Provide a single player stat.
///
/// Copied from [gamePlayerStat].
class GamePlayerStatFamily extends Family<AsyncValue<int>> {
  /// Provide a single player stat.
  ///
  /// Copied from [gamePlayerStat].
  const GamePlayerStatFamily();

  /// Provide a single player stat.
  ///
  /// Copied from [gamePlayerStat].
  GamePlayerStatProvider call(
    String playerId,
    int gameStatId,
  ) {
    return GamePlayerStatProvider(
      playerId,
      gameStatId,
    );
  }

  @override
  GamePlayerStatProvider getProviderOverride(
    covariant GamePlayerStatProvider provider,
  ) {
    return call(
      provider.playerId,
      provider.gameStatId,
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
  String? get name => r'gamePlayerStatProvider';
}

/// Provide a single player stat.
///
/// Copied from [gamePlayerStat].
class GamePlayerStatProvider extends AutoDisposeFutureProvider<int> {
  /// Provide a single player stat.
  ///
  /// Copied from [gamePlayerStat].
  GamePlayerStatProvider(
    String playerId,
    int gameStatId,
  ) : this._internal(
          (ref) => gamePlayerStat(
            ref as GamePlayerStatRef,
            playerId,
            gameStatId,
          ),
          from: gamePlayerStatProvider,
          name: r'gamePlayerStatProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gamePlayerStatHash,
          dependencies: GamePlayerStatFamily._dependencies,
          allTransitiveDependencies:
              GamePlayerStatFamily._allTransitiveDependencies,
          playerId: playerId,
          gameStatId: gameStatId,
        );

  GamePlayerStatProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.playerId,
    required this.gameStatId,
  }) : super.internal();

  final String playerId;
  final int gameStatId;

  @override
  Override overrideWith(
    FutureOr<int> Function(GamePlayerStatRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GamePlayerStatProvider._internal(
        (ref) => create(ref as GamePlayerStatRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        playerId: playerId,
        gameStatId: gameStatId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _GamePlayerStatProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GamePlayerStatProvider &&
        other.playerId == playerId &&
        other.gameStatId == gameStatId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, playerId.hashCode);
    hash = _SystemHash.combine(hash, gameStatId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GamePlayerStatRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `playerId` of this provider.
  String get playerId;

  /// The parameter `gameStatId` of this provider.
  int get gameStatId;
}

class _GamePlayerStatProviderElement
    extends AutoDisposeFutureProviderElement<int> with GamePlayerStatRef {
  _GamePlayerStatProviderElement(super.provider);

  @override
  String get playerId => (origin as GamePlayerStatProvider).playerId;
  @override
  int get gameStatId => (origin as GamePlayerStatProvider).gameStatId;
}

String _$roomSurfaceCostsHash() => r'418de69f8bef01d8c88b20bef6b9d29dfa0f86e1';

/// Provide room surface costs.
///
/// Copied from [roomSurfaceCosts].
@ProviderFor(roomSurfaceCosts)
const roomSurfaceCostsProvider = RoomSurfaceCostsFamily();

/// Provide room surface costs.
///
/// Copied from [roomSurfaceCosts].
class RoomSurfaceCostsFamily extends Family<AsyncValue<List<RoomSurfaceCost>>> {
  /// Provide room surface costs.
  ///
  /// Copied from [roomSurfaceCosts].
  const RoomSurfaceCostsFamily();

  /// Provide room surface costs.
  ///
  /// Copied from [roomSurfaceCosts].
  RoomSurfaceCostsProvider call(
    int roomSurfaceId,
  ) {
    return RoomSurfaceCostsProvider(
      roomSurfaceId,
    );
  }

  @override
  RoomSurfaceCostsProvider getProviderOverride(
    covariant RoomSurfaceCostsProvider provider,
  ) {
    return call(
      provider.roomSurfaceId,
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
  String? get name => r'roomSurfaceCostsProvider';
}

/// Provide room surface costs.
///
/// Copied from [roomSurfaceCosts].
class RoomSurfaceCostsProvider
    extends AutoDisposeFutureProvider<List<RoomSurfaceCost>> {
  /// Provide room surface costs.
  ///
  /// Copied from [roomSurfaceCosts].
  RoomSurfaceCostsProvider(
    int roomSurfaceId,
  ) : this._internal(
          (ref) => roomSurfaceCosts(
            ref as RoomSurfaceCostsRef,
            roomSurfaceId,
          ),
          from: roomSurfaceCostsProvider,
          name: r'roomSurfaceCostsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomSurfaceCostsHash,
          dependencies: RoomSurfaceCostsFamily._dependencies,
          allTransitiveDependencies:
              RoomSurfaceCostsFamily._allTransitiveDependencies,
          roomSurfaceId: roomSurfaceId,
        );

  RoomSurfaceCostsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.roomSurfaceId,
  }) : super.internal();

  final int roomSurfaceId;

  @override
  Override overrideWith(
    FutureOr<List<RoomSurfaceCost>> Function(RoomSurfaceCostsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomSurfaceCostsProvider._internal(
        (ref) => create(ref as RoomSurfaceCostsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        roomSurfaceId: roomSurfaceId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<RoomSurfaceCost>> createElement() {
    return _RoomSurfaceCostsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomSurfaceCostsProvider &&
        other.roomSurfaceId == roomSurfaceId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, roomSurfaceId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RoomSurfaceCostsRef
    on AutoDisposeFutureProviderRef<List<RoomSurfaceCost>> {
  /// The parameter `roomSurfaceId` of this provider.
  int get roomSurfaceId;
}

class _RoomSurfaceCostsProviderElement
    extends AutoDisposeFutureProviderElement<List<RoomSurfaceCost>>
    with RoomSurfaceCostsRef {
  _RoomSurfaceCostsProviderElement(super.provider);

  @override
  int get roomSurfaceId => (origin as RoomSurfaceCostsProvider).roomSurfaceId;
}

String _$possibleRoomSurfaceCostHash() =>
    r'1a2fc352045f6f4370598361367f4b69c814359e';

/// Possibly provide a room surface cost.
///
/// Copied from [possibleRoomSurfaceCost].
@ProviderFor(possibleRoomSurfaceCost)
const possibleRoomSurfaceCostProvider = PossibleRoomSurfaceCostFamily();

/// Possibly provide a room surface cost.
///
/// Copied from [possibleRoomSurfaceCost].
class PossibleRoomSurfaceCostFamily
    extends Family<AsyncValue<RoomSurfaceCost?>> {
  /// Possibly provide a room surface cost.
  ///
  /// Copied from [possibleRoomSurfaceCost].
  const PossibleRoomSurfaceCostFamily();

  /// Possibly provide a room surface cost.
  ///
  /// Copied from [possibleRoomSurfaceCost].
  PossibleRoomSurfaceCostProvider call(
    int roomSurfaceId,
    int gameStatId,
  ) {
    return PossibleRoomSurfaceCostProvider(
      roomSurfaceId,
      gameStatId,
    );
  }

  @override
  PossibleRoomSurfaceCostProvider getProviderOverride(
    covariant PossibleRoomSurfaceCostProvider provider,
  ) {
    return call(
      provider.roomSurfaceId,
      provider.gameStatId,
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
  String? get name => r'possibleRoomSurfaceCostProvider';
}

/// Possibly provide a room surface cost.
///
/// Copied from [possibleRoomSurfaceCost].
class PossibleRoomSurfaceCostProvider
    extends AutoDisposeFutureProvider<RoomSurfaceCost?> {
  /// Possibly provide a room surface cost.
  ///
  /// Copied from [possibleRoomSurfaceCost].
  PossibleRoomSurfaceCostProvider(
    int roomSurfaceId,
    int gameStatId,
  ) : this._internal(
          (ref) => possibleRoomSurfaceCost(
            ref as PossibleRoomSurfaceCostRef,
            roomSurfaceId,
            gameStatId,
          ),
          from: possibleRoomSurfaceCostProvider,
          name: r'possibleRoomSurfaceCostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$possibleRoomSurfaceCostHash,
          dependencies: PossibleRoomSurfaceCostFamily._dependencies,
          allTransitiveDependencies:
              PossibleRoomSurfaceCostFamily._allTransitiveDependencies,
          roomSurfaceId: roomSurfaceId,
          gameStatId: gameStatId,
        );

  PossibleRoomSurfaceCostProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.roomSurfaceId,
    required this.gameStatId,
  }) : super.internal();

  final int roomSurfaceId;
  final int gameStatId;

  @override
  Override overrideWith(
    FutureOr<RoomSurfaceCost?> Function(PossibleRoomSurfaceCostRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PossibleRoomSurfaceCostProvider._internal(
        (ref) => create(ref as PossibleRoomSurfaceCostRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        roomSurfaceId: roomSurfaceId,
        gameStatId: gameStatId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RoomSurfaceCost?> createElement() {
    return _PossibleRoomSurfaceCostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PossibleRoomSurfaceCostProvider &&
        other.roomSurfaceId == roomSurfaceId &&
        other.gameStatId == gameStatId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, roomSurfaceId.hashCode);
    hash = _SystemHash.combine(hash, gameStatId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PossibleRoomSurfaceCostRef
    on AutoDisposeFutureProviderRef<RoomSurfaceCost?> {
  /// The parameter `roomSurfaceId` of this provider.
  int get roomSurfaceId;

  /// The parameter `gameStatId` of this provider.
  int get gameStatId;
}

class _PossibleRoomSurfaceCostProviderElement
    extends AutoDisposeFutureProviderElement<RoomSurfaceCost?>
    with PossibleRoomSurfaceCostRef {
  _PossibleRoomSurfaceCostProviderElement(super.provider);

  @override
  int get roomSurfaceId =>
      (origin as PossibleRoomSurfaceCostProvider).roomSurfaceId;
  @override
  int get gameStatId => (origin as PossibleRoomSurfaceCostProvider).gameStatId;
}

String _$roomSurfaceCostHash() => r'9595538ded59447735abec63675b6f451c02d7a9';

/// Provide a single room surface cost.
///
/// Copied from [roomSurfaceCost].
@ProviderFor(roomSurfaceCost)
const roomSurfaceCostProvider = RoomSurfaceCostFamily();

/// Provide a single room surface cost.
///
/// Copied from [roomSurfaceCost].
class RoomSurfaceCostFamily extends Family<AsyncValue<RoomSurfaceCost>> {
  /// Provide a single room surface cost.
  ///
  /// Copied from [roomSurfaceCost].
  const RoomSurfaceCostFamily();

  /// Provide a single room surface cost.
  ///
  /// Copied from [roomSurfaceCost].
  RoomSurfaceCostProvider call(
    int id,
  ) {
    return RoomSurfaceCostProvider(
      id,
    );
  }

  @override
  RoomSurfaceCostProvider getProviderOverride(
    covariant RoomSurfaceCostProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'roomSurfaceCostProvider';
}

/// Provide a single room surface cost.
///
/// Copied from [roomSurfaceCost].
class RoomSurfaceCostProvider
    extends AutoDisposeFutureProvider<RoomSurfaceCost> {
  /// Provide a single room surface cost.
  ///
  /// Copied from [roomSurfaceCost].
  RoomSurfaceCostProvider(
    int id,
  ) : this._internal(
          (ref) => roomSurfaceCost(
            ref as RoomSurfaceCostRef,
            id,
          ),
          from: roomSurfaceCostProvider,
          name: r'roomSurfaceCostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomSurfaceCostHash,
          dependencies: RoomSurfaceCostFamily._dependencies,
          allTransitiveDependencies:
              RoomSurfaceCostFamily._allTransitiveDependencies,
          id: id,
        );

  RoomSurfaceCostProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<RoomSurfaceCost> Function(RoomSurfaceCostRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomSurfaceCostProvider._internal(
        (ref) => create(ref as RoomSurfaceCostRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RoomSurfaceCost> createElement() {
    return _RoomSurfaceCostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomSurfaceCostProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RoomSurfaceCostRef on AutoDisposeFutureProviderRef<RoomSurfaceCost> {
  /// The parameter `id` of this provider.
  int get id;
}

class _RoomSurfaceCostProviderElement
    extends AutoDisposeFutureProviderElement<RoomSurfaceCost>
    with RoomSurfaceCostRef {
  _RoomSurfaceCostProviderElement(super.provider);

  @override
  int get id => (origin as RoomSurfaceCostProvider).id;
}

String _$roomSurfaceBoostsHash() => r'091b03228798532a3d679c6ec7ac2ff196e466ca';

/// Provide room surface boosts.
///
/// Copied from [roomSurfaceBoosts].
@ProviderFor(roomSurfaceBoosts)
const roomSurfaceBoostsProvider = RoomSurfaceBoostsFamily();

/// Provide room surface boosts.
///
/// Copied from [roomSurfaceBoosts].
class RoomSurfaceBoostsFamily
    extends Family<AsyncValue<List<RoomSurfaceBoost>>> {
  /// Provide room surface boosts.
  ///
  /// Copied from [roomSurfaceBoosts].
  const RoomSurfaceBoostsFamily();

  /// Provide room surface boosts.
  ///
  /// Copied from [roomSurfaceBoosts].
  RoomSurfaceBoostsProvider call(
    int id,
  ) {
    return RoomSurfaceBoostsProvider(
      id,
    );
  }

  @override
  RoomSurfaceBoostsProvider getProviderOverride(
    covariant RoomSurfaceBoostsProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'roomSurfaceBoostsProvider';
}

/// Provide room surface boosts.
///
/// Copied from [roomSurfaceBoosts].
class RoomSurfaceBoostsProvider
    extends AutoDisposeFutureProvider<List<RoomSurfaceBoost>> {
  /// Provide room surface boosts.
  ///
  /// Copied from [roomSurfaceBoosts].
  RoomSurfaceBoostsProvider(
    int id,
  ) : this._internal(
          (ref) => roomSurfaceBoosts(
            ref as RoomSurfaceBoostsRef,
            id,
          ),
          from: roomSurfaceBoostsProvider,
          name: r'roomSurfaceBoostsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomSurfaceBoostsHash,
          dependencies: RoomSurfaceBoostsFamily._dependencies,
          allTransitiveDependencies:
              RoomSurfaceBoostsFamily._allTransitiveDependencies,
          id: id,
        );

  RoomSurfaceBoostsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<List<RoomSurfaceBoost>> Function(RoomSurfaceBoostsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomSurfaceBoostsProvider._internal(
        (ref) => create(ref as RoomSurfaceBoostsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<RoomSurfaceBoost>> createElement() {
    return _RoomSurfaceBoostsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomSurfaceBoostsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RoomSurfaceBoostsRef
    on AutoDisposeFutureProviderRef<List<RoomSurfaceBoost>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _RoomSurfaceBoostsProviderElement
    extends AutoDisposeFutureProviderElement<List<RoomSurfaceBoost>>
    with RoomSurfaceBoostsRef {
  _RoomSurfaceBoostsProviderElement(super.provider);

  @override
  int get id => (origin as RoomSurfaceBoostsProvider).id;
}

String _$possibleRoomSurfaceBoostHash() =>
    r'1f3a40dfd2ba9e61a66bd9e07cd70e7d3c6ca3be';

/// Possibly provide a room surface boost.
///
/// Copied from [possibleRoomSurfaceBoost].
@ProviderFor(possibleRoomSurfaceBoost)
const possibleRoomSurfaceBoostProvider = PossibleRoomSurfaceBoostFamily();

/// Possibly provide a room surface boost.
///
/// Copied from [possibleRoomSurfaceBoost].
class PossibleRoomSurfaceBoostFamily
    extends Family<AsyncValue<RoomSurfaceBoost?>> {
  /// Possibly provide a room surface boost.
  ///
  /// Copied from [possibleRoomSurfaceBoost].
  const PossibleRoomSurfaceBoostFamily();

  /// Possibly provide a room surface boost.
  ///
  /// Copied from [possibleRoomSurfaceBoost].
  PossibleRoomSurfaceBoostProvider call(
    int roomSurfaceId,
    int gameStatId,
  ) {
    return PossibleRoomSurfaceBoostProvider(
      roomSurfaceId,
      gameStatId,
    );
  }

  @override
  PossibleRoomSurfaceBoostProvider getProviderOverride(
    covariant PossibleRoomSurfaceBoostProvider provider,
  ) {
    return call(
      provider.roomSurfaceId,
      provider.gameStatId,
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
  String? get name => r'possibleRoomSurfaceBoostProvider';
}

/// Possibly provide a room surface boost.
///
/// Copied from [possibleRoomSurfaceBoost].
class PossibleRoomSurfaceBoostProvider
    extends AutoDisposeFutureProvider<RoomSurfaceBoost?> {
  /// Possibly provide a room surface boost.
  ///
  /// Copied from [possibleRoomSurfaceBoost].
  PossibleRoomSurfaceBoostProvider(
    int roomSurfaceId,
    int gameStatId,
  ) : this._internal(
          (ref) => possibleRoomSurfaceBoost(
            ref as PossibleRoomSurfaceBoostRef,
            roomSurfaceId,
            gameStatId,
          ),
          from: possibleRoomSurfaceBoostProvider,
          name: r'possibleRoomSurfaceBoostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$possibleRoomSurfaceBoostHash,
          dependencies: PossibleRoomSurfaceBoostFamily._dependencies,
          allTransitiveDependencies:
              PossibleRoomSurfaceBoostFamily._allTransitiveDependencies,
          roomSurfaceId: roomSurfaceId,
          gameStatId: gameStatId,
        );

  PossibleRoomSurfaceBoostProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.roomSurfaceId,
    required this.gameStatId,
  }) : super.internal();

  final int roomSurfaceId;
  final int gameStatId;

  @override
  Override overrideWith(
    FutureOr<RoomSurfaceBoost?> Function(PossibleRoomSurfaceBoostRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PossibleRoomSurfaceBoostProvider._internal(
        (ref) => create(ref as PossibleRoomSurfaceBoostRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        roomSurfaceId: roomSurfaceId,
        gameStatId: gameStatId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RoomSurfaceBoost?> createElement() {
    return _PossibleRoomSurfaceBoostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PossibleRoomSurfaceBoostProvider &&
        other.roomSurfaceId == roomSurfaceId &&
        other.gameStatId == gameStatId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, roomSurfaceId.hashCode);
    hash = _SystemHash.combine(hash, gameStatId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PossibleRoomSurfaceBoostRef
    on AutoDisposeFutureProviderRef<RoomSurfaceBoost?> {
  /// The parameter `roomSurfaceId` of this provider.
  int get roomSurfaceId;

  /// The parameter `gameStatId` of this provider.
  int get gameStatId;
}

class _PossibleRoomSurfaceBoostProviderElement
    extends AutoDisposeFutureProviderElement<RoomSurfaceBoost?>
    with PossibleRoomSurfaceBoostRef {
  _PossibleRoomSurfaceBoostProviderElement(super.provider);

  @override
  int get roomSurfaceId =>
      (origin as PossibleRoomSurfaceBoostProvider).roomSurfaceId;
  @override
  int get gameStatId => (origin as PossibleRoomSurfaceBoostProvider).gameStatId;
}

String _$roomSurfaceBoostHash() => r'5b1f833f6750313ce8bccf4025db959b20706e6c';

/// Provide a single room surface boost.
///
/// Copied from [roomSurfaceBoost].
@ProviderFor(roomSurfaceBoost)
const roomSurfaceBoostProvider = RoomSurfaceBoostFamily();

/// Provide a single room surface boost.
///
/// Copied from [roomSurfaceBoost].
class RoomSurfaceBoostFamily extends Family<AsyncValue<RoomSurfaceBoost>> {
  /// Provide a single room surface boost.
  ///
  /// Copied from [roomSurfaceBoost].
  const RoomSurfaceBoostFamily();

  /// Provide a single room surface boost.
  ///
  /// Copied from [roomSurfaceBoost].
  RoomSurfaceBoostProvider call(
    int id,
  ) {
    return RoomSurfaceBoostProvider(
      id,
    );
  }

  @override
  RoomSurfaceBoostProvider getProviderOverride(
    covariant RoomSurfaceBoostProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'roomSurfaceBoostProvider';
}

/// Provide a single room surface boost.
///
/// Copied from [roomSurfaceBoost].
class RoomSurfaceBoostProvider
    extends AutoDisposeFutureProvider<RoomSurfaceBoost> {
  /// Provide a single room surface boost.
  ///
  /// Copied from [roomSurfaceBoost].
  RoomSurfaceBoostProvider(
    int id,
  ) : this._internal(
          (ref) => roomSurfaceBoost(
            ref as RoomSurfaceBoostRef,
            id,
          ),
          from: roomSurfaceBoostProvider,
          name: r'roomSurfaceBoostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomSurfaceBoostHash,
          dependencies: RoomSurfaceBoostFamily._dependencies,
          allTransitiveDependencies:
              RoomSurfaceBoostFamily._allTransitiveDependencies,
          id: id,
        );

  RoomSurfaceBoostProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<RoomSurfaceBoost> Function(RoomSurfaceBoostRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomSurfaceBoostProvider._internal(
        (ref) => create(ref as RoomSurfaceBoostRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RoomSurfaceBoost> createElement() {
    return _RoomSurfaceBoostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomSurfaceBoostProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RoomSurfaceBoostRef on AutoDisposeFutureProviderRef<RoomSurfaceBoost> {
  /// The parameter `id` of this provider.
  int get id;
}

class _RoomSurfaceBoostProviderElement
    extends AutoDisposeFutureProviderElement<RoomSurfaceBoost>
    with RoomSurfaceBoostRef {
  _RoomSurfaceBoostProviderElement(super.provider);

  @override
  int get id => (origin as RoomSurfaceBoostProvider).id;
}

String _$gameStatValueContextHash() =>
    r'37369f3dfeaf65960003e9434d56bde86a2254e8';

/// Provide a game stat value.
///
/// Copied from [gameStatValueContext].
@ProviderFor(gameStatValueContext)
const gameStatValueContextProvider = GameStatValueContextFamily();

/// Provide a game stat value.
///
/// Copied from [gameStatValueContext].
class GameStatValueContextFamily
    extends Family<AsyncValue<GameStatValueContext>> {
  /// Provide a game stat value.
  ///
  /// Copied from [gameStatValueContext].
  const GameStatValueContextFamily();

  /// Provide a game stat value.
  ///
  /// Copied from [gameStatValueContext].
  GameStatValueContextProvider call(
    String playerId,
    int gameStatId,
  ) {
    return GameStatValueContextProvider(
      playerId,
      gameStatId,
    );
  }

  @override
  GameStatValueContextProvider getProviderOverride(
    covariant GameStatValueContextProvider provider,
  ) {
    return call(
      provider.playerId,
      provider.gameStatId,
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
  String? get name => r'gameStatValueContextProvider';
}

/// Provide a game stat value.
///
/// Copied from [gameStatValueContext].
class GameStatValueContextProvider
    extends AutoDisposeFutureProvider<GameStatValueContext> {
  /// Provide a game stat value.
  ///
  /// Copied from [gameStatValueContext].
  GameStatValueContextProvider(
    String playerId,
    int gameStatId,
  ) : this._internal(
          (ref) => gameStatValueContext(
            ref as GameStatValueContextRef,
            playerId,
            gameStatId,
          ),
          from: gameStatValueContextProvider,
          name: r'gameStatValueContextProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gameStatValueContextHash,
          dependencies: GameStatValueContextFamily._dependencies,
          allTransitiveDependencies:
              GameStatValueContextFamily._allTransitiveDependencies,
          playerId: playerId,
          gameStatId: gameStatId,
        );

  GameStatValueContextProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.playerId,
    required this.gameStatId,
  }) : super.internal();

  final String playerId;
  final int gameStatId;

  @override
  Override overrideWith(
    FutureOr<GameStatValueContext> Function(GameStatValueContextRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GameStatValueContextProvider._internal(
        (ref) => create(ref as GameStatValueContextRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        playerId: playerId,
        gameStatId: gameStatId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GameStatValueContext> createElement() {
    return _GameStatValueContextProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GameStatValueContextProvider &&
        other.playerId == playerId &&
        other.gameStatId == gameStatId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, playerId.hashCode);
    hash = _SystemHash.combine(hash, gameStatId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GameStatValueContextRef
    on AutoDisposeFutureProviderRef<GameStatValueContext> {
  /// The parameter `playerId` of this provider.
  String get playerId;

  /// The parameter `gameStatId` of this provider.
  int get gameStatId;
}

class _GameStatValueContextProviderElement
    extends AutoDisposeFutureProviderElement<GameStatValueContext>
    with GameStatValueContextRef {
  _GameStatValueContextProviderElement(super.provider);

  @override
  String get playerId => (origin as GameStatValueContextProvider).playerId;
  @override
  int get gameStatId => (origin as GameStatValueContextProvider).gameStatId;
}

String _$roomObjectRandomSoundsHash() =>
    r'23aa124c471d8eed3065200442e9a246dd2d7ce5';

/// Provide all random sounds for an object with the given [roomObjectId].
///
/// Copied from [roomObjectRandomSounds].
@ProviderFor(roomObjectRandomSounds)
const roomObjectRandomSoundsProvider = RoomObjectRandomSoundsFamily();

/// Provide all random sounds for an object with the given [roomObjectId].
///
/// Copied from [roomObjectRandomSounds].
class RoomObjectRandomSoundsFamily
    extends Family<AsyncValue<List<RoomObjectRandomSound>>> {
  /// Provide all random sounds for an object with the given [roomObjectId].
  ///
  /// Copied from [roomObjectRandomSounds].
  const RoomObjectRandomSoundsFamily();

  /// Provide all random sounds for an object with the given [roomObjectId].
  ///
  /// Copied from [roomObjectRandomSounds].
  RoomObjectRandomSoundsProvider call(
    int roomObjectId,
  ) {
    return RoomObjectRandomSoundsProvider(
      roomObjectId,
    );
  }

  @override
  RoomObjectRandomSoundsProvider getProviderOverride(
    covariant RoomObjectRandomSoundsProvider provider,
  ) {
    return call(
      provider.roomObjectId,
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
  String? get name => r'roomObjectRandomSoundsProvider';
}

/// Provide all random sounds for an object with the given [roomObjectId].
///
/// Copied from [roomObjectRandomSounds].
class RoomObjectRandomSoundsProvider
    extends AutoDisposeFutureProvider<List<RoomObjectRandomSound>> {
  /// Provide all random sounds for an object with the given [roomObjectId].
  ///
  /// Copied from [roomObjectRandomSounds].
  RoomObjectRandomSoundsProvider(
    int roomObjectId,
  ) : this._internal(
          (ref) => roomObjectRandomSounds(
            ref as RoomObjectRandomSoundsRef,
            roomObjectId,
          ),
          from: roomObjectRandomSoundsProvider,
          name: r'roomObjectRandomSoundsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomObjectRandomSoundsHash,
          dependencies: RoomObjectRandomSoundsFamily._dependencies,
          allTransitiveDependencies:
              RoomObjectRandomSoundsFamily._allTransitiveDependencies,
          roomObjectId: roomObjectId,
        );

  RoomObjectRandomSoundsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.roomObjectId,
  }) : super.internal();

  final int roomObjectId;

  @override
  Override overrideWith(
    FutureOr<List<RoomObjectRandomSound>> Function(
            RoomObjectRandomSoundsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomObjectRandomSoundsProvider._internal(
        (ref) => create(ref as RoomObjectRandomSoundsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        roomObjectId: roomObjectId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<RoomObjectRandomSound>>
      createElement() {
    return _RoomObjectRandomSoundsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomObjectRandomSoundsProvider &&
        other.roomObjectId == roomObjectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, roomObjectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RoomObjectRandomSoundsRef
    on AutoDisposeFutureProviderRef<List<RoomObjectRandomSound>> {
  /// The parameter `roomObjectId` of this provider.
  int get roomObjectId;
}

class _RoomObjectRandomSoundsProviderElement
    extends AutoDisposeFutureProviderElement<List<RoomObjectRandomSound>>
    with RoomObjectRandomSoundsRef {
  _RoomObjectRandomSoundsProviderElement(super.provider);

  @override
  int get roomObjectId =>
      (origin as RoomObjectRandomSoundsProvider).roomObjectId;
}

String _$randomSoundHash() => r'0102e4546bd3c1ed1c0c10849d76c7be7114491b';

/// Provide a single random sound by [id].
///
/// Copied from [randomSound].
@ProviderFor(randomSound)
const randomSoundProvider = RandomSoundFamily();

/// Provide a single random sound by [id].
///
/// Copied from [randomSound].
class RandomSoundFamily extends Family<AsyncValue<RoomObjectRandomSound>> {
  /// Provide a single random sound by [id].
  ///
  /// Copied from [randomSound].
  const RandomSoundFamily();

  /// Provide a single random sound by [id].
  ///
  /// Copied from [randomSound].
  RandomSoundProvider call(
    int id,
  ) {
    return RandomSoundProvider(
      id,
    );
  }

  @override
  RandomSoundProvider getProviderOverride(
    covariant RandomSoundProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'randomSoundProvider';
}

/// Provide a single random sound by [id].
///
/// Copied from [randomSound].
class RandomSoundProvider
    extends AutoDisposeFutureProvider<RoomObjectRandomSound> {
  /// Provide a single random sound by [id].
  ///
  /// Copied from [randomSound].
  RandomSoundProvider(
    int id,
  ) : this._internal(
          (ref) => randomSound(
            ref as RandomSoundRef,
            id,
          ),
          from: randomSoundProvider,
          name: r'randomSoundProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$randomSoundHash,
          dependencies: RandomSoundFamily._dependencies,
          allTransitiveDependencies:
              RandomSoundFamily._allTransitiveDependencies,
          id: id,
        );

  RandomSoundProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<RoomObjectRandomSound> Function(RandomSoundRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RandomSoundProvider._internal(
        (ref) => create(ref as RandomSoundRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RoomObjectRandomSound> createElement() {
    return _RandomSoundProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RandomSoundProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RandomSoundRef on AutoDisposeFutureProviderRef<RoomObjectRandomSound> {
  /// The parameter `id` of this provider.
  int get id;
}

class _RandomSoundProviderElement
    extends AutoDisposeFutureProviderElement<RoomObjectRandomSound>
    with RandomSoundRef {
  _RandomSoundProviderElement(super.provider);

  @override
  int get id => (origin as RandomSoundProvider).id;
}

String _$roomObjectRandomSoundsForRoomHash() =>
    r'baaf0a6abe4834b42a36fec236fe9736817f3de6';

/// Provide all random sounds for a room with the given [roomId].
///
/// Copied from [roomObjectRandomSoundsForRoom].
@ProviderFor(roomObjectRandomSoundsForRoom)
const roomObjectRandomSoundsForRoomProvider =
    RoomObjectRandomSoundsForRoomFamily();

/// Provide all random sounds for a room with the given [roomId].
///
/// Copied from [roomObjectRandomSoundsForRoom].
class RoomObjectRandomSoundsForRoomFamily
    extends Family<AsyncValue<List<RoomObjectRandomSoundContext>>> {
  /// Provide all random sounds for a room with the given [roomId].
  ///
  /// Copied from [roomObjectRandomSoundsForRoom].
  const RoomObjectRandomSoundsForRoomFamily();

  /// Provide all random sounds for a room with the given [roomId].
  ///
  /// Copied from [roomObjectRandomSoundsForRoom].
  RoomObjectRandomSoundsForRoomProvider call(
    int roomId,
  ) {
    return RoomObjectRandomSoundsForRoomProvider(
      roomId,
    );
  }

  @override
  RoomObjectRandomSoundsForRoomProvider getProviderOverride(
    covariant RoomObjectRandomSoundsForRoomProvider provider,
  ) {
    return call(
      provider.roomId,
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
  String? get name => r'roomObjectRandomSoundsForRoomProvider';
}

/// Provide all random sounds for a room with the given [roomId].
///
/// Copied from [roomObjectRandomSoundsForRoom].
class RoomObjectRandomSoundsForRoomProvider
    extends AutoDisposeFutureProvider<List<RoomObjectRandomSoundContext>> {
  /// Provide all random sounds for a room with the given [roomId].
  ///
  /// Copied from [roomObjectRandomSoundsForRoom].
  RoomObjectRandomSoundsForRoomProvider(
    int roomId,
  ) : this._internal(
          (ref) => roomObjectRandomSoundsForRoom(
            ref as RoomObjectRandomSoundsForRoomRef,
            roomId,
          ),
          from: roomObjectRandomSoundsForRoomProvider,
          name: r'roomObjectRandomSoundsForRoomProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomObjectRandomSoundsForRoomHash,
          dependencies: RoomObjectRandomSoundsForRoomFamily._dependencies,
          allTransitiveDependencies:
              RoomObjectRandomSoundsForRoomFamily._allTransitiveDependencies,
          roomId: roomId,
        );

  RoomObjectRandomSoundsForRoomProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.roomId,
  }) : super.internal();

  final int roomId;

  @override
  Override overrideWith(
    FutureOr<List<RoomObjectRandomSoundContext>> Function(
            RoomObjectRandomSoundsForRoomRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomObjectRandomSoundsForRoomProvider._internal(
        (ref) => create(ref as RoomObjectRandomSoundsForRoomRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        roomId: roomId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<RoomObjectRandomSoundContext>>
      createElement() {
    return _RoomObjectRandomSoundsForRoomProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomObjectRandomSoundsForRoomProvider &&
        other.roomId == roomId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, roomId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RoomObjectRandomSoundsForRoomRef
    on AutoDisposeFutureProviderRef<List<RoomObjectRandomSoundContext>> {
  /// The parameter `roomId` of this provider.
  int get roomId;
}

class _RoomObjectRandomSoundsForRoomProviderElement
    extends AutoDisposeFutureProviderElement<List<RoomObjectRandomSoundContext>>
    with RoomObjectRandomSoundsForRoomRef {
  _RoomObjectRandomSoundsForRoomProviderElement(super.provider);

  @override
  int get roomId => (origin as RoomObjectRandomSoundsForRoomProvider).roomId;
}

String _$currentProjectContextHash() =>
    r'4c8cc047a1a79eb695b9f390a99148ce921e1e5b';

/// Provide The current project context.
///
/// Copied from [CurrentProjectContext].
@ProviderFor(CurrentProjectContext)
final currentProjectContextProvider =
    NotifierProvider<CurrentProjectContext, ProjectContext?>.internal(
  CurrentProjectContext.new,
  name: r'currentProjectContextProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentProjectContextHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentProjectContext = Notifier<ProjectContext?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
