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
String _$projectContextHash() => r'3584feaeda8d11966e8515024425a196abad2383';

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

String _$zonesHash() => r'7c41575c87d09c9215be210bb23d3fde4098ed3c';

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

String _$roomsHash() => r'63e18305655b9da537f95adab054b22877456061';

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

String _$roomSurfacesHash() => r'c7fa6fb65288d25cf7cda7f8794ff9fa1186b09e';

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

String _$roomObjectsHash() => r'5af4e391dd28c94136bcf244f5c6fcd17c9e8baa';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
