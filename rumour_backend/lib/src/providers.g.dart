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
String _$soundReferenceHash() => r'4db1c33365aeffab6692b34cc7ec9feeaacd7ab6';

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

String _$zonesHash() => r'fb62e3420dfa6c3f88255cc6f92fdb4cbe51bfe9';

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
String _$zoneHash() => r'5ba174939d5f33617c94c255f707811a71e77aee';

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

String _$roomsHash() => r'4505c8cddbcebe98d4e564e1ddaa22ae2635e829';

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

String _$roomHash() => r'63ec0b7d728c321f0f8515a423a8ba7165f95e33';

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

String _$roomSurfacesHash() => r'51d99ac9778cf0738d89376e295e7327a8ce1224';

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
String _$roomSurfaceHash() => r'7c9abaa7a20f04f19d2041cf7157bb2550cde0b9';

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

String _$roomObjectsHash() => r'd027afd6db05452f21d42197a3b9f6f4e6207aa6';

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

String _$roomObjectHash() => r'2077ef867632460977f7dcc660fb3beef2a9afeb';

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

String _$roomExitHash() => r'721a3b7ab4dd7f03daa7e2ad4e9ce39c20cf041b';

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

String _$objectsInRoomHash() => r'a0de806ba4d2b1db2b8b6a762d70e6ba933948a5';

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

String _$playerClassesHash() => r'b8d905fa7078d569b555fee616a084861d29d9ed';

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
String _$playerClassHash() => r'958320a03bb1064b773f271cf926bd41eb34b91d';

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

String _$buildProjectHash() => r'45b98feb76f6843dac77b514250554cb1cdd3c4a';

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

String _$gameStatsHash() => r'5dacaeac9013308a88c5ddd0279ba5870528faae';

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
String _$gameStatHash() => r'1a409ba7ea33d83dc9936d5f22ada50ed3292832';

/// Provide a single game stat.
///
/// Copied from [gameStat].
@ProviderFor(gameStat)
const gameStatProvider = GameStatFamily();

/// Provide a single game stat.
///
/// Copied from [gameStat].
class GameStatFamily extends Family<AsyncValue<GameStatContext>> {
  /// Provide a single game stat.
  ///
  /// Copied from [gameStat].
  const GameStatFamily();

  /// Provide a single game stat.
  ///
  /// Copied from [gameStat].
  GameStatProvider call(
    int id,
  ) {
    return GameStatProvider(
      id,
    );
  }

  @override
  GameStatProvider getProviderOverride(
    covariant GameStatProvider provider,
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
  String? get name => r'gameStatProvider';
}

/// Provide a single game stat.
///
/// Copied from [gameStat].
class GameStatProvider extends AutoDisposeFutureProvider<GameStatContext> {
  /// Provide a single game stat.
  ///
  /// Copied from [gameStat].
  GameStatProvider(
    int id,
  ) : this._internal(
          (ref) => gameStat(
            ref as GameStatRef,
            id,
          ),
          from: gameStatProvider,
          name: r'gameStatProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gameStatHash,
          dependencies: GameStatFamily._dependencies,
          allTransitiveDependencies: GameStatFamily._allTransitiveDependencies,
          id: id,
        );

  GameStatProvider._internal(
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
    FutureOr<GameStatContext> Function(GameStatRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GameStatProvider._internal(
        (ref) => create(ref as GameStatRef),
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
    return _GameStatProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GameStatProvider && other.id == id;
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
mixin GameStatRef on AutoDisposeFutureProviderRef<GameStatContext> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GameStatProviderElement
    extends AutoDisposeFutureProviderElement<GameStatContext> with GameStatRef {
  _GameStatProviderElement(super.provider);

  @override
  int get id => (origin as GameStatProvider).id;
}

String _$playerClassGameStatHash() =>
    r'a9b7af6e8cdcf158b5033f3ad93248bff5e0a038';

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

String _$gamePlayerStatsHash() => r'7b3767aa4ef9af914d4b5eb22ecf3210cf28938d';

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

String _$playerStatHash() => r'658028eba4031e676c7682ca3dc100f71577cf25';

/// Provide a single player stat.
///
/// Copied from [playerStat].
@ProviderFor(playerStat)
const playerStatProvider = PlayerStatFamily();

/// Provide a single player stat.
///
/// Copied from [playerStat].
class PlayerStatFamily extends Family<AsyncValue<int>> {
  /// Provide a single player stat.
  ///
  /// Copied from [playerStat].
  const PlayerStatFamily();

  /// Provide a single player stat.
  ///
  /// Copied from [playerStat].
  PlayerStatProvider call(
    String playerId,
    int gameStatId,
  ) {
    return PlayerStatProvider(
      playerId,
      gameStatId,
    );
  }

  @override
  PlayerStatProvider getProviderOverride(
    covariant PlayerStatProvider provider,
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
  String? get name => r'playerStatProvider';
}

/// Provide a single player stat.
///
/// Copied from [playerStat].
class PlayerStatProvider extends AutoDisposeFutureProvider<int> {
  /// Provide a single player stat.
  ///
  /// Copied from [playerStat].
  PlayerStatProvider(
    String playerId,
    int gameStatId,
  ) : this._internal(
          (ref) => playerStat(
            ref as PlayerStatRef,
            playerId,
            gameStatId,
          ),
          from: playerStatProvider,
          name: r'playerStatProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playerStatHash,
          dependencies: PlayerStatFamily._dependencies,
          allTransitiveDependencies:
              PlayerStatFamily._allTransitiveDependencies,
          playerId: playerId,
          gameStatId: gameStatId,
        );

  PlayerStatProvider._internal(
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
    FutureOr<int> Function(PlayerStatRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlayerStatProvider._internal(
        (ref) => create(ref as PlayerStatRef),
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
    return _PlayerStatProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerStatProvider &&
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
mixin PlayerStatRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `playerId` of this provider.
  String get playerId;

  /// The parameter `gameStatId` of this provider.
  int get gameStatId;
}

class _PlayerStatProviderElement extends AutoDisposeFutureProviderElement<int>
    with PlayerStatRef {
  _PlayerStatProviderElement(super.provider);

  @override
  String get playerId => (origin as PlayerStatProvider).playerId;
  @override
  int get gameStatId => (origin as PlayerStatProvider).gameStatId;
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
