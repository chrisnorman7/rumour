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
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
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
      'music_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sound_references (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, createdAt, musicId];
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
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('music_id')) {
      context.handle(_musicIdMeta,
          musicId.isAcceptableOrUnknown(data['music_id']!, _musicIdMeta));
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
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      musicId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}music_id']),
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

  /// The description column.
  final String description;

  /// The created at column.
  final DateTime createdAt;

  /// The ID of the music this zone will play.
  final int? musicId;
  const Zone(
      {required this.id,
      required this.name,
      required this.description,
      required this.createdAt,
      this.musicId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || musicId != null) {
      map['music_id'] = Variable<int>(musicId);
    }
    return map;
  }

  ZonesCompanion toCompanion(bool nullToAbsent) {
    return ZonesCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      createdAt: Value(createdAt),
      musicId: musicId == null && nullToAbsent
          ? const Value.absent()
          : Value(musicId),
    );
  }

  factory Zone.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Zone(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      musicId: serializer.fromJson<int?>(json['musicId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'musicId': serializer.toJson<int?>(musicId),
    };
  }

  Zone copyWith(
          {int? id,
          String? name,
          String? description,
          DateTime? createdAt,
          Value<int?> musicId = const Value.absent()}) =>
      Zone(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        musicId: musicId.present ? musicId.value : this.musicId,
      );
  Zone copyWithCompanion(ZonesCompanion data) {
    return Zone(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      musicId: data.musicId.present ? data.musicId.value : this.musicId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Zone(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('musicId: $musicId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, createdAt, musicId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Zone &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.musicId == this.musicId);
}

class ZonesCompanion extends UpdateCompanion<Zone> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<DateTime> createdAt;
  final Value<int?> musicId;
  const ZonesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.musicId = const Value.absent(),
  });
  ZonesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    this.createdAt = const Value.absent(),
    this.musicId = const Value.absent(),
  })  : name = Value(name),
        description = Value(description);
  static Insertable<Zone> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<int>? musicId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (musicId != null) 'music_id': musicId,
    });
  }

  ZonesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<DateTime>? createdAt,
      Value<int?>? musicId}) {
    return ZonesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
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
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('musicId: $musicId')
          ..write(')'))
        .toString();
  }
}

class $RoomSurfacesTable extends RoomSurfaces
    with TableInfo<$RoomSurfacesTable, RoomSurface> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomSurfacesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _footstepSoundIdMeta =
      const VerificationMeta('footstepSoundId');
  @override
  late final GeneratedColumn<int> footstepSoundId = GeneratedColumn<int>(
      'footstep_sound_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sound_references (id)'));
  static const VerificationMeta _wallSoundIMeta =
      const VerificationMeta('wallSoundI');
  @override
  late final GeneratedColumn<int> wallSoundI = GeneratedColumn<int>(
      'wall_sound_i', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sound_references (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, footstepSoundId, wallSoundI];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_surfaces';
  @override
  VerificationContext validateIntegrity(Insertable<RoomSurface> instance,
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
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('footstep_sound_id')) {
      context.handle(
          _footstepSoundIdMeta,
          footstepSoundId.isAcceptableOrUnknown(
              data['footstep_sound_id']!, _footstepSoundIdMeta));
    }
    if (data.containsKey('wall_sound_i')) {
      context.handle(
          _wallSoundIMeta,
          wallSoundI.isAcceptableOrUnknown(
              data['wall_sound_i']!, _wallSoundIMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomSurface map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomSurface(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      footstepSoundId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}footstep_sound_id']),
      wallSoundI: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wall_sound_i']),
    );
  }

  @override
  $RoomSurfacesTable createAlias(String alias) {
    return $RoomSurfacesTable(attachedDatabase, alias);
  }
}

class RoomSurface extends DataClass implements Insertable<RoomSurface> {
  /// The primary key field.
  final int id;

  /// The name column.
  final String name;

  /// The description column.
  final String description;

  /// The footstep sound(s) to use.
  final int? footstepSoundId;

  /// The ID of the wall sound to use.
  final int? wallSoundI;
  const RoomSurface(
      {required this.id,
      required this.name,
      required this.description,
      this.footstepSoundId,
      this.wallSoundI});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || footstepSoundId != null) {
      map['footstep_sound_id'] = Variable<int>(footstepSoundId);
    }
    if (!nullToAbsent || wallSoundI != null) {
      map['wall_sound_i'] = Variable<int>(wallSoundI);
    }
    return map;
  }

  RoomSurfacesCompanion toCompanion(bool nullToAbsent) {
    return RoomSurfacesCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      footstepSoundId: footstepSoundId == null && nullToAbsent
          ? const Value.absent()
          : Value(footstepSoundId),
      wallSoundI: wallSoundI == null && nullToAbsent
          ? const Value.absent()
          : Value(wallSoundI),
    );
  }

  factory RoomSurface.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomSurface(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      footstepSoundId: serializer.fromJson<int?>(json['footstepSoundId']),
      wallSoundI: serializer.fromJson<int?>(json['wallSoundI']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'footstepSoundId': serializer.toJson<int?>(footstepSoundId),
      'wallSoundI': serializer.toJson<int?>(wallSoundI),
    };
  }

  RoomSurface copyWith(
          {int? id,
          String? name,
          String? description,
          Value<int?> footstepSoundId = const Value.absent(),
          Value<int?> wallSoundI = const Value.absent()}) =>
      RoomSurface(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        footstepSoundId: footstepSoundId.present
            ? footstepSoundId.value
            : this.footstepSoundId,
        wallSoundI: wallSoundI.present ? wallSoundI.value : this.wallSoundI,
      );
  RoomSurface copyWithCompanion(RoomSurfacesCompanion data) {
    return RoomSurface(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      footstepSoundId: data.footstepSoundId.present
          ? data.footstepSoundId.value
          : this.footstepSoundId,
      wallSoundI:
          data.wallSoundI.present ? data.wallSoundI.value : this.wallSoundI,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoomSurface(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('footstepSoundId: $footstepSoundId, ')
          ..write('wallSoundI: $wallSoundI')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, footstepSoundId, wallSoundI);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomSurface &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.footstepSoundId == this.footstepSoundId &&
          other.wallSoundI == this.wallSoundI);
}

