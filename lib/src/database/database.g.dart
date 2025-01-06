// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $SoundReferencesTable extends SoundReferences
    with TableInfo<$SoundReferencesTable, SoundReference> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SoundReferencesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
      'path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _volumeMeta = const VerificationMeta('volume');
  @override
  late final GeneratedColumn<double> volume = GeneratedColumn<double>(
      'volume', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.7));
  @override
  List<GeneratedColumn> get $columns => [id, path, volume];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sound_references';
  @override
  VerificationContext validateIntegrity(Insertable<SoundReference> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('volume')) {
      context.handle(_volumeMeta,
          volume.isAcceptableOrUnknown(data['volume']!, _volumeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SoundReference map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SoundReference(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      path: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}path'])!,
      volume: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}volume'])!,
    );
  }

  @override
  $SoundReferencesTable createAlias(String alias) {
    return $SoundReferencesTable(attachedDatabase, alias);
  }
}

class SoundReference extends DataClass implements Insertable<SoundReference> {
  /// The primary key field.
  final int id;

  /// The path to the sound.
  final String path;

  /// The volume of the sound.
  final double volume;
  const SoundReference(
      {required this.id, required this.path, required this.volume});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['path'] = Variable<String>(path);
    map['volume'] = Variable<double>(volume);
    return map;
  }

  SoundReferencesCompanion toCompanion(bool nullToAbsent) {
    return SoundReferencesCompanion(
      id: Value(id),
      path: Value(path),
      volume: Value(volume),
    );
  }

  factory SoundReference.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SoundReference(
      id: serializer.fromJson<int>(json['id']),
      path: serializer.fromJson<String>(json['path']),
      volume: serializer.fromJson<double>(json['volume']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'path': serializer.toJson<String>(path),
      'volume': serializer.toJson<double>(volume),
    };
  }

  SoundReference copyWith({int? id, String? path, double? volume}) =>
      SoundReference(
        id: id ?? this.id,
        path: path ?? this.path,
        volume: volume ?? this.volume,
      );
  SoundReference copyWithCompanion(SoundReferencesCompanion data) {
    return SoundReference(
      id: data.id.present ? data.id.value : this.id,
      path: data.path.present ? data.path.value : this.path,
      volume: data.volume.present ? data.volume.value : this.volume,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SoundReference(')
          ..write('id: $id, ')
          ..write('path: $path, ')
          ..write('volume: $volume')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, path, volume);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SoundReference &&
          other.id == this.id &&
          other.path == this.path &&
          other.volume == this.volume);
}

