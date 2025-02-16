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
String _$projectTextStyleHash() => r'2dd82621f9c8ccf27024efa424481f3aedcfed67';

/// The text style to use for widgets.
///
/// Copied from [projectTextStyle].
@ProviderFor(projectTextStyle)
final projectTextStyleProvider = AutoDisposeProvider<TextStyle>.internal(
  projectTextStyle,
  name: r'projectTextStyleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$projectTextStyleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProjectTextStyleRef = AutoDisposeProviderRef<TextStyle>;
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

String _$roomObjectAmbiancesHash() =>
    r'7aa4ea44842b4ed155e19651d410d37bc3541867';

/// Return ambiances for the objects in a given room.
///
/// Copied from [roomObjectAmbiances].
@ProviderFor(roomObjectAmbiances)
const roomObjectAmbiancesProvider = RoomObjectAmbiancesFamily();

/// Return ambiances for the objects in a given room.
///
/// Copied from [roomObjectAmbiances].
class RoomObjectAmbiancesFamily
    extends Family<AsyncValue<List<PositionedSoundReference>>> {
  /// Return ambiances for the objects in a given room.
  ///
  /// Copied from [roomObjectAmbiances].
  const RoomObjectAmbiancesFamily();

  /// Return ambiances for the objects in a given room.
  ///
  /// Copied from [roomObjectAmbiances].
  RoomObjectAmbiancesProvider call(
    int roomId,
  ) {
    return RoomObjectAmbiancesProvider(
      roomId,
    );
  }

  @override
  RoomObjectAmbiancesProvider getProviderOverride(
    covariant RoomObjectAmbiancesProvider provider,
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
  String? get name => r'roomObjectAmbiancesProvider';
}

/// Return ambiances for the objects in a given room.
///
/// Copied from [roomObjectAmbiances].
class RoomObjectAmbiancesProvider
    extends AutoDisposeFutureProvider<List<PositionedSoundReference>> {
  /// Return ambiances for the objects in a given room.
  ///
  /// Copied from [roomObjectAmbiances].
  RoomObjectAmbiancesProvider(
    int roomId,
  ) : this._internal(
          (ref) => roomObjectAmbiances(
            ref as RoomObjectAmbiancesRef,
            roomId,
          ),
          from: roomObjectAmbiancesProvider,
          name: r'roomObjectAmbiancesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomObjectAmbiancesHash,
          dependencies: RoomObjectAmbiancesFamily._dependencies,
          allTransitiveDependencies:
              RoomObjectAmbiancesFamily._allTransitiveDependencies,
          roomId: roomId,
        );

  RoomObjectAmbiancesProvider._internal(
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
    FutureOr<List<PositionedSoundReference>> Function(
            RoomObjectAmbiancesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomObjectAmbiancesProvider._internal(
        (ref) => create(ref as RoomObjectAmbiancesRef),
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
  AutoDisposeFutureProviderElement<List<PositionedSoundReference>>
      createElement() {
    return _RoomObjectAmbiancesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomObjectAmbiancesProvider && other.roomId == roomId;
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
mixin RoomObjectAmbiancesRef
    on AutoDisposeFutureProviderRef<List<PositionedSoundReference>> {
  /// The parameter `roomId` of this provider.
  int get roomId;
}

class _RoomObjectAmbiancesProviderElement
    extends AutoDisposeFutureProviderElement<List<PositionedSoundReference>>
    with RoomObjectAmbiancesRef {
  _RoomObjectAmbiancesProviderElement(super.provider);

  @override
  int get roomId => (origin as RoomObjectAmbiancesProvider).roomId;
}

String _$roomAmbiancesHash() => r'e82492c812484204a04bf3c377fdfde97e4deae1';

/// Provide all sounds for a room.
///
///
/// Copied from [roomAmbiances].
@ProviderFor(roomAmbiances)
const roomAmbiancesProvider = RoomAmbiancesFamily();

/// Provide all sounds for a room.
///
///
/// Copied from [roomAmbiances].
class RoomAmbiancesFamily extends Family<AsyncValue<RoomAmbiancesContext>> {
  /// Provide all sounds for a room.
  ///
  ///
  /// Copied from [roomAmbiances].
  const RoomAmbiancesFamily();

  /// Provide all sounds for a room.
  ///
  ///
  /// Copied from [roomAmbiances].
  RoomAmbiancesProvider call(
    int roomId,
  ) {
    return RoomAmbiancesProvider(
      roomId,
    );
  }

  @override
  RoomAmbiancesProvider getProviderOverride(
    covariant RoomAmbiancesProvider provider,
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
  String? get name => r'roomAmbiancesProvider';
}

/// Provide all sounds for a room.
///
///
/// Copied from [roomAmbiances].
class RoomAmbiancesProvider
    extends AutoDisposeFutureProvider<RoomAmbiancesContext> {
  /// Provide all sounds for a room.
  ///
  ///
  /// Copied from [roomAmbiances].
  RoomAmbiancesProvider(
    int roomId,
  ) : this._internal(
          (ref) => roomAmbiances(
            ref as RoomAmbiancesRef,
            roomId,
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
          roomId: roomId,
        );

  RoomAmbiancesProvider._internal(
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
    FutureOr<RoomAmbiancesContext> Function(RoomAmbiancesRef provider) create,
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
        roomId: roomId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RoomAmbiancesContext> createElement() {
    return _RoomAmbiancesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomAmbiancesProvider && other.roomId == roomId;
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
mixin RoomAmbiancesRef on AutoDisposeFutureProviderRef<RoomAmbiancesContext> {
  /// The parameter `roomId` of this provider.
  int get roomId;
}

class _RoomAmbiancesProviderElement
    extends AutoDisposeFutureProviderElement<RoomAmbiancesContext>
    with RoomAmbiancesRef {
  _RoomAmbiancesProviderElement(super.provider);

  @override
  int get roomId => (origin as RoomAmbiancesProvider).roomId;
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
String _$gamePlayerContextHash() => r'a4e012483e8b6f7a73c2ab1071ea26f9af65ff95';

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

String _$gameStatsHash() => r'1a481afdfdc377ef124322a70ecaa67690de9af7';

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

String _$roomObjectRandomSoundHash() =>
    r'aa876911443d4b9230431c0b993138a7e655e06a';

/// Provide a single random sound by [id].
///
/// Copied from [roomObjectRandomSound].
@ProviderFor(roomObjectRandomSound)
const roomObjectRandomSoundProvider = RoomObjectRandomSoundFamily();

/// Provide a single random sound by [id].
///
/// Copied from [roomObjectRandomSound].
class RoomObjectRandomSoundFamily
    extends Family<AsyncValue<RoomObjectRandomSound>> {
  /// Provide a single random sound by [id].
  ///
  /// Copied from [roomObjectRandomSound].
  const RoomObjectRandomSoundFamily();

  /// Provide a single random sound by [id].
  ///
  /// Copied from [roomObjectRandomSound].
  RoomObjectRandomSoundProvider call(
    int id,
  ) {
    return RoomObjectRandomSoundProvider(
      id,
    );
  }

  @override
  RoomObjectRandomSoundProvider getProviderOverride(
    covariant RoomObjectRandomSoundProvider provider,
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
  String? get name => r'roomObjectRandomSoundProvider';
}

/// Provide a single random sound by [id].
///
/// Copied from [roomObjectRandomSound].
class RoomObjectRandomSoundProvider
    extends AutoDisposeFutureProvider<RoomObjectRandomSound> {
  /// Provide a single random sound by [id].
  ///
  /// Copied from [roomObjectRandomSound].
  RoomObjectRandomSoundProvider(
    int id,
  ) : this._internal(
          (ref) => roomObjectRandomSound(
            ref as RoomObjectRandomSoundRef,
            id,
          ),
          from: roomObjectRandomSoundProvider,
          name: r'roomObjectRandomSoundProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomObjectRandomSoundHash,
          dependencies: RoomObjectRandomSoundFamily._dependencies,
          allTransitiveDependencies:
              RoomObjectRandomSoundFamily._allTransitiveDependencies,
          id: id,
        );

  RoomObjectRandomSoundProvider._internal(
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
    FutureOr<RoomObjectRandomSound> Function(RoomObjectRandomSoundRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomObjectRandomSoundProvider._internal(
        (ref) => create(ref as RoomObjectRandomSoundRef),
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
    return _RoomObjectRandomSoundProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomObjectRandomSoundProvider && other.id == id;
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
mixin RoomObjectRandomSoundRef
    on AutoDisposeFutureProviderRef<RoomObjectRandomSound> {
  /// The parameter `id` of this provider.
  int get id;
}

class _RoomObjectRandomSoundProviderElement
    extends AutoDisposeFutureProviderElement<RoomObjectRandomSound>
    with RoomObjectRandomSoundRef {
  _RoomObjectRandomSoundProviderElement(super.provider);

  @override
  int get id => (origin as RoomObjectRandomSoundProvider).id;
}

String _$visibleRoomObjectsHash() =>
    r'7d951666708d8c6dfe6c0074044a6a1273862cd7';

/// Get visible room objects in a room with the given [roomId].
///
/// Copied from [visibleRoomObjects].
@ProviderFor(visibleRoomObjects)
const visibleRoomObjectsProvider = VisibleRoomObjectsFamily();

/// Get visible room objects in a room with the given [roomId].
///
/// Copied from [visibleRoomObjects].
class VisibleRoomObjectsFamily extends Family<AsyncValue<List<RoomObject>>> {
  /// Get visible room objects in a room with the given [roomId].
  ///
  /// Copied from [visibleRoomObjects].
  const VisibleRoomObjectsFamily();

  /// Get visible room objects in a room with the given [roomId].
  ///
  /// Copied from [visibleRoomObjects].
  VisibleRoomObjectsProvider call(
    int roomId,
  ) {
    return VisibleRoomObjectsProvider(
      roomId,
    );
  }

  @override
  VisibleRoomObjectsProvider getProviderOverride(
    covariant VisibleRoomObjectsProvider provider,
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
  String? get name => r'visibleRoomObjectsProvider';
}

/// Get visible room objects in a room with the given [roomId].
///
/// Copied from [visibleRoomObjects].
class VisibleRoomObjectsProvider
    extends AutoDisposeFutureProvider<List<RoomObject>> {
  /// Get visible room objects in a room with the given [roomId].
  ///
  /// Copied from [visibleRoomObjects].
  VisibleRoomObjectsProvider(
    int roomId,
  ) : this._internal(
          (ref) => visibleRoomObjects(
            ref as VisibleRoomObjectsRef,
            roomId,
          ),
          from: visibleRoomObjectsProvider,
          name: r'visibleRoomObjectsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$visibleRoomObjectsHash,
          dependencies: VisibleRoomObjectsFamily._dependencies,
          allTransitiveDependencies:
              VisibleRoomObjectsFamily._allTransitiveDependencies,
          roomId: roomId,
        );

  VisibleRoomObjectsProvider._internal(
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
    FutureOr<List<RoomObject>> Function(VisibleRoomObjectsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VisibleRoomObjectsProvider._internal(
        (ref) => create(ref as VisibleRoomObjectsRef),
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
  AutoDisposeFutureProviderElement<List<RoomObject>> createElement() {
    return _VisibleRoomObjectsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VisibleRoomObjectsProvider && other.roomId == roomId;
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
mixin VisibleRoomObjectsRef on AutoDisposeFutureProviderRef<List<RoomObject>> {
  /// The parameter `roomId` of this provider.
  int get roomId;
}

class _VisibleRoomObjectsProviderElement
    extends AutoDisposeFutureProviderElement<List<RoomObject>>
    with VisibleRoomObjectsRef {
  _VisibleRoomObjectsProviderElement(super.provider);

  @override
  int get roomId => (origin as VisibleRoomObjectsProvider).roomId;
}

String _$commandHash() => r'11656e5245772f12af6efc48e608683ce49b0442';

/// Provide a command.
///
/// Copied from [command].
@ProviderFor(command)
const commandProvider = CommandFamily();

/// Provide a command.
///
/// Copied from [command].
class CommandFamily extends Family<AsyncValue<Command>> {
  /// Provide a command.
  ///
  /// Copied from [command].
  const CommandFamily();

  /// Provide a command.
  ///
  /// Copied from [command].
  CommandProvider call(
    int id,
  ) {
    return CommandProvider(
      id,
    );
  }

  @override
  CommandProvider getProviderOverride(
    covariant CommandProvider provider,
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
  String? get name => r'commandProvider';
}

/// Provide a command.
///
/// Copied from [command].
class CommandProvider extends AutoDisposeFutureProvider<Command> {
  /// Provide a command.
  ///
  /// Copied from [command].
  CommandProvider(
    int id,
  ) : this._internal(
          (ref) => command(
            ref as CommandRef,
            id,
          ),
          from: commandProvider,
          name: r'commandProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commandHash,
          dependencies: CommandFamily._dependencies,
          allTransitiveDependencies: CommandFamily._allTransitiveDependencies,
          id: id,
        );

  CommandProvider._internal(
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
    FutureOr<Command> Function(CommandRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CommandProvider._internal(
        (ref) => create(ref as CommandRef),
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
  AutoDisposeFutureProviderElement<Command> createElement() {
    return _CommandProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommandProvider && other.id == id;
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
mixin CommandRef on AutoDisposeFutureProviderRef<Command> {
  /// The parameter `id` of this provider.
  int get id;
}

class _CommandProviderElement extends AutoDisposeFutureProviderElement<Command>
    with CommandRef {
  _CommandProviderElement(super.provider);

  @override
  int get id => (origin as CommandProvider).id;
}

String _$commandCallerHash() => r'2c7bb93e281d6811d15059f24c061d63943d4d23';

/// Provide a single call command.
///
/// Copied from [commandCaller].
@ProviderFor(commandCaller)
const commandCallerProvider = CommandCallerFamily();

/// Provide a single call command.
///
/// Copied from [commandCaller].
class CommandCallerFamily extends Family<AsyncValue<CommandCaller>> {
  /// Provide a single call command.
  ///
  /// Copied from [commandCaller].
  const CommandCallerFamily();

  /// Provide a single call command.
  ///
  /// Copied from [commandCaller].
  CommandCallerProvider call(
    int id,
  ) {
    return CommandCallerProvider(
      id,
    );
  }

  @override
  CommandCallerProvider getProviderOverride(
    covariant CommandCallerProvider provider,
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
  String? get name => r'commandCallerProvider';
}

/// Provide a single call command.
///
/// Copied from [commandCaller].
class CommandCallerProvider extends AutoDisposeFutureProvider<CommandCaller> {
  /// Provide a single call command.
  ///
  /// Copied from [commandCaller].
  CommandCallerProvider(
    int id,
  ) : this._internal(
          (ref) => commandCaller(
            ref as CommandCallerRef,
            id,
          ),
          from: commandCallerProvider,
          name: r'commandCallerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commandCallerHash,
          dependencies: CommandCallerFamily._dependencies,
          allTransitiveDependencies:
              CommandCallerFamily._allTransitiveDependencies,
          id: id,
        );

  CommandCallerProvider._internal(
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
    FutureOr<CommandCaller> Function(CommandCallerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CommandCallerProvider._internal(
        (ref) => create(ref as CommandCallerRef),
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
  AutoDisposeFutureProviderElement<CommandCaller> createElement() {
    return _CommandCallerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommandCallerProvider && other.id == id;
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
mixin CommandCallerRef on AutoDisposeFutureProviderRef<CommandCaller> {
  /// The parameter `id` of this provider.
  int get id;
}

class _CommandCallerProviderElement
    extends AutoDisposeFutureProviderElement<CommandCaller>
    with CommandCallerRef {
  _CommandCallerProviderElement(super.provider);

  @override
  int get id => (origin as CommandCallerProvider).id;
}

String _$commandCallerFromParentCommandIdHash() =>
    r'931710a6cc2edb9349d8a0bddd09e147f388fa80';

/// Provide a command caller by [callingCommandId].
///
/// Copied from [commandCallerFromParentCommandId].
@ProviderFor(commandCallerFromParentCommandId)
const commandCallerFromParentCommandIdProvider =
    CommandCallerFromParentCommandIdFamily();

/// Provide a command caller by [callingCommandId].
///
/// Copied from [commandCallerFromParentCommandId].
class CommandCallerFromParentCommandIdFamily
    extends Family<AsyncValue<CommandCaller?>> {
  /// Provide a command caller by [callingCommandId].
  ///
  /// Copied from [commandCallerFromParentCommandId].
  const CommandCallerFromParentCommandIdFamily();

  /// Provide a command caller by [callingCommandId].
  ///
  /// Copied from [commandCallerFromParentCommandId].
  CommandCallerFromParentCommandIdProvider call(
    int callingCommandId,
  ) {
    return CommandCallerFromParentCommandIdProvider(
      callingCommandId,
    );
  }

  @override
  CommandCallerFromParentCommandIdProvider getProviderOverride(
    covariant CommandCallerFromParentCommandIdProvider provider,
  ) {
    return call(
      provider.callingCommandId,
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
  String? get name => r'commandCallerFromParentCommandIdProvider';
}

/// Provide a command caller by [callingCommandId].
///
/// Copied from [commandCallerFromParentCommandId].
class CommandCallerFromParentCommandIdProvider
    extends AutoDisposeFutureProvider<CommandCaller?> {
  /// Provide a command caller by [callingCommandId].
  ///
  /// Copied from [commandCallerFromParentCommandId].
  CommandCallerFromParentCommandIdProvider(
    int callingCommandId,
  ) : this._internal(
          (ref) => commandCallerFromParentCommandId(
            ref as CommandCallerFromParentCommandIdRef,
            callingCommandId,
          ),
          from: commandCallerFromParentCommandIdProvider,
          name: r'commandCallerFromParentCommandIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commandCallerFromParentCommandIdHash,
          dependencies: CommandCallerFromParentCommandIdFamily._dependencies,
          allTransitiveDependencies:
              CommandCallerFromParentCommandIdFamily._allTransitiveDependencies,
          callingCommandId: callingCommandId,
        );

  CommandCallerFromParentCommandIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.callingCommandId,
  }) : super.internal();

  final int callingCommandId;

  @override
  Override overrideWith(
    FutureOr<CommandCaller?> Function(
            CommandCallerFromParentCommandIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CommandCallerFromParentCommandIdProvider._internal(
        (ref) => create(ref as CommandCallerFromParentCommandIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        callingCommandId: callingCommandId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CommandCaller?> createElement() {
    return _CommandCallerFromParentCommandIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommandCallerFromParentCommandIdProvider &&
        other.callingCommandId == callingCommandId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, callingCommandId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CommandCallerFromParentCommandIdRef
    on AutoDisposeFutureProviderRef<CommandCaller?> {
  /// The parameter `callingCommandId` of this provider.
  int get callingCommandId;
}

class _CommandCallerFromParentCommandIdProviderElement
    extends AutoDisposeFutureProviderElement<CommandCaller?>
    with CommandCallerFromParentCommandIdRef {
  _CommandCallerFromParentCommandIdProviderElement(super.provider);

  @override
  int get callingCommandId =>
      (origin as CommandCallerFromParentCommandIdProvider).callingCommandId;
}

String _$roomObjectCommandCallersHash() =>
    r'aa85b462f7b05ec0b0a0f667d2502cfa3f5fd518';

/// Provide all command callers for the room object with the given [id].
///
/// Copied from [roomObjectCommandCallers].
@ProviderFor(roomObjectCommandCallers)
const roomObjectCommandCallersProvider = RoomObjectCommandCallersFamily();

/// Provide all command callers for the room object with the given [id].
///
/// Copied from [roomObjectCommandCallers].
class RoomObjectCommandCallersFamily
    extends Family<AsyncValue<List<RoomObjectCommandCaller>>> {
  /// Provide all command callers for the room object with the given [id].
  ///
  /// Copied from [roomObjectCommandCallers].
  const RoomObjectCommandCallersFamily();

  /// Provide all command callers for the room object with the given [id].
  ///
  /// Copied from [roomObjectCommandCallers].
  RoomObjectCommandCallersProvider call(
    int id,
  ) {
    return RoomObjectCommandCallersProvider(
      id,
    );
  }

  @override
  RoomObjectCommandCallersProvider getProviderOverride(
    covariant RoomObjectCommandCallersProvider provider,
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
  String? get name => r'roomObjectCommandCallersProvider';
}

/// Provide all command callers for the room object with the given [id].
///
/// Copied from [roomObjectCommandCallers].
class RoomObjectCommandCallersProvider
    extends AutoDisposeFutureProvider<List<RoomObjectCommandCaller>> {
  /// Provide all command callers for the room object with the given [id].
  ///
  /// Copied from [roomObjectCommandCallers].
  RoomObjectCommandCallersProvider(
    int id,
  ) : this._internal(
          (ref) => roomObjectCommandCallers(
            ref as RoomObjectCommandCallersRef,
            id,
          ),
          from: roomObjectCommandCallersProvider,
          name: r'roomObjectCommandCallersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomObjectCommandCallersHash,
          dependencies: RoomObjectCommandCallersFamily._dependencies,
          allTransitiveDependencies:
              RoomObjectCommandCallersFamily._allTransitiveDependencies,
          id: id,
        );

  RoomObjectCommandCallersProvider._internal(
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
    FutureOr<List<RoomObjectCommandCaller>> Function(
            RoomObjectCommandCallersRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomObjectCommandCallersProvider._internal(
        (ref) => create(ref as RoomObjectCommandCallersRef),
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
  AutoDisposeFutureProviderElement<List<RoomObjectCommandCaller>>
      createElement() {
    return _RoomObjectCommandCallersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomObjectCommandCallersProvider && other.id == id;
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
mixin RoomObjectCommandCallersRef
    on AutoDisposeFutureProviderRef<List<RoomObjectCommandCaller>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _RoomObjectCommandCallersProviderElement
    extends AutoDisposeFutureProviderElement<List<RoomObjectCommandCaller>>
    with RoomObjectCommandCallersRef {
  _RoomObjectCommandCallersProviderElement(super.provider);

  @override
  int get id => (origin as RoomObjectCommandCallersProvider).id;
}

String _$roomObjectCommandCallerHash() =>
    r'fb5acce416a57a5bb30ee1bbb420dfa62e05297e';

/// Provide a single room object command caller.
///
/// Copied from [roomObjectCommandCaller].
@ProviderFor(roomObjectCommandCaller)
const roomObjectCommandCallerProvider = RoomObjectCommandCallerFamily();

/// Provide a single room object command caller.
///
/// Copied from [roomObjectCommandCaller].
class RoomObjectCommandCallerFamily
    extends Family<AsyncValue<RoomObjectCommandCaller>> {
  /// Provide a single room object command caller.
  ///
  /// Copied from [roomObjectCommandCaller].
  const RoomObjectCommandCallerFamily();

  /// Provide a single room object command caller.
  ///
  /// Copied from [roomObjectCommandCaller].
  RoomObjectCommandCallerProvider call(
    int id,
  ) {
    return RoomObjectCommandCallerProvider(
      id,
    );
  }

  @override
  RoomObjectCommandCallerProvider getProviderOverride(
    covariant RoomObjectCommandCallerProvider provider,
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
  String? get name => r'roomObjectCommandCallerProvider';
}

/// Provide a single room object command caller.
///
/// Copied from [roomObjectCommandCaller].
class RoomObjectCommandCallerProvider
    extends AutoDisposeFutureProvider<RoomObjectCommandCaller> {
  /// Provide a single room object command caller.
  ///
  /// Copied from [roomObjectCommandCaller].
  RoomObjectCommandCallerProvider(
    int id,
  ) : this._internal(
          (ref) => roomObjectCommandCaller(
            ref as RoomObjectCommandCallerRef,
            id,
          ),
          from: roomObjectCommandCallerProvider,
          name: r'roomObjectCommandCallerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomObjectCommandCallerHash,
          dependencies: RoomObjectCommandCallerFamily._dependencies,
          allTransitiveDependencies:
              RoomObjectCommandCallerFamily._allTransitiveDependencies,
          id: id,
        );

  RoomObjectCommandCallerProvider._internal(
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
    FutureOr<RoomObjectCommandCaller> Function(
            RoomObjectCommandCallerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomObjectCommandCallerProvider._internal(
        (ref) => create(ref as RoomObjectCommandCallerRef),
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
  AutoDisposeFutureProviderElement<RoomObjectCommandCaller> createElement() {
    return _RoomObjectCommandCallerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomObjectCommandCallerProvider && other.id == id;
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
mixin RoomObjectCommandCallerRef
    on AutoDisposeFutureProviderRef<RoomObjectCommandCaller> {
  /// The parameter `id` of this provider.
  int get id;
}

class _RoomObjectCommandCallerProviderElement
    extends AutoDisposeFutureProviderElement<RoomObjectCommandCaller>
    with RoomObjectCommandCallerRef {
  _RoomObjectCommandCallerProviderElement(super.provider);

  @override
  int get id => (origin as RoomObjectCommandCallerProvider).id;
}

String _$roomSoundsHash() => r'38da1b53dca4f9dbad8d0ccaf965f739f6b5da8f';

/// Provide the sounds which should be loaded before a room is rendered.
///
/// Copied from [roomSounds].
@ProviderFor(roomSounds)
const roomSoundsProvider = RoomSoundsFamily();

/// Provide the sounds which should be loaded before a room is rendered.
///
/// Copied from [roomSounds].
class RoomSoundsFamily extends Family<AsyncValue<List<Sound>>> {
  /// Provide the sounds which should be loaded before a room is rendered.
  ///
  /// Copied from [roomSounds].
  const RoomSoundsFamily();

  /// Provide the sounds which should be loaded before a room is rendered.
  ///
  /// Copied from [roomSounds].
  RoomSoundsProvider call(
    int roomId,
  ) {
    return RoomSoundsProvider(
      roomId,
    );
  }

  @override
  RoomSoundsProvider getProviderOverride(
    covariant RoomSoundsProvider provider,
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
  String? get name => r'roomSoundsProvider';
}

/// Provide the sounds which should be loaded before a room is rendered.
///
/// Copied from [roomSounds].
class RoomSoundsProvider extends AutoDisposeFutureProvider<List<Sound>> {
  /// Provide the sounds which should be loaded before a room is rendered.
  ///
  /// Copied from [roomSounds].
  RoomSoundsProvider(
    int roomId,
  ) : this._internal(
          (ref) => roomSounds(
            ref as RoomSoundsRef,
            roomId,
          ),
          from: roomSoundsProvider,
          name: r'roomSoundsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomSoundsHash,
          dependencies: RoomSoundsFamily._dependencies,
          allTransitiveDependencies:
              RoomSoundsFamily._allTransitiveDependencies,
          roomId: roomId,
        );

  RoomSoundsProvider._internal(
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
    FutureOr<List<Sound>> Function(RoomSoundsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomSoundsProvider._internal(
        (ref) => create(ref as RoomSoundsRef),
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
  AutoDisposeFutureProviderElement<List<Sound>> createElement() {
    return _RoomSoundsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomSoundsProvider && other.roomId == roomId;
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
mixin RoomSoundsRef on AutoDisposeFutureProviderRef<List<Sound>> {
  /// The parameter `roomId` of this provider.
  int get roomId;
}

class _RoomSoundsProviderElement
    extends AutoDisposeFutureProviderElement<List<Sound>> with RoomSoundsRef {
  _RoomSoundsProviderElement(super.provider);

  @override
  int get roomId => (origin as RoomSoundsProvider).roomId;
}

String _$roomObjectMovementsHash() =>
    r'cad9c5e53aeb73649adb5b915337c25222dc21a5';

/// Provide room object movements.
///
/// Copied from [roomObjectMovements].
@ProviderFor(roomObjectMovements)
const roomObjectMovementsProvider = RoomObjectMovementsFamily();

/// Provide room object movements.
///
/// Copied from [roomObjectMovements].
class RoomObjectMovementsFamily
    extends Family<AsyncValue<List<RoomObjectMovement>>> {
  /// Provide room object movements.
  ///
  /// Copied from [roomObjectMovements].
  const RoomObjectMovementsFamily();

  /// Provide room object movements.
  ///
  /// Copied from [roomObjectMovements].
  RoomObjectMovementsProvider call(
    int roomObjectId,
  ) {
    return RoomObjectMovementsProvider(
      roomObjectId,
    );
  }

  @override
  RoomObjectMovementsProvider getProviderOverride(
    covariant RoomObjectMovementsProvider provider,
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
  String? get name => r'roomObjectMovementsProvider';
}

/// Provide room object movements.
///
/// Copied from [roomObjectMovements].
class RoomObjectMovementsProvider
    extends AutoDisposeFutureProvider<List<RoomObjectMovement>> {
  /// Provide room object movements.
  ///
  /// Copied from [roomObjectMovements].
  RoomObjectMovementsProvider(
    int roomObjectId,
  ) : this._internal(
          (ref) => roomObjectMovements(
            ref as RoomObjectMovementsRef,
            roomObjectId,
          ),
          from: roomObjectMovementsProvider,
          name: r'roomObjectMovementsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomObjectMovementsHash,
          dependencies: RoomObjectMovementsFamily._dependencies,
          allTransitiveDependencies:
              RoomObjectMovementsFamily._allTransitiveDependencies,
          roomObjectId: roomObjectId,
        );

  RoomObjectMovementsProvider._internal(
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
    FutureOr<List<RoomObjectMovement>> Function(RoomObjectMovementsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomObjectMovementsProvider._internal(
        (ref) => create(ref as RoomObjectMovementsRef),
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
  AutoDisposeFutureProviderElement<List<RoomObjectMovement>> createElement() {
    return _RoomObjectMovementsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomObjectMovementsProvider &&
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
mixin RoomObjectMovementsRef
    on AutoDisposeFutureProviderRef<List<RoomObjectMovement>> {
  /// The parameter `roomObjectId` of this provider.
  int get roomObjectId;
}

class _RoomObjectMovementsProviderElement
    extends AutoDisposeFutureProviderElement<List<RoomObjectMovement>>
    with RoomObjectMovementsRef {
  _RoomObjectMovementsProviderElement(super.provider);

  @override
  int get roomObjectId => (origin as RoomObjectMovementsProvider).roomObjectId;
}

String _$roomObjectMovementHash() =>
    r'1fff2f174a61b32bb5ae9b92783fe452ad0592a1';

/// Provide a single room object movement.
///
/// Copied from [roomObjectMovement].
@ProviderFor(roomObjectMovement)
const roomObjectMovementProvider = RoomObjectMovementFamily();

/// Provide a single room object movement.
///
/// Copied from [roomObjectMovement].
class RoomObjectMovementFamily extends Family<AsyncValue<RoomObjectMovement>> {
  /// Provide a single room object movement.
  ///
  /// Copied from [roomObjectMovement].
  const RoomObjectMovementFamily();

  /// Provide a single room object movement.
  ///
  /// Copied from [roomObjectMovement].
  RoomObjectMovementProvider call(
    int id,
  ) {
    return RoomObjectMovementProvider(
      id,
    );
  }

  @override
  RoomObjectMovementProvider getProviderOverride(
    covariant RoomObjectMovementProvider provider,
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
  String? get name => r'roomObjectMovementProvider';
}

/// Provide a single room object movement.
///
/// Copied from [roomObjectMovement].
class RoomObjectMovementProvider
    extends AutoDisposeFutureProvider<RoomObjectMovement> {
  /// Provide a single room object movement.
  ///
  /// Copied from [roomObjectMovement].
  RoomObjectMovementProvider(
    int id,
  ) : this._internal(
          (ref) => roomObjectMovement(
            ref as RoomObjectMovementRef,
            id,
          ),
          from: roomObjectMovementProvider,
          name: r'roomObjectMovementProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$roomObjectMovementHash,
          dependencies: RoomObjectMovementFamily._dependencies,
          allTransitiveDependencies:
              RoomObjectMovementFamily._allTransitiveDependencies,
          id: id,
        );

  RoomObjectMovementProvider._internal(
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
    FutureOr<RoomObjectMovement> Function(RoomObjectMovementRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RoomObjectMovementProvider._internal(
        (ref) => create(ref as RoomObjectMovementRef),
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
  AutoDisposeFutureProviderElement<RoomObjectMovement> createElement() {
    return _RoomObjectMovementProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RoomObjectMovementProvider && other.id == id;
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
mixin RoomObjectMovementRef
    on AutoDisposeFutureProviderRef<RoomObjectMovement> {
  /// The parameter `id` of this provider.
  int get id;
}

class _RoomObjectMovementProviderElement
    extends AutoDisposeFutureProviderElement<RoomObjectMovement>
    with RoomObjectMovementRef {
  _RoomObjectMovementProviderElement(super.provider);

  @override
  int get id => (origin as RoomObjectMovementProvider).id;
}

String _$objectMovementsInRoomHash() =>
    r'09ffb85af3445796120905e4a661aadc45e6e7e1';

/// Provide all the room object movements in a given room.
///
/// Copied from [objectMovementsInRoom].
@ProviderFor(objectMovementsInRoom)
const objectMovementsInRoomProvider = ObjectMovementsInRoomFamily();

/// Provide all the room object movements in a given room.
///
/// Copied from [objectMovementsInRoom].
class ObjectMovementsInRoomFamily
    extends Family<AsyncValue<List<List<RoomObjectMovement>>>> {
  /// Provide all the room object movements in a given room.
  ///
  /// Copied from [objectMovementsInRoom].
  const ObjectMovementsInRoomFamily();

  /// Provide all the room object movements in a given room.
  ///
  /// Copied from [objectMovementsInRoom].
  ObjectMovementsInRoomProvider call(
    int roomId,
  ) {
    return ObjectMovementsInRoomProvider(
      roomId,
    );
  }

  @override
  ObjectMovementsInRoomProvider getProviderOverride(
    covariant ObjectMovementsInRoomProvider provider,
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
  String? get name => r'objectMovementsInRoomProvider';
}

/// Provide all the room object movements in a given room.
///
/// Copied from [objectMovementsInRoom].
class ObjectMovementsInRoomProvider
    extends AutoDisposeFutureProvider<List<List<RoomObjectMovement>>> {
  /// Provide all the room object movements in a given room.
  ///
  /// Copied from [objectMovementsInRoom].
  ObjectMovementsInRoomProvider(
    int roomId,
  ) : this._internal(
          (ref) => objectMovementsInRoom(
            ref as ObjectMovementsInRoomRef,
            roomId,
          ),
          from: objectMovementsInRoomProvider,
          name: r'objectMovementsInRoomProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$objectMovementsInRoomHash,
          dependencies: ObjectMovementsInRoomFamily._dependencies,
          allTransitiveDependencies:
              ObjectMovementsInRoomFamily._allTransitiveDependencies,
          roomId: roomId,
        );

  ObjectMovementsInRoomProvider._internal(
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
    FutureOr<List<List<RoomObjectMovement>>> Function(
            ObjectMovementsInRoomRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ObjectMovementsInRoomProvider._internal(
        (ref) => create(ref as ObjectMovementsInRoomRef),
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
  AutoDisposeFutureProviderElement<List<List<RoomObjectMovement>>>
      createElement() {
    return _ObjectMovementsInRoomProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ObjectMovementsInRoomProvider && other.roomId == roomId;
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
mixin ObjectMovementsInRoomRef
    on AutoDisposeFutureProviderRef<List<List<RoomObjectMovement>>> {
  /// The parameter `roomId` of this provider.
  int get roomId;
}

class _ObjectMovementsInRoomProviderElement
    extends AutoDisposeFutureProviderElement<List<List<RoomObjectMovement>>>
    with ObjectMovementsInRoomRef {
  _ObjectMovementsInRoomProviderElement(super.provider);

  @override
  int get roomId => (origin as ObjectMovementsInRoomProvider).roomId;
}

String _$commandGameStatsHash() => r'72dde2a97a012b59c53698c2e354729d42100516';

/// Provide all game stats for the command with the given [commandId].
///
/// Copied from [commandGameStats].
@ProviderFor(commandGameStats)
const commandGameStatsProvider = CommandGameStatsFamily();

/// Provide all game stats for the command with the given [commandId].
///
/// Copied from [commandGameStats].
class CommandGameStatsFamily extends Family<AsyncValue<List<CommandGameStat>>> {
  /// Provide all game stats for the command with the given [commandId].
  ///
  /// Copied from [commandGameStats].
  const CommandGameStatsFamily();

  /// Provide all game stats for the command with the given [commandId].
  ///
  /// Copied from [commandGameStats].
  CommandGameStatsProvider call(
    int commandId,
  ) {
    return CommandGameStatsProvider(
      commandId,
    );
  }

  @override
  CommandGameStatsProvider getProviderOverride(
    covariant CommandGameStatsProvider provider,
  ) {
    return call(
      provider.commandId,
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
  String? get name => r'commandGameStatsProvider';
}

/// Provide all game stats for the command with the given [commandId].
///
/// Copied from [commandGameStats].
class CommandGameStatsProvider
    extends AutoDisposeFutureProvider<List<CommandGameStat>> {
  /// Provide all game stats for the command with the given [commandId].
  ///
  /// Copied from [commandGameStats].
  CommandGameStatsProvider(
    int commandId,
  ) : this._internal(
          (ref) => commandGameStats(
            ref as CommandGameStatsRef,
            commandId,
          ),
          from: commandGameStatsProvider,
          name: r'commandGameStatsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commandGameStatsHash,
          dependencies: CommandGameStatsFamily._dependencies,
          allTransitiveDependencies:
              CommandGameStatsFamily._allTransitiveDependencies,
          commandId: commandId,
        );

  CommandGameStatsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.commandId,
  }) : super.internal();

  final int commandId;

  @override
  Override overrideWith(
    FutureOr<List<CommandGameStat>> Function(CommandGameStatsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CommandGameStatsProvider._internal(
        (ref) => create(ref as CommandGameStatsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        commandId: commandId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CommandGameStat>> createElement() {
    return _CommandGameStatsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommandGameStatsProvider && other.commandId == commandId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, commandId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CommandGameStatsRef
    on AutoDisposeFutureProviderRef<List<CommandGameStat>> {
  /// The parameter `commandId` of this provider.
  int get commandId;
}

class _CommandGameStatsProviderElement
    extends AutoDisposeFutureProviderElement<List<CommandGameStat>>
    with CommandGameStatsRef {
  _CommandGameStatsProviderElement(super.provider);

  @override
  int get commandId => (origin as CommandGameStatsProvider).commandId;
}

String _$questsHash() => r'7cb3009c86f3d70cddbfcff402f0cce83a41a106';

/// Provides all quests.
///
/// Copied from [quests].
@ProviderFor(quests)
final questsProvider = AutoDisposeFutureProvider<List<Quest>>.internal(
  quests,
  name: r'questsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$questsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef QuestsRef = AutoDisposeFutureProviderRef<List<Quest>>;
String _$questStagesHash() => r'58480716144600ba5cea83e843be397166b80c8a';

/// Provide quest stages.
///
/// Copied from [questStages].
@ProviderFor(questStages)
const questStagesProvider = QuestStagesFamily();

/// Provide quest stages.
///
/// Copied from [questStages].
class QuestStagesFamily extends Family<AsyncValue<List<QuestStage>>> {
  /// Provide quest stages.
  ///
  /// Copied from [questStages].
  const QuestStagesFamily();

  /// Provide quest stages.
  ///
  /// Copied from [questStages].
  QuestStagesProvider call(
    int questId,
  ) {
    return QuestStagesProvider(
      questId,
    );
  }

  @override
  QuestStagesProvider getProviderOverride(
    covariant QuestStagesProvider provider,
  ) {
    return call(
      provider.questId,
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
  String? get name => r'questStagesProvider';
}

/// Provide quest stages.
///
/// Copied from [questStages].
class QuestStagesProvider extends AutoDisposeFutureProvider<List<QuestStage>> {
  /// Provide quest stages.
  ///
  /// Copied from [questStages].
  QuestStagesProvider(
    int questId,
  ) : this._internal(
          (ref) => questStages(
            ref as QuestStagesRef,
            questId,
          ),
          from: questStagesProvider,
          name: r'questStagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$questStagesHash,
          dependencies: QuestStagesFamily._dependencies,
          allTransitiveDependencies:
              QuestStagesFamily._allTransitiveDependencies,
          questId: questId,
        );

  QuestStagesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.questId,
  }) : super.internal();

  final int questId;

  @override
  Override overrideWith(
    FutureOr<List<QuestStage>> Function(QuestStagesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: QuestStagesProvider._internal(
        (ref) => create(ref as QuestStagesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        questId: questId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<QuestStage>> createElement() {
    return _QuestStagesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuestStagesProvider && other.questId == questId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, questId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin QuestStagesRef on AutoDisposeFutureProviderRef<List<QuestStage>> {
  /// The parameter `questId` of this provider.
  int get questId;
}

class _QuestStagesProviderElement
    extends AutoDisposeFutureProviderElement<List<QuestStage>>
    with QuestStagesRef {
  _QuestStagesProviderElement(super.provider);

  @override
  int get questId => (origin as QuestStagesProvider).questId;
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