class RoomSurfacesCompanion extends UpdateCompanion<RoomSurface> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int?> footstepSoundId;
  final Value<int?> wallSoundI;
  const RoomSurfacesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.footstepSoundId = const Value.absent(),
    this.wallSoundI = const Value.absent(),
  });
  RoomSurfacesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    this.footstepSoundId = const Value.absent(),
    this.wallSoundI = const Value.absent(),
  })  : name = Value(name),
        description = Value(description);
  static Insertable<RoomSurface> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? footstepSoundId,
    Expression<int>? wallSoundI,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (footstepSoundId != null) 'footstep_sound_id': footstepSoundId,
      if (wallSoundI != null) 'wall_sound_i': wallSoundI,
    });
  }

  RoomSurfacesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<int?>? footstepSoundId,
      Value<int?>? wallSoundI}) {
    return RoomSurfacesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      footstepSoundId: footstepSoundId ?? this.footstepSoundId,
      wallSoundI: wallSoundI ?? this.wallSoundI,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (footstepSoundId.present) {
      map['footstep_sound_id'] = Variable<int>(footstepSoundId.value);
    }
    if (wallSoundI.present) {
      map['wall_sound_i'] = Variable<int>(wallSoundI.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomSurfacesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('footstepSoundId: $footstepSoundId, ')
          ..write('wallSoundI: $wallSoundI')
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
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _ambianceIdMeta =
      const VerificationMeta('ambianceId');
  @override
  late final GeneratedColumn<int> ambianceId = GeneratedColumn<int>(
      'ambiance_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sound_references (id)'));
  static const VerificationMeta _zoneIdMeta = const VerificationMeta('zoneId');
  @override
  late final GeneratedColumn<int> zoneId = GeneratedColumn<int>(
      'zone_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES zones (id)'));
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
  static const VerificationMeta _surfaceIdMeta =
      const VerificationMeta('surfaceId');
  @override
  late final GeneratedColumn<int> surfaceId = GeneratedColumn<int>(
      'surface_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES room_surfaces (id)'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        createdAt,
        ambianceId,
        zoneId,
        maxX,
        maxY,
        surfaceId
      ];
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
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('ambiance_id')) {
      context.handle(
          _ambianceIdMeta,
          ambianceId.isAcceptableOrUnknown(
              data['ambiance_id']!, _ambianceIdMeta));
    }
    if (data.containsKey('zone_id')) {
      context.handle(_zoneIdMeta,
          zoneId.isAcceptableOrUnknown(data['zone_id']!, _zoneIdMeta));
    } else if (isInserting) {
      context.missing(_zoneIdMeta);
    }
    if (data.containsKey('max_x')) {
      context.handle(
          _maxXMeta, maxX.isAcceptableOrUnknown(data['max_x']!, _maxXMeta));
    }
    if (data.containsKey('max_y')) {
      context.handle(
          _maxYMeta, maxY.isAcceptableOrUnknown(data['max_y']!, _maxYMeta));
    }
    if (data.containsKey('surface_id')) {
      context.handle(_surfaceIdMeta,
          surfaceId.isAcceptableOrUnknown(data['surface_id']!, _surfaceIdMeta));
    } else if (isInserting) {
      context.missing(_surfaceIdMeta);
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
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      ambianceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ambiance_id']),
      zoneId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}zone_id'])!,
      maxX: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_x'])!,
      maxY: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_y'])!,
      surfaceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}surface_id'])!,
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

  /// The description column.
  final String description;

  /// The created at column.
  final DateTime createdAt;

  /// The ID of the ambiance for this row.
  final int? ambianceId;

  /// The ID of the zone which this room belongs to.
  final int zoneId;

  /// The maximum x coordinate.
  final int maxX;

  /// The maximum y coordinate.
  final int maxY;

  /// The ID of the surface to use.
  final int surfaceId;
  const Room(
      {required this.id,
      required this.name,
      required this.description,
      required this.createdAt,
      this.ambianceId,
      required this.zoneId,
      required this.maxX,
      required this.maxY,
      required this.surfaceId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || ambianceId != null) {
      map['ambiance_id'] = Variable<int>(ambianceId);
    }
    map['zone_id'] = Variable<int>(zoneId);
    map['max_x'] = Variable<int>(maxX);
    map['max_y'] = Variable<int>(maxY);
    map['surface_id'] = Variable<int>(surfaceId);
    return map;
  }

  RoomsCompanion toCompanion(bool nullToAbsent) {
    return RoomsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      createdAt: Value(createdAt),
      ambianceId: ambianceId == null && nullToAbsent
          ? const Value.absent()
          : Value(ambianceId),
      zoneId: Value(zoneId),
      maxX: Value(maxX),
      maxY: Value(maxY),
      surfaceId: Value(surfaceId),
    );
  }

  factory Room.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Room(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      ambianceId: serializer.fromJson<int?>(json['ambianceId']),
      zoneId: serializer.fromJson<int>(json['zoneId']),
      maxX: serializer.fromJson<int>(json['maxX']),
      maxY: serializer.fromJson<int>(json['maxY']),
      surfaceId: serializer.fromJson<int>(json['surfaceId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'ambianceId': serializer.toJson<int?>(ambianceId),
      'zoneId': serializer.toJson<int>(zoneId),
      'maxX': serializer.toJson<int>(maxX),
      'maxY': serializer.toJson<int>(maxY),
      'surfaceId': serializer.toJson<int>(surfaceId),
    };
  }

  Room copyWith(
          {int? id,
          String? name,
          String? description,
          DateTime? createdAt,
          Value<int?> ambianceId = const Value.absent(),
          int? zoneId,
          int? maxX,
          int? maxY,
          int? surfaceId}) =>
      Room(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        ambianceId: ambianceId.present ? ambianceId.value : this.ambianceId,
        zoneId: zoneId ?? this.zoneId,
        maxX: maxX ?? this.maxX,
        maxY: maxY ?? this.maxY,
        surfaceId: surfaceId ?? this.surfaceId,
      );
  Room copyWithCompanion(RoomsCompanion data) {
    return Room(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      ambianceId:
          data.ambianceId.present ? data.ambianceId.value : this.ambianceId,
      zoneId: data.zoneId.present ? data.zoneId.value : this.zoneId,
      maxX: data.maxX.present ? data.maxX.value : this.maxX,
      maxY: data.maxY.present ? data.maxY.value : this.maxY,
      surfaceId: data.surfaceId.present ? data.surfaceId.value : this.surfaceId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Room(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('ambianceId: $ambianceId, ')
          ..write('zoneId: $zoneId, ')
          ..write('maxX: $maxX, ')
          ..write('maxY: $maxY, ')
          ..write('surfaceId: $surfaceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, createdAt, ambianceId,
      zoneId, maxX, maxY, surfaceId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Room &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.ambianceId == this.ambianceId &&
          other.zoneId == this.zoneId &&
          other.maxX == this.maxX &&
          other.maxY == this.maxY &&
          other.surfaceId == this.surfaceId);
}

class RoomsCompanion extends UpdateCompanion<Room> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<DateTime> createdAt;
  final Value<int?> ambianceId;
  final Value<int> zoneId;
  final Value<int> maxX;
  final Value<int> maxY;
  final Value<int> surfaceId;
  const RoomsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.ambianceId = const Value.absent(),
    this.zoneId = const Value.absent(),
    this.maxX = const Value.absent(),
    this.maxY = const Value.absent(),
    this.surfaceId = const Value.absent(),
  });
  RoomsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    this.createdAt = const Value.absent(),
    this.ambianceId = const Value.absent(),
    required int zoneId,
    this.maxX = const Value.absent(),
    this.maxY = const Value.absent(),
    required int surfaceId,
  })  : name = Value(name),
        description = Value(description),
        zoneId = Value(zoneId),
        surfaceId = Value(surfaceId);
  static Insertable<Room> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<int>? ambianceId,
    Expression<int>? zoneId,
    Expression<int>? maxX,
    Expression<int>? maxY,
    Expression<int>? surfaceId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (ambianceId != null) 'ambiance_id': ambianceId,
      if (zoneId != null) 'zone_id': zoneId,
      if (maxX != null) 'max_x': maxX,
      if (maxY != null) 'max_y': maxY,
      if (surfaceId != null) 'surface_id': surfaceId,
    });
  }

  RoomsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<DateTime>? createdAt,
      Value<int?>? ambianceId,
      Value<int>? zoneId,
      Value<int>? maxX,
      Value<int>? maxY,
      Value<int>? surfaceId}) {
    return RoomsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      ambianceId: ambianceId ?? this.ambianceId,
      zoneId: zoneId ?? this.zoneId,
      maxX: maxX ?? this.maxX,
      maxY: maxY ?? this.maxY,
      surfaceId: surfaceId ?? this.surfaceId,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (ambianceId.present) {
      map['ambiance_id'] = Variable<int>(ambianceId.value);
    }
    if (zoneId.present) {
      map['zone_id'] = Variable<int>(zoneId.value);
    }
    if (maxX.present) {
      map['max_x'] = Variable<int>(maxX.value);
    }
    if (maxY.present) {
      map['max_y'] = Variable<int>(maxY.value);
    }
    if (surfaceId.present) {
      map['surface_id'] = Variable<int>(surfaceId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('ambianceId: $ambianceId, ')
          ..write('zoneId: $zoneId, ')
          ..write('maxX: $maxX, ')
          ..write('maxY: $maxY, ')
          ..write('surfaceId: $surfaceId')
          ..write(')'))
        .toString();
  }
}