class SoundReferencesCompanion extends UpdateCompanion<SoundReference> {
  final Value<int> id;
  final Value<String> path;
  final Value<double> volume;
  const SoundReferencesCompanion({
    this.id = const Value.absent(),
    this.path = const Value.absent(),
    this.volume = const Value.absent(),
  });
  SoundReferencesCompanion.insert({
    this.id = const Value.absent(),
    required String path,
    this.volume = const Value.absent(),
  }) : path = Value(path);
  static Insertable<SoundReference> custom({
    Expression<int>? id,
    Expression<String>? path,
    Expression<double>? volume,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (path != null) 'path': path,
      if (volume != null) 'volume': volume,
    });
  }

  SoundReferencesCompanion copyWith(
      {Value<int>? id, Value<String>? path, Value<double>? volume}) {
    return SoundReferencesCompanion(
      id: id ?? this.id,
      path: path ?? this.path,
      volume: volume ?? this.volume,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (volume.present) {
      map['volume'] = Variable<double>(volume.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SoundReferencesCompanion(')
          ..write('id: $id, ')
          ..write('path: $path, ')
          ..write('volume: $volume')
          ..write(')'))
        .toString();
  }
}

class $ZonesTable extends Zones with TableInfo<$ZonesTable, Zone> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ZonesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _musicIdMeta =
      const VerificationMeta('musicId');
  @override
  late final GeneratedColumn<int> musicId = GeneratedColumn<int>(
      'music_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sound_references (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, name, createdAt, musicId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'zones';
  @override
  VerificationContext validateIntegrity(Insertable<Zone> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('music_id')) {
      context.handle(_musicIdMeta,
          musicId.isAcceptableOrUnknown(data['music_id']!, _musicIdMeta));
    } else if (isInserting) {
      context.missing(_musicIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Zone map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Zone(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      musicId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}music_id'])!,
    );
  }

  @override
  $ZonesTable createAlias(String alias) {
    return $ZonesTable(attachedDatabase, alias);
  }
}

class Zone extends DataClass implements Insertable<Zone> {
  /// The primary key field.
  final int id;

  /// The name column.
  final String name;

  /// The created at column.
  final DateTime createdAt;

  /// The ID of the music this zone will play.
  final int musicId;
  const Zone(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.musicId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['music_id'] = Variable<int>(musicId);
    return map;
  }

  ZonesCompanion toCompanion(bool nullToAbsent) {
    return ZonesCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
      musicId: Value(musicId),
    );
  }

  factory Zone.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Zone(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      musicId: serializer.fromJson<int>(json['musicId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'musicId': serializer.toJson<int>(musicId),
    };
  }

  Zone copyWith({int? id, String? name, DateTime? createdAt, int? musicId}) =>
      Zone(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        musicId: musicId ?? this.musicId,
      );
  Zone copyWithCompanion(ZonesCompanion data) {
    return Zone(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      musicId: data.musicId.present ? data.musicId.value : this.musicId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Zone(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('musicId: $musicId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt, musicId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Zone &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.musicId == this.musicId);
}

class ZonesCompanion extends UpdateCompanion<Zone> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<int> musicId;
  const ZonesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.musicId = const Value.absent(),
  });
  ZonesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdAt = const Value.absent(),
    required int musicId,
  })  : name = Value(name),
        musicId = Value(musicId);
  static Insertable<Zone> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<int>? musicId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (musicId != null) 'music_id': musicId,
    });
  }

  ZonesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? createdAt,
      Value<int>? musicId}) {
    return ZonesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      musicId: musicId ?? this.musicId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (musicId.present) {
      map['music_id'] = Variable<int>(musicId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ZonesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('musicId: $musicId')
          ..write(')'))
        .toString();
  }
}

class $RoomsTable extends Rooms with TableInfo<$RoomsTable, Room> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _zoneIdMeta = const VerificationMeta('zoneId');
  @override
  late final GeneratedColumn<int> zoneId = GeneratedColumn<int>(
      'zone_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES zones (id)'));
  static const VerificationMeta _ambianceIdMeta =
      const VerificationMeta('ambianceId');
  @override
  late final GeneratedColumn<int> ambianceId = GeneratedColumn<int>(
      'ambiance_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sound_references (id)'));
  static const VerificationMeta _maxXMeta = const VerificationMeta('maxX');
  @override
  late final GeneratedColumn<int> maxX = GeneratedColumn<int>(
      'max_x', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(20));
  static const VerificationMeta _maxYMeta = const VerificationMeta('maxY');
  @override
  late final GeneratedColumn<int> maxY = GeneratedColumn<int>(
      'max_y', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(15));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, createdAt, zoneId, ambianceId, maxX, maxY];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rooms';
  @override
  VerificationContext validateIntegrity(Insertable<Room> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('zone_id')) {
      context.handle(_zoneIdMeta,
          zoneId.isAcceptableOrUnknown(data['zone_id']!, _zoneIdMeta));
    } else if (isInserting) {
      context.missing(_zoneIdMeta);
    }
    if (data.containsKey('ambiance_id')) {
      context.handle(
          _ambianceIdMeta,
          ambianceId.isAcceptableOrUnknown(
              data['ambiance_id']!, _ambianceIdMeta));
    }
    if (data.containsKey('max_x')) {
      context.handle(
          _maxXMeta, maxX.isAcceptableOrUnknown(data['max_x']!, _maxXMeta));
    }
    if (data.containsKey('max_y')) {
      context.handle(
          _maxYMeta, maxY.isAcceptableOrUnknown(data['max_y']!, _maxYMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Room map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Room(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      zoneId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}zone_id'])!,
      ambianceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ambiance_id']),
      maxX: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_x'])!,
      maxY: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_y'])!,
    );
  }

  @override
  $RoomsTable createAlias(String alias) {
    return $RoomsTable(attachedDatabase, alias);
  }
}

class Room extends DataClass implements Insertable<Room> {
  /// The primary key field.
  final int id;