class $RoomObjectsTable extends RoomObjects
    with TableInfo<$RoomObjectsTable, RoomObject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomObjectsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ambianceIdMeta =
      const VerificationMeta('ambianceId');
  @override
  late final GeneratedColumn<int> ambianceId = GeneratedColumn<int>(
      'ambiance_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sound_references (id)'));
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  @override
  late final GeneratedColumn<int> roomId = GeneratedColumn<int>(
      'room_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES rooms (id) ON DELETE CASCADE'));
  static const VerificationMeta _xMeta = const VerificationMeta('x');
  @override
  late final GeneratedColumn<int> x = GeneratedColumn<int>(
      'x', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _yMeta = const VerificationMeta('y');
  @override
  late final GeneratedColumn<int> y = GeneratedColumn<int>(
      'y', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, ambianceId, roomId, x, y];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_objects';
  @override
  VerificationContext validateIntegrity(Insertable<RoomObject> instance,
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
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('ambiance_id')) {
      context.handle(
          _ambianceIdMeta,
          ambianceId.isAcceptableOrUnknown(
              data['ambiance_id']!, _ambianceIdMeta));
    }
    if (data.containsKey('room_id')) {
      context.handle(_roomIdMeta,
          roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta));
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('x')) {
      context.handle(_xMeta, x.isAcceptableOrUnknown(data['x']!, _xMeta));
    }
    if (data.containsKey('y')) {
      context.handle(_yMeta, y.isAcceptableOrUnknown(data['y']!, _yMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomObject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomObject(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      ambianceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ambiance_id']),
      roomId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}room_id'])!,
      x: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}x'])!,
      y: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}y'])!,
    );
  }

  @override
  $RoomObjectsTable createAlias(String alias) {
    return $RoomObjectsTable(attachedDatabase, alias);
  }
}

class RoomObject extends DataClass implements Insertable<RoomObject> {
  /// The primary key field.
  final int id;

  /// The name column.
  final String name;

  /// The description column.
  final String description;

  /// The ID of the ambiance for this row.
  final int? ambianceId;

  /// The ID of the room this row is attached to.
  final int roomId;

  /// The x coordinate.
  final int x;

  /// The y coordinate.
  final int y;
  const RoomObject(
      {required this.id,
      required this.name,
      required this.description,
      this.ambianceId,
      required this.roomId,
      required this.x,
      required this.y});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || ambianceId != null) {
      map['ambiance_id'] = Variable<int>(ambianceId);
    }
    map['room_id'] = Variable<int>(roomId);
    map['x'] = Variable<int>(x);
    map['y'] = Variable<int>(y);
    return map;
  }

  RoomObjectsCompanion toCompanion(bool nullToAbsent) {
    return RoomObjectsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      ambianceId: ambianceId == null && nullToAbsent
          ? const Value.absent()
          : Value(ambianceId),
      roomId: Value(roomId),
      x: Value(x),
      y: Value(y),
    );
  }

  factory RoomObject.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomObject(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      ambianceId: serializer.fromJson<int?>(json['ambianceId']),
      roomId: serializer.fromJson<int>(json['roomId']),
      x: serializer.fromJson<int>(json['x']),
      y: serializer.fromJson<int>(json['y']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'ambianceId': serializer.toJson<int?>(ambianceId),
      'roomId': serializer.toJson<int>(roomId),
      'x': serializer.toJson<int>(x),
      'y': serializer.toJson<int>(y),
    };
  }

  RoomObject copyWith(
          {int? id,
          String? name,
          String? description,
          Value<int?> ambianceId = const Value.absent(),
          int? roomId,
          int? x,
          int? y}) =>
      RoomObject(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        ambianceId: ambianceId.present ? ambianceId.value : this.ambianceId,
        roomId: roomId ?? this.roomId,
        x: x ?? this.x,
        y: y ?? this.y,
      );
  RoomObject copyWithCompanion(RoomObjectsCompanion data) {
    return RoomObject(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      ambianceId:
          data.ambianceId.present ? data.ambianceId.value : this.ambianceId,
      roomId: data.roomId.present ? data.roomId.value : this.roomId,
      x: data.x.present ? data.x.value : this.x,
      y: data.y.present ? data.y.value : this.y,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoomObject(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('ambianceId: $ambianceId, ')
          ..write('roomId: $roomId, ')
          ..write('x: $x, ')
          ..write('y: $y')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, ambianceId, roomId, x, y);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomObject &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.ambianceId == this.ambianceId &&
          other.roomId == this.roomId &&
          other.x == this.x &&
          other.y == this.y);
}