  /// The name column.
  final String name;

  /// The created at column.
  final DateTime createdAt;

  /// The ID of the zone which this room belongs to.
  final int zoneId;

  /// The ID of the ambiance for this room.
  final int? ambianceId;

  /// The maximum x coordinate.
  final int maxX;

  /// The maximum y coordinate.
  final int maxY;
  const Room(
      {required this.id,
      required this.name,
      required this.createdAt,
      required this.zoneId,
      this.ambianceId,
      required this.maxX,
      required this.maxY});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['zone_id'] = Variable<int>(zoneId);
    if (!nullToAbsent || ambianceId != null) {
      map['ambiance_id'] = Variable<int>(ambianceId);
    }
    map['max_x'] = Variable<int>(maxX);
    map['max_y'] = Variable<int>(maxY);
    return map;
  }

  RoomsCompanion toCompanion(bool nullToAbsent) {
    return RoomsCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
      zoneId: Value(zoneId),
      ambianceId: ambianceId == null && nullToAbsent
          ? const Value.absent()
          : Value(ambianceId),
      maxX: Value(maxX),
      maxY: Value(maxY),
    );
  }

  factory Room.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Room(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      zoneId: serializer.fromJson<int>(json['zoneId']),
      ambianceId: serializer.fromJson<int?>(json['ambianceId']),
      maxX: serializer.fromJson<int>(json['maxX']),
      maxY: serializer.fromJson<int>(json['maxY']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'zoneId': serializer.toJson<int>(zoneId),
      'ambianceId': serializer.toJson<int?>(ambianceId),
      'maxX': serializer.toJson<int>(maxX),
      'maxY': serializer.toJson<int>(maxY),
    };
  }

  Room copyWith(
          {int? id,
          String? name,
          DateTime? createdAt,
          int? zoneId,
          Value<int?> ambianceId = const Value.absent(),
          int? maxX,
          int? maxY}) =>
      Room(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        zoneId: zoneId ?? this.zoneId,
        ambianceId: ambianceId.present ? ambianceId.value : this.ambianceId,
        maxX: maxX ?? this.maxX,
        maxY: maxY ?? this.maxY,
      );
  Room copyWithCompanion(RoomsCompanion data) {
    return Room(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      zoneId: data.zoneId.present ? data.zoneId.value : this.zoneId,
      ambianceId:
          data.ambianceId.present ? data.ambianceId.value : this.ambianceId,
      maxX: data.maxX.present ? data.maxX.value : this.maxX,
      maxY: data.maxY.present ? data.maxY.value : this.maxY,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Room(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('zoneId: $zoneId, ')
          ..write('ambianceId: $ambianceId, ')
          ..write('maxX: $maxX, ')
          ..write('maxY: $maxY')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, createdAt, zoneId, ambianceId, maxX, maxY);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Room &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.zoneId == this.zoneId &&
          other.ambianceId == this.ambianceId &&
          other.maxX == this.maxX &&
          other.maxY == this.maxY);
}