class RoomObjectsCompanion extends UpdateCompanion<RoomObject> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int?> ambianceId;
  final Value<int> roomId;
  final Value<int> x;
  final Value<int> y;
  const RoomObjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.ambianceId = const Value.absent(),
    this.roomId = const Value.absent(),
    this.x = const Value.absent(),
    this.y = const Value.absent(),
  });
  RoomObjectsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    this.ambianceId = const Value.absent(),
    required int roomId,
    this.x = const Value.absent(),
    this.y = const Value.absent(),
  })  : name = Value(name),
        description = Value(description),
        roomId = Value(roomId);
  static Insertable<RoomObject> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? ambianceId,
    Expression<int>? roomId,
    Expression<int>? x,
    Expression<int>? y,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (ambianceId != null) 'ambiance_id': ambianceId,
      if (roomId != null) 'room_id': roomId,
      if (x != null) 'x': x,
      if (y != null) 'y': y,
    });
  }

  RoomObjectsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<int?>? ambianceId,
      Value<int>? roomId,
      Value<int>? x,
      Value<int>? y}) {
    return RoomObjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      ambianceId: ambianceId ?? this.ambianceId,
      roomId: roomId ?? this.roomId,
      x: x ?? this.x,
      y: y ?? this.y,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (ambianceId.present) {
      map['ambiance_id'] = Variable<int>(ambianceId.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<int>(roomId.value);
    }
    if (x.present) {
      map['x'] = Variable<int>(x.value);
    }
    if (y.present) {
      map['y'] = Variable<int>(y.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomObjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('ambianceId: $ambianceId, ')
          ..write('roomId: $roomId, ')
          ..write('x: $x, ')
          ..write('y: $y')
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
  late final $RoomSurfacesTable roomSurfaces = $RoomSurfacesTable(this);
  late final $RoomsTable rooms = $RoomsTable(this);
  late final $RoomObjectsTable roomObjects = $RoomObjectsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [soundReferences, zones, roomSurfaces, rooms, roomObjects];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('rooms',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_objects', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
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

  static MultiTypedResultKey<$RoomSurfacesTable, List<RoomSurface>>
      _footstepsSurfacesTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.roomSurfaces,
              aliasName: $_aliasNameGenerator(
                  db.soundReferences.id, db.roomSurfaces.footstepSoundId));

  $$RoomSurfacesTableProcessedTableManager get footstepsSurfaces {
    final manager = $$RoomSurfacesTableTableManager($_db, $_db.roomSurfaces)
        .filter((f) => f.footstepSoundId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_footstepsSurfacesTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RoomSurfacesTable, List<RoomSurface>>
      _wallSoundsSurfacesTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.roomSurfaces,
              aliasName: $_aliasNameGenerator(
                  db.soundReferences.id, db.roomSurfaces.wallSoundI));

  $$RoomSurfacesTableProcessedTableManager get wallSoundsSurfaces {
    final manager = $$RoomSurfacesTableTableManager($_db, $_db.roomSurfaces)
        .filter((f) => f.wallSoundI.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_wallSoundsSurfacesTable($_db));
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

  static MultiTypedResultKey<$RoomObjectsTable, List<RoomObject>>
      _roomObjectsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.roomObjects,
              aliasName: $_aliasNameGenerator(
                  db.soundReferences.id, db.roomObjects.ambianceId));

  $$RoomObjectsTableProcessedTableManager get roomObjectsRefs {
    final manager = $$RoomObjectsTableTableManager($_db, $_db.roomObjects)
        .filter((f) => f.ambianceId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_roomObjectsRefsTable($_db));
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

  Expression<bool> footstepsSurfaces(
      Expression<bool> Function($$RoomSurfacesTableFilterComposer f) f) {
    final $$RoomSurfacesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomSurfaces,
        getReferencedColumn: (t) => t.footstepSoundId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomSurfacesTableFilterComposer(
              $db: $db,
              $table: $db.roomSurfaces,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> wallSoundsSurfaces(
      Expression<bool> Function($$RoomSurfacesTableFilterComposer f) f) {
    final $$RoomSurfacesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomSurfaces,
        getReferencedColumn: (t) => t.wallSoundI,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomSurfacesTableFilterComposer(
              $db: $db,
              $table: $db.roomSurfaces,
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

  Expression<bool> roomObjectsRefs(
      Expression<bool> Function($$RoomObjectsTableFilterComposer f) f) {
    final $$RoomObjectsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomObjects,
        getReferencedColumn: (t) => t.ambianceId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomObjectsTableFilterComposer(
              $db: $db,
              $table: $db.roomObjects,
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

  Expression<T> footstepsSurfaces<T extends Object>(
      Expression<T> Function($$RoomSurfacesTableAnnotationComposer a) f) {
    final $$RoomSurfacesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomSurfaces,
        getReferencedColumn: (t) => t.footstepSoundId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomSurfacesTableAnnotationComposer(
              $db: $db,
              $table: $db.roomSurfaces,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> wallSoundsSurfaces<T extends Object>(
      Expression<T> Function($$RoomSurfacesTableAnnotationComposer a) f) {
    final $$RoomSurfacesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomSurfaces,
        getReferencedColumn: (t) => t.wallSoundI,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomSurfacesTableAnnotationComposer(
              $db: $db,
              $table: $db.roomSurfaces,
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

  Expression<T> roomObjectsRefs<T extends Object>(
      Expression<T> Function($$RoomObjectsTableAnnotationComposer a) f) {
    final $$RoomObjectsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomObjects,
        getReferencedColumn: (t) => t.ambianceId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomObjectsTableAnnotationComposer(
              $db: $db,
              $table: $db.roomObjects,
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
    PrefetchHooks Function(
        {bool zonesRefs,
        bool footstepsSurfaces,
        bool wallSoundsSurfaces,
        bool roomsRefs,
        bool roomObjectsRefs})> {
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
          prefetchHooksCallback: (
              {zonesRefs = false,
              footstepsSurfaces = false,
              wallSoundsSurfaces = false,
              roomsRefs = false,
              roomObjectsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (zonesRefs) db.zones,
                if (footstepsSurfaces) db.roomSurfaces,
                if (wallSoundsSurfaces) db.roomSurfaces,
                if (roomsRefs) db.rooms,
                if (roomObjectsRefs) db.roomObjects
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
                  if (footstepsSurfaces)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$SoundReferencesTableReferences
                            ._footstepsSurfacesTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SoundReferencesTableReferences(db, table, p0)
                                .footstepsSurfaces,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.footstepSoundId == item.id),
                        typedResults: items),
                  if (wallSoundsSurfaces)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$SoundReferencesTableReferences
                            ._wallSoundsSurfacesTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SoundReferencesTableReferences(db, table, p0)
                                .wallSoundsSurfaces,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.wallSoundI == item.id),
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
                        typedResults: items),
                  if (roomObjectsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$SoundReferencesTableReferences
                            ._roomObjectsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SoundReferencesTableReferences(db, table, p0)
                                .roomObjectsRefs,
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
    PrefetchHooks Function(
        {bool zonesRefs,
        bool footstepsSurfaces,
        bool wallSoundsSurfaces,
        bool roomsRefs,
        bool roomObjectsRefs})>;
typedef $$ZonesTableCreateCompanionBuilder = ZonesCompanion Function({
  Value<int> id,
  required String name,
  required String description,
  Value<DateTime> createdAt,
  Value<int?> musicId,
});
typedef $$ZonesTableUpdateCompanionBuilder = ZonesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> description,
  Value<DateTime> createdAt,
  Value<int?> musicId,
});

final class $$ZonesTableReferences
    extends BaseReferences<_$AppDatabase, $ZonesTable, Zone> {
  $$ZonesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SoundReferencesTable _musicIdTable(_$AppDatabase db) =>
      db.soundReferences.createAlias(
          $_aliasNameGenerator(db.zones.musicId, db.soundReferences.id));

  $$SoundReferencesTableProcessedTableManager? get musicId {
    if ($_item.musicId == null) return null;
    final manager =
        $$SoundReferencesTableTableManager($_db, $_db.soundReferences)
            .filter((f) => f.id($_item.musicId!));
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

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

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

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

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

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

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
            Value<String> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int?> musicId = const Value.absent(),
          }) =>
              ZonesCompanion(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
            musicId: musicId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String description,
            Value<DateTime> createdAt = const Value.absent(),
            Value<int?> musicId = const Value.absent(),
          }) =>
              ZonesCompanion.insert(
            id: id,
            name: name,
            description: description,
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
typedef $$RoomSurfacesTableCreateCompanionBuilder = RoomSurfacesCompanion
    Function({
  Value<int> id,
  required String name,
  required String description,
  Value<int?> footstepSoundId,
  Value<int?> wallSoundI,
});
typedef $$RoomSurfacesTableUpdateCompanionBuilder = RoomSurfacesCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> description,
  Value<int?> footstepSoundId,
  Value<int?> wallSoundI,
});

final class $$RoomSurfacesTableReferences
    extends BaseReferences<_$AppDatabase, $RoomSurfacesTable, RoomSurface> {
  $$RoomSurfacesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SoundReferencesTable _footstepSoundIdTable(_$AppDatabase db) =>
      db.soundReferences.createAlias($_aliasNameGenerator(
          db.roomSurfaces.footstepSoundId, db.soundReferences.id));

  $$SoundReferencesTableProcessedTableManager? get footstepSoundId {
    if ($_item.footstepSoundId == null) return null;
    final manager =
        $$SoundReferencesTableTableManager($_db, $_db.soundReferences)
            .filter((f) => f.id($_item.footstepSoundId!));
    final item = $_typedResult.readTableOrNull(_footstepSoundIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SoundReferencesTable _wallSoundITable(_$AppDatabase db) =>
      db.soundReferences.createAlias($_aliasNameGenerator(
          db.roomSurfaces.wallSoundI, db.soundReferences.id));

  $$SoundReferencesTableProcessedTableManager? get wallSoundI {
    if ($_item.wallSoundI == null) return null;
    final manager =
        $$SoundReferencesTableTableManager($_db, $_db.soundReferences)
            .filter((f) => f.id($_item.wallSoundI!));
    final item = $_typedResult.readTableOrNull(_wallSoundITable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$RoomsTable, List<Room>> _roomsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.rooms,
          aliasName:
              $_aliasNameGenerator(db.roomSurfaces.id, db.rooms.surfaceId));

  $$RoomsTableProcessedTableManager get roomsRefs {
    final manager = $$RoomsTableTableManager($_db, $_db.rooms)
        .filter((f) => f.surfaceId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_roomsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$RoomSurfacesTableFilterComposer
    extends Composer<_$AppDatabase, $RoomSurfacesTable> {
  $$RoomSurfacesTableFilterComposer({
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

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  $$SoundReferencesTableFilterComposer get footstepSoundId {
    final $$SoundReferencesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.footstepSoundId,
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

  $$SoundReferencesTableFilterComposer get wallSoundI {
    final $$SoundReferencesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.wallSoundI,
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
        getReferencedColumn: (t) => t.surfaceId,
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

class $$RoomSurfacesTableOrderingComposer
    extends Composer<_$AppDatabase, $RoomSurfacesTable> {
  $$RoomSurfacesTableOrderingComposer({
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

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  $$SoundReferencesTableOrderingComposer get footstepSoundId {
    final $$SoundReferencesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.footstepSoundId,
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

  $$SoundReferencesTableOrderingComposer get wallSoundI {
    final $$SoundReferencesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.wallSoundI,
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

class $$RoomSurfacesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoomSurfacesTable> {
  $$RoomSurfacesTableAnnotationComposer({
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

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  $$SoundReferencesTableAnnotationComposer get footstepSoundId {
    final $$SoundReferencesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.footstepSoundId,
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

  $$SoundReferencesTableAnnotationComposer get wallSoundI {
    final $$SoundReferencesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.wallSoundI,
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
        getReferencedColumn: (t) => t.surfaceId,
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

class $$RoomSurfacesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoomSurfacesTable,
    RoomSurface,
    $$RoomSurfacesTableFilterComposer,
    $$RoomSurfacesTableOrderingComposer,
    $$RoomSurfacesTableAnnotationComposer,
    $$RoomSurfacesTableCreateCompanionBuilder,
    $$RoomSurfacesTableUpdateCompanionBuilder,
    (RoomSurface, $$RoomSurfacesTableReferences),
    RoomSurface,
    PrefetchHooks Function(
        {bool footstepSoundId, bool wallSoundI, bool roomsRefs})> {
  $$RoomSurfacesTableTableManager(_$AppDatabase db, $RoomSurfacesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomSurfacesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomSurfacesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomSurfacesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int?> footstepSoundId = const Value.absent(),
            Value<int?> wallSoundI = const Value.absent(),
          }) =>
              RoomSurfacesCompanion(
            id: id,
            name: name,
            description: description,
            footstepSoundId: footstepSoundId,
            wallSoundI: wallSoundI,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String description,
            Value<int?> footstepSoundId = const Value.absent(),
            Value<int?> wallSoundI = const Value.absent(),
          }) =>
              RoomSurfacesCompanion.insert(
            id: id,
            name: name,
            description: description,
            footstepSoundId: footstepSoundId,
            wallSoundI: wallSoundI,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RoomSurfacesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {footstepSoundId = false,
              wallSoundI = false,
              roomsRefs = false}) {
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
                if (footstepSoundId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.footstepSoundId,
                    referencedTable:
                        $$RoomSurfacesTableReferences._footstepSoundIdTable(db),
                    referencedColumn: $$RoomSurfacesTableReferences
                        ._footstepSoundIdTable(db)
                        .id,
                  ) as T;
                }
                if (wallSoundI) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.wallSoundI,
                    referencedTable:
                        $$RoomSurfacesTableReferences._wallSoundITable(db),
                    referencedColumn:
                        $$RoomSurfacesTableReferences._wallSoundITable(db).id,
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
                            $$RoomSurfacesTableReferences._roomsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoomSurfacesTableReferences(db, table, p0)
                                .roomsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.surfaceId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$RoomSurfacesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RoomSurfacesTable,
    RoomSurface,
    $$RoomSurfacesTableFilterComposer,
    $$RoomSurfacesTableOrderingComposer,
    $$RoomSurfacesTableAnnotationComposer,
    $$RoomSurfacesTableCreateCompanionBuilder,
    $$RoomSurfacesTableUpdateCompanionBuilder,
    (RoomSurface, $$RoomSurfacesTableReferences),
    RoomSurface,
    PrefetchHooks Function(
        {bool footstepSoundId, bool wallSoundI, bool roomsRefs})>;
typedef $$RoomsTableCreateCompanionBuilder = RoomsCompanion Function({
  Value<int> id,
  required String name,
  required String description,
  Value<DateTime> createdAt,
  Value<int?> ambianceId,
  required int zoneId,
  Value<int> maxX,
  Value<int> maxY,
  required int surfaceId,
});
typedef $$RoomsTableUpdateCompanionBuilder = RoomsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> description,
  Value<DateTime> createdAt,
  Value<int?> ambianceId,
  Value<int> zoneId,
  Value<int> maxX,
  Value<int> maxY,
  Value<int> surfaceId,
});

final class $$RoomsTableReferences
    extends BaseReferences<_$AppDatabase, $RoomsTable, Room> {
  $$RoomsTableReferences(super.$_db, super.$_table, super.$_typedResult);

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

  static $RoomSurfacesTable _surfaceIdTable(_$AppDatabase db) =>
      db.roomSurfaces.createAlias(
          $_aliasNameGenerator(db.rooms.surfaceId, db.roomSurfaces.id));

  $$RoomSurfacesTableProcessedTableManager get surfaceId {
    final manager = $$RoomSurfacesTableTableManager($_db, $_db.roomSurfaces)
        .filter((f) => f.id($_item.surfaceId));
    final item = $_typedResult.readTableOrNull(_surfaceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$RoomObjectsTable, List<RoomObject>>
      _roomObjectsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.roomObjects,
          aliasName: $_aliasNameGenerator(db.rooms.id, db.roomObjects.roomId));

  $$RoomObjectsTableProcessedTableManager get roomObjectsRefs {
    final manager = $$RoomObjectsTableTableManager($_db, $_db.roomObjects)
        .filter((f) => f.roomId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_roomObjectsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
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

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxX => $composableBuilder(
      column: $table.maxX, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxY => $composableBuilder(
      column: $table.maxY, builder: (column) => ColumnFilters(column));

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

  $$RoomSurfacesTableFilterComposer get surfaceId {
    final $$RoomSurfacesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.surfaceId,
        referencedTable: $db.roomSurfaces,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomSurfacesTableFilterComposer(
              $db: $db,
              $table: $db.roomSurfaces,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> roomObjectsRefs(
      Expression<bool> Function($$RoomObjectsTableFilterComposer f) f) {
    final $$RoomObjectsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomObjects,
        getReferencedColumn: (t) => t.roomId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomObjectsTableFilterComposer(
              $db: $db,
              $table: $db.roomObjects,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
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

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxX => $composableBuilder(
      column: $table.maxX, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxY => $composableBuilder(
      column: $table.maxY, builder: (column) => ColumnOrderings(column));

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

  $$RoomSurfacesTableOrderingComposer get surfaceId {
    final $$RoomSurfacesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.surfaceId,
        referencedTable: $db.roomSurfaces,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomSurfacesTableOrderingComposer(
              $db: $db,
              $table: $db.roomSurfaces,
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

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get maxX =>
      $composableBuilder(column: $table.maxX, builder: (column) => column);

  GeneratedColumn<int> get maxY =>
      $composableBuilder(column: $table.maxY, builder: (column) => column);

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

  $$RoomSurfacesTableAnnotationComposer get surfaceId {
    final $$RoomSurfacesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.surfaceId,
        referencedTable: $db.roomSurfaces,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomSurfacesTableAnnotationComposer(
              $db: $db,
              $table: $db.roomSurfaces,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> roomObjectsRefs<T extends Object>(
      Expression<T> Function($$RoomObjectsTableAnnotationComposer a) f) {
    final $$RoomObjectsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomObjects,
        getReferencedColumn: (t) => t.roomId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomObjectsTableAnnotationComposer(
              $db: $db,
              $table: $db.roomObjects,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
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
    PrefetchHooks Function(
        {bool ambianceId, bool zoneId, bool surfaceId, bool roomObjectsRefs})> {
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
            Value<String> description = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int?> ambianceId = const Value.absent(),
            Value<int> zoneId = const Value.absent(),
            Value<int> maxX = const Value.absent(),
            Value<int> maxY = const Value.absent(),
            Value<int> surfaceId = const Value.absent(),
          }) =>
              RoomsCompanion(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
            ambianceId: ambianceId,
            zoneId: zoneId,
            maxX: maxX,
            maxY: maxY,
            surfaceId: surfaceId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String description,
            Value<DateTime> createdAt = const Value.absent(),
            Value<int?> ambianceId = const Value.absent(),
            required int zoneId,
            Value<int> maxX = const Value.absent(),
            Value<int> maxY = const Value.absent(),
            required int surfaceId,
          }) =>
              RoomsCompanion.insert(
            id: id,
            name: name,
            description: description,
            createdAt: createdAt,
            ambianceId: ambianceId,
            zoneId: zoneId,
            maxX: maxX,
            maxY: maxY,
            surfaceId: surfaceId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$RoomsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {ambianceId = false,
              zoneId = false,
              surfaceId = false,
              roomObjectsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (roomObjectsRefs) db.roomObjects],
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
                if (zoneId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.zoneId,
                    referencedTable: $$RoomsTableReferences._zoneIdTable(db),
                    referencedColumn:
                        $$RoomsTableReferences._zoneIdTable(db).id,
                  ) as T;
                }
                if (surfaceId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.surfaceId,
                    referencedTable: $$RoomsTableReferences._surfaceIdTable(db),
                    referencedColumn:
                        $$RoomsTableReferences._surfaceIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (roomObjectsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$RoomsTableReferences._roomObjectsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoomsTableReferences(db, table, p0)
                                .roomObjectsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.roomId == item.id),
                        typedResults: items)
                ];
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
    PrefetchHooks Function(
        {bool ambianceId, bool zoneId, bool surfaceId, bool roomObjectsRefs})>;
typedef $$RoomObjectsTableCreateCompanionBuilder = RoomObjectsCompanion
    Function({
  Value<int> id,
  required String name,
  required String description,
  Value<int?> ambianceId,
  required int roomId,
  Value<int> x,
  Value<int> y,
});
typedef $$RoomObjectsTableUpdateCompanionBuilder = RoomObjectsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> description,
  Value<int?> ambianceId,
  Value<int> roomId,
  Value<int> x,
  Value<int> y,
});

final class $$RoomObjectsTableReferences
    extends BaseReferences<_$AppDatabase, $RoomObjectsTable, RoomObject> {
  $$RoomObjectsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SoundReferencesTable _ambianceIdTable(_$AppDatabase db) =>
      db.soundReferences.createAlias($_aliasNameGenerator(
          db.roomObjects.ambianceId, db.soundReferences.id));

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

  static $RoomsTable _roomIdTable(_$AppDatabase db) => db.rooms
      .createAlias($_aliasNameGenerator(db.roomObjects.roomId, db.rooms.id));

  $$RoomsTableProcessedTableManager get roomId {
    final manager = $$RoomsTableTableManager($_db, $_db.rooms)
        .filter((f) => f.id($_item.roomId));
    final item = $_typedResult.readTableOrNull(_roomIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RoomObjectsTableFilterComposer
    extends Composer<_$AppDatabase, $RoomObjectsTable> {
  $$RoomObjectsTableFilterComposer({
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

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get x => $composableBuilder(
      column: $table.x, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get y => $composableBuilder(
      column: $table.y, builder: (column) => ColumnFilters(column));

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

  $$RoomsTableFilterComposer get roomId {
    final $$RoomsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomId,
        referencedTable: $db.rooms,
        getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$RoomObjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoomObjectsTable> {
  $$RoomObjectsTableOrderingComposer({
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

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get x => $composableBuilder(
      column: $table.x, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get y => $composableBuilder(
      column: $table.y, builder: (column) => ColumnOrderings(column));

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

  $$RoomsTableOrderingComposer get roomId {
    final $$RoomsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomId,
        referencedTable: $db.rooms,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomsTableOrderingComposer(
              $db: $db,
              $table: $db.rooms,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RoomObjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoomObjectsTable> {
  $$RoomObjectsTableAnnotationComposer({
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

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get x =>
      $composableBuilder(column: $table.x, builder: (column) => column);

  GeneratedColumn<int> get y =>
      $composableBuilder(column: $table.y, builder: (column) => column);

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

  $$RoomsTableAnnotationComposer get roomId {
    final $$RoomsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomId,
        referencedTable: $db.rooms,
        getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$RoomObjectsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoomObjectsTable,
    RoomObject,
    $$RoomObjectsTableFilterComposer,
    $$RoomObjectsTableOrderingComposer,
    $$RoomObjectsTableAnnotationComposer,
    $$RoomObjectsTableCreateCompanionBuilder,
    $$RoomObjectsTableUpdateCompanionBuilder,
    (RoomObject, $$RoomObjectsTableReferences),
    RoomObject,
    PrefetchHooks Function({bool ambianceId, bool roomId})> {
  $$RoomObjectsTableTableManager(_$AppDatabase db, $RoomObjectsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomObjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomObjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomObjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int?> ambianceId = const Value.absent(),
            Value<int> roomId = const Value.absent(),
            Value<int> x = const Value.absent(),
            Value<int> y = const Value.absent(),
          }) =>
              RoomObjectsCompanion(
            id: id,
            name: name,
            description: description,
            ambianceId: ambianceId,
            roomId: roomId,
            x: x,
            y: y,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String description,
            Value<int?> ambianceId = const Value.absent(),
            required int roomId,
            Value<int> x = const Value.absent(),
            Value<int> y = const Value.absent(),
          }) =>
              RoomObjectsCompanion.insert(
            id: id,
            name: name,
            description: description,
            ambianceId: ambianceId,
            roomId: roomId,
            x: x,
            y: y,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RoomObjectsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({ambianceId = false, roomId = false}) {
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
                if (ambianceId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.ambianceId,
                    referencedTable:
                        $$RoomObjectsTableReferences._ambianceIdTable(db),
                    referencedColumn:
                        $$RoomObjectsTableReferences._ambianceIdTable(db).id,
                  ) as T;
                }
                if (roomId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.roomId,
                    referencedTable:
                        $$RoomObjectsTableReferences._roomIdTable(db),
                    referencedColumn:
                        $$RoomObjectsTableReferences._roomIdTable(db).id,
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

typedef $$RoomObjectsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RoomObjectsTable,
    RoomObject,
    $$RoomObjectsTableFilterComposer,
    $$RoomObjectsTableOrderingComposer,
    $$RoomObjectsTableAnnotationComposer,
    $$RoomObjectsTableCreateCompanionBuilder,
    $$RoomObjectsTableUpdateCompanionBuilder,
    (RoomObject, $$RoomObjectsTableReferences),
    RoomObject,
    PrefetchHooks Function({bool ambianceId, bool roomId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SoundReferencesTableTableManager get soundReferences =>
      $$SoundReferencesTableTableManager(_db, _db.soundReferences);
  $$ZonesTableTableManager get zones =>
      $$ZonesTableTableManager(_db, _db.zones);
  $$RoomSurfacesTableTableManager get roomSurfaces =>
      $$RoomSurfacesTableTableManager(_db, _db.roomSurfaces);
  $$RoomsTableTableManager get rooms =>
      $$RoomsTableTableManager(_db, _db.rooms);
  $$RoomObjectsTableTableManager get roomObjects =>
      $$RoomObjectsTableTableManager(_db, _db.roomObjects);
}