class RoomsCompanion extends UpdateCompanion<Room> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<int> zoneId;
  final Value<int?> ambianceId;
  final Value<int> maxX;
  final Value<int> maxY;
  const RoomsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.zoneId = const Value.absent(),
    this.ambianceId = const Value.absent(),
    this.maxX = const Value.absent(),
    this.maxY = const Value.absent(),
  });
  RoomsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdAt = const Value.absent(),
    required int zoneId,
    this.ambianceId = const Value.absent(),
    this.maxX = const Value.absent(),
    this.maxY = const Value.absent(),
  })  : name = Value(name),
        zoneId = Value(zoneId);
  static Insertable<Room> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<int>? zoneId,
    Expression<int>? ambianceId,
    Expression<int>? maxX,
    Expression<int>? maxY,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (zoneId != null) 'zone_id': zoneId,
      if (ambianceId != null) 'ambiance_id': ambianceId,
      if (maxX != null) 'max_x': maxX,
      if (maxY != null) 'max_y': maxY,
    });
  }

  RoomsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? createdAt,
      Value<int>? zoneId,
      Value<int?>? ambianceId,
      Value<int>? maxX,
      Value<int>? maxY}) {
    return RoomsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      zoneId: zoneId ?? this.zoneId,
      ambianceId: ambianceId ?? this.ambianceId,
      maxX: maxX ?? this.maxX,
      maxY: maxY ?? this.maxY,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (zoneId.present) {
      map['zone_id'] = Variable<int>(zoneId.value);
    }
    if (ambianceId.present) {
      map['ambiance_id'] = Variable<int>(ambianceId.value);
    }
    if (maxX.present) {
      map['max_x'] = Variable<int>(maxX.value);
    }
    if (maxY.present) {
      map['max_y'] = Variable<int>(maxY.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('zoneId: $zoneId, ')
          ..write('ambianceId: $ambianceId, ')
          ..write('maxX: $maxX, ')
          ..write('maxY: $maxY')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SoundReferencesTable soundReferences =
      $SoundReferencesTable(this);
  late final $ZonesTable zones = $ZonesTable(this);
  late final $RoomsTable rooms = $RoomsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [soundReferences, zones, rooms];
}

typedef $$SoundReferencesTableCreateCompanionBuilder = SoundReferencesCompanion
    Function({
  Value<int> id,
  required String path,
  Value<double> volume,
});
typedef $$SoundReferencesTableUpdateCompanionBuilder = SoundReferencesCompanion
    Function({
  Value<int> id,
  Value<String> path,
  Value<double> volume,
});

final class $$SoundReferencesTableReferences extends BaseReferences<
    _$AppDatabase, $SoundReferencesTable, SoundReference> {
  $$SoundReferencesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ZonesTable, List<Zone>> _zonesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.zones,
          aliasName:
              $_aliasNameGenerator(db.soundReferences.id, db.zones.musicId));

  $$ZonesTableProcessedTableManager get zonesRefs {
    final manager = $$ZonesTableTableManager($_db, $_db.zones)
        .filter((f) => f.musicId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_zonesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RoomsTable, List<Room>> _roomsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.rooms,
          aliasName:
              $_aliasNameGenerator(db.soundReferences.id, db.rooms.ambianceId));

  $$RoomsTableProcessedTableManager get roomsRefs {
    final manager = $$RoomsTableTableManager($_db, $_db.rooms)
        .filter((f) => f.ambianceId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_roomsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$SoundReferencesTableFilterComposer
    extends Composer<_$AppDatabase, $SoundReferencesTable> {
  $$SoundReferencesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get path => $composableBuilder(
      column: $table.path, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get volume => $composableBuilder(
      column: $table.volume, builder: (column) => ColumnFilters(column));

  Expression<bool> zonesRefs(
      Expression<bool> Function($$ZonesTableFilterComposer f) f) {
    final $$ZonesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.zones,
        getReferencedColumn: (t) => t.musicId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ZonesTableFilterComposer(
              $db: $db,
              $table: $db.zones,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> roomsRefs(
      Expression<bool> Function($$RoomsTableFilterComposer f) f) {
    final $$RoomsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.rooms,
        getReferencedColumn: (t) => t.ambianceId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomsTableFilterComposer(
              $db: $db,
              $table: $db.rooms,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SoundReferencesTableOrderingComposer
    extends Composer<_$AppDatabase, $SoundReferencesTable> {
  $$SoundReferencesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get path => $composableBuilder(
      column: $table.path, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get volume => $composableBuilder(
      column: $table.volume, builder: (column) => ColumnOrderings(column));
}

class $$SoundReferencesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SoundReferencesTable> {
  $$SoundReferencesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  GeneratedColumn<double> get volume =>
      $composableBuilder(column: $table.volume, builder: (column) => column);

  Expression<T> zonesRefs<T extends Object>(
      Expression<T> Function($$ZonesTableAnnotationComposer a) f) {
    final $$ZonesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.zones,
        getReferencedColumn: (t) => t.musicId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ZonesTableAnnotationComposer(
              $db: $db,
              $table: $db.zones,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> roomsRefs<T extends Object>(
      Expression<T> Function($$RoomsTableAnnotationComposer a) f) {
    final $$RoomsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.rooms,
        getReferencedColumn: (t) => t.ambianceId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomsTableAnnotationComposer(
              $db: $db,
              $table: $db.rooms,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SoundReferencesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SoundReferencesTable,
    SoundReference,
    $$SoundReferencesTableFilterComposer,
    $$SoundReferencesTableOrderingComposer,
    $$SoundReferencesTableAnnotationComposer,
    $$SoundReferencesTableCreateCompanionBuilder,
    $$SoundReferencesTableUpdateCompanionBuilder,
    (SoundReference, $$SoundReferencesTableReferences),
    SoundReference,
    PrefetchHooks Function({bool zonesRefs, bool roomsRefs})> {
  $$SoundReferencesTableTableManager(
      _$AppDatabase db, $SoundReferencesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SoundReferencesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SoundReferencesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SoundReferencesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> path = const Value.absent(),
            Value<double> volume = const Value.absent(),
          }) =>
              SoundReferencesCompanion(
            id: id,
            path: path,
            volume: volume,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String path,
            Value<double> volume = const Value.absent(),
          }) =>
              SoundReferencesCompanion.insert(
            id: id,
            path: path,
            volume: volume,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SoundReferencesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({zonesRefs = false, roomsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (zonesRefs) db.zones,
                if (roomsRefs) db.rooms
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (zonesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$SoundReferencesTableReferences
                            ._zonesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SoundReferencesTableReferences(db, table, p0)
                                .zonesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.musicId == item.id),
                        typedResults: items),
                  if (roomsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$SoundReferencesTableReferences
                            ._roomsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SoundReferencesTableReferences(db, table, p0)
                                .roomsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.ambianceId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$SoundReferencesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SoundReferencesTable,
    SoundReference,
    $$SoundReferencesTableFilterComposer,
    $$SoundReferencesTableOrderingComposer,
    $$SoundReferencesTableAnnotationComposer,
    $$SoundReferencesTableCreateCompanionBuilder,
    $$SoundReferencesTableUpdateCompanionBuilder,
    (SoundReference, $$SoundReferencesTableReferences),
    SoundReference,
    PrefetchHooks Function({bool zonesRefs, bool roomsRefs})>;
typedef $$ZonesTableCreateCompanionBuilder = ZonesCompanion Function({
  Value<int> id,
  required String name,
  Value<DateTime> createdAt,
  required int musicId,
});
typedef $$ZonesTableUpdateCompanionBuilder = ZonesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> createdAt,
  Value<int> musicId,
});

final class $$ZonesTableReferences
    extends BaseReferences<_$AppDatabase, $ZonesTable, Zone> {
  $$ZonesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SoundReferencesTable _musicIdTable(_$AppDatabase db) =>
      db.soundReferences.createAlias(
          $_aliasNameGenerator(db.zones.musicId, db.soundReferences.id));

  $$SoundReferencesTableProcessedTableManager get musicId {
    final manager =
        $$SoundReferencesTableTableManager($_db, $_db.soundReferences)
            .filter((f) => f.id($_item.musicId));
    final item = $_typedResult.readTableOrNull(_musicIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$RoomsTable, List<Room>> _roomsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.rooms,
          aliasName: $_aliasNameGenerator(db.zones.id, db.rooms.zoneId));

  $$RoomsTableProcessedTableManager get roomsRefs {
    final manager = $$RoomsTableTableManager($_db, $_db.rooms)
        .filter((f) => f.zoneId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_roomsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ZonesTableFilterComposer extends Composer<_$AppDatabase, $ZonesTable> {
  $$ZonesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$SoundReferencesTableFilterComposer get musicId {
    final $$SoundReferencesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.musicId,
        referencedTable: $db.soundReferences,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SoundReferencesTableFilterComposer(
              $db: $db,
              $table: $db.soundReferences,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> roomsRefs(
      Expression<bool> Function($$RoomsTableFilterComposer f) f) {
    final $$RoomsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.rooms,
        getReferencedColumn: (t) => t.zoneId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomsTableFilterComposer(
              $db: $db,
              $table: $db.rooms,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ZonesTableOrderingComposer
    extends Composer<_$AppDatabase, $ZonesTable> {
  $$ZonesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$SoundReferencesTableOrderingComposer get musicId {
    final $$SoundReferencesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.musicId,
        referencedTable: $db.soundReferences,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SoundReferencesTableOrderingComposer(
              $db: $db,
              $table: $db.soundReferences,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ZonesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ZonesTable> {
  $$ZonesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$SoundReferencesTableAnnotationComposer get musicId {
    final $$SoundReferencesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.musicId,
        referencedTable: $db.soundReferences,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SoundReferencesTableAnnotationComposer(
              $db: $db,
              $table: $db.soundReferences,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> roomsRefs<T extends Object>(
      Expression<T> Function($$RoomsTableAnnotationComposer a) f) {
    final $$RoomsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.rooms,
        getReferencedColumn: (t) => t.zoneId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomsTableAnnotationComposer(
              $db: $db,
              $table: $db.rooms,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ZonesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ZonesTable,
    Zone,
    $$ZonesTableFilterComposer,
    $$ZonesTableOrderingComposer,
    $$ZonesTableAnnotationComposer,
    $$ZonesTableCreateCompanionBuilder,
    $$ZonesTableUpdateCompanionBuilder,
    (Zone, $$ZonesTableReferences),
    Zone,
    PrefetchHooks Function({bool musicId, bool roomsRefs})> {
  $$ZonesTableTableManager(_$AppDatabase db, $ZonesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ZonesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ZonesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ZonesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> musicId = const Value.absent(),
          }) =>
              ZonesCompanion(
            id: id,
            name: name,
            createdAt: createdAt,
            musicId: musicId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime> createdAt = const Value.absent(),
            required int musicId,
          }) =>
              ZonesCompanion.insert(
            id: id,
            name: name,
            createdAt: createdAt,
            musicId: musicId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ZonesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({musicId = false, roomsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (roomsRefs) db.rooms],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (musicId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.musicId,
                    referencedTable: $$ZonesTableReferences._musicIdTable(db),
                    referencedColumn:
                        $$ZonesTableReferences._musicIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (roomsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$ZonesTableReferences._roomsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ZonesTableReferences(db, table, p0).roomsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.zoneId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ZonesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ZonesTable,
    Zone,
    $$ZonesTableFilterComposer,
    $$ZonesTableOrderingComposer,
    $$ZonesTableAnnotationComposer,
    $$ZonesTableCreateCompanionBuilder,
    $$ZonesTableUpdateCompanionBuilder,
    (Zone, $$ZonesTableReferences),
    Zone,
    PrefetchHooks Function({bool musicId, bool roomsRefs})>;
typedef $$RoomsTableCreateCompanionBuilder = RoomsCompanion Function({
  Value<int> id,
  required String name,
  Value<DateTime> createdAt,
  required int zoneId,
  Value<int?> ambianceId,
  Value<int> maxX,
  Value<int> maxY,
});
typedef $$RoomsTableUpdateCompanionBuilder = RoomsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> createdAt,
  Value<int> zoneId,
  Value<int?> ambianceId,
  Value<int> maxX,
  Value<int> maxY,
});

final class $$RoomsTableReferences
    extends BaseReferences<_$AppDatabase, $RoomsTable, Room> {
  $$RoomsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ZonesTable _zoneIdTable(_$AppDatabase db) =>
      db.zones.createAlias($_aliasNameGenerator(db.rooms.zoneId, db.zones.id));

  $$ZonesTableProcessedTableManager get zoneId {
    final manager = $$ZonesTableTableManager($_db, $_db.zones)
        .filter((f) => f.id($_item.zoneId));
    final item = $_typedResult.readTableOrNull(_zoneIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SoundReferencesTable _ambianceIdTable(_$AppDatabase db) =>
      db.soundReferences.createAlias(
          $_aliasNameGenerator(db.rooms.ambianceId, db.soundReferences.id));

  $$SoundReferencesTableProcessedTableManager? get ambianceId {
    if ($_item.ambianceId == null) return null;
    final manager =
        $$SoundReferencesTableTableManager($_db, $_db.soundReferences)
            .filter((f) => f.id($_item.ambianceId!));
    final item = $_typedResult.readTableOrNull(_ambianceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RoomsTableFilterComposer extends Composer<_$AppDatabase, $RoomsTable> {
  $$RoomsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxX => $composableBuilder(
      column: $table.maxX, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxY => $composableBuilder(
      column: $table.maxY, builder: (column) => ColumnFilters(column));

  $$ZonesTableFilterComposer get zoneId {
    final $$ZonesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.zoneId,
        referencedTable: $db.zones,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ZonesTableFilterComposer(
              $db: $db,
              $table: $db.zones,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SoundReferencesTableFilterComposer get ambianceId {
    final $$SoundReferencesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ambianceId,
        referencedTable: $db.soundReferences,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SoundReferencesTableFilterComposer(
              $db: $db,
              $table: $db.soundReferences,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RoomsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoomsTable> {
  $$RoomsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxX => $composableBuilder(
      column: $table.maxX, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxY => $composableBuilder(
      column: $table.maxY, builder: (column) => ColumnOrderings(column));

  $$ZonesTableOrderingComposer get zoneId {
    final $$ZonesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.zoneId,
        referencedTable: $db.zones,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ZonesTableOrderingComposer(
              $db: $db,
              $table: $db.zones,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SoundReferencesTableOrderingComposer get ambianceId {
    final $$SoundReferencesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ambianceId,
        referencedTable: $db.soundReferences,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SoundReferencesTableOrderingComposer(
              $db: $db,
              $table: $db.soundReferences,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RoomsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoomsTable> {
  $$RoomsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get maxX =>
      $composableBuilder(column: $table.maxX, builder: (column) => column);

  GeneratedColumn<int> get maxY =>
      $composableBuilder(column: $table.maxY, builder: (column) => column);

  $$ZonesTableAnnotationComposer get zoneId {
    final $$ZonesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.zoneId,
        referencedTable: $db.zones,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ZonesTableAnnotationComposer(
              $db: $db,
              $table: $db.zones,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SoundReferencesTableAnnotationComposer get ambianceId {
    final $$SoundReferencesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.ambianceId,
        referencedTable: $db.soundReferences,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SoundReferencesTableAnnotationComposer(
              $db: $db,
              $table: $db.soundReferences,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RoomsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoomsTable,
    Room,
    $$RoomsTableFilterComposer,
    $$RoomsTableOrderingComposer,
    $$RoomsTableAnnotationComposer,
    $$RoomsTableCreateCompanionBuilder,
    $$RoomsTableUpdateCompanionBuilder,
    (Room, $$RoomsTableReferences),
    Room,
    PrefetchHooks Function({bool zoneId, bool ambianceId})> {
  $$RoomsTableTableManager(_$AppDatabase db, $RoomsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> zoneId = const Value.absent(),
            Value<int?> ambianceId = const Value.absent(),
            Value<int> maxX = const Value.absent(),
            Value<int> maxY = const Value.absent(),
          }) =>
              RoomsCompanion(
            id: id,
            name: name,
            createdAt: createdAt,
            zoneId: zoneId,
            ambianceId: ambianceId,
            maxX: maxX,
            maxY: maxY,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime> createdAt = const Value.absent(),
            required int zoneId,
            Value<int?> ambianceId = const Value.absent(),
            Value<int> maxX = const Value.absent(),
            Value<int> maxY = const Value.absent(),
          }) =>
              RoomsCompanion.insert(
            id: id,
            name: name,
            createdAt: createdAt,
            zoneId: zoneId,
            ambianceId: ambianceId,
            maxX: maxX,
            maxY: maxY,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$RoomsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({zoneId = false, ambianceId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (zoneId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.zoneId,
                    referencedTable: $$RoomsTableReferences._zoneIdTable(db),
                    referencedColumn:
                        $$RoomsTableReferences._zoneIdTable(db).id,
                  ) as T;
                }
                if (ambianceId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.ambianceId,
                    referencedTable:
                        $$RoomsTableReferences._ambianceIdTable(db),
                    referencedColumn:
                        $$RoomsTableReferences._ambianceIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$RoomsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RoomsTable,
    Room,
    $$RoomsTableFilterComposer,
    $$RoomsTableOrderingComposer,
    $$RoomsTableAnnotationComposer,
    $$RoomsTableCreateCompanionBuilder,
    $$RoomsTableUpdateCompanionBuilder,
    (Room, $$RoomsTableReferences),
    Room,
    PrefetchHooks Function({bool zoneId, bool ambianceId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SoundReferencesTableTableManager get soundReferences =>
      $$SoundReferencesTableTableManager(_db, _db.soundReferences);
  $$ZonesTableTableManager get zones =>
      $$ZonesTableTableManager(_db, _db.zones);
  $$RoomsTableTableManager get rooms =>
      $$RoomsTableTableManager(_db, _db.rooms);
}
