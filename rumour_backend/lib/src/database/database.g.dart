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
  static const VerificationMeta _loadModeMeta =
      const VerificationMeta('loadMode');
  @override
  late final GeneratedColumnWithTypeConverter<LoadMode, int> loadMode =
      GeneratedColumn<int>('load_mode', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: Constant(LoadMode.memory.index))
          .withConverter<LoadMode>($SoundReferencesTable.$converterloadMode);
  @override
  List<GeneratedColumn> get $columns => [id, path, volume, loadMode];
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
    context.handle(_loadModeMeta, const VerificationResult.success());
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
      loadMode: $SoundReferencesTable.$converterloadMode.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}load_mode'])!),
    );
  }

  @override
  $SoundReferencesTable createAlias(String alias) {
    return $SoundReferencesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<LoadMode, int, int> $converterloadMode =
      const EnumIndexConverter<LoadMode>(LoadMode.values);
}

class SoundReference extends DataClass implements Insertable<SoundReference> {
  /// The primary key field.
  final int id;

  /// The path to the sound.
  final String path;

  /// The volume of the sound.
  final double volume;

  /// The load mode for this sound.
  final LoadMode loadMode;
  const SoundReference(
      {required this.id,
      required this.path,
      required this.volume,
      required this.loadMode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['path'] = Variable<String>(path);
    map['volume'] = Variable<double>(volume);
    {
      map['load_mode'] = Variable<int>(
          $SoundReferencesTable.$converterloadMode.toSql(loadMode));
    }
    return map;
  }

  SoundReferencesCompanion toCompanion(bool nullToAbsent) {
    return SoundReferencesCompanion(
      id: Value(id),
      path: Value(path),
      volume: Value(volume),
      loadMode: Value(loadMode),
    );
  }

  factory SoundReference.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SoundReference(
      id: serializer.fromJson<int>(json['id']),
      path: serializer.fromJson<String>(json['path']),
      volume: serializer.fromJson<double>(json['volume']),
      loadMode: $SoundReferencesTable.$converterloadMode
          .fromJson(serializer.fromJson<int>(json['loadMode'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'path': serializer.toJson<String>(path),
      'volume': serializer.toJson<double>(volume),
      'loadMode': serializer.toJson<int>(
          $SoundReferencesTable.$converterloadMode.toJson(loadMode)),
    };
  }

  SoundReference copyWith(
          {int? id, String? path, double? volume, LoadMode? loadMode}) =>
      SoundReference(
        id: id ?? this.id,
        path: path ?? this.path,
        volume: volume ?? this.volume,
        loadMode: loadMode ?? this.loadMode,
      );
  SoundReference copyWithCompanion(SoundReferencesCompanion data) {
    return SoundReference(
      id: data.id.present ? data.id.value : this.id,
      path: data.path.present ? data.path.value : this.path,
      volume: data.volume.present ? data.volume.value : this.volume,
      loadMode: data.loadMode.present ? data.loadMode.value : this.loadMode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SoundReference(')
          ..write('id: $id, ')
          ..write('path: $path, ')
          ..write('volume: $volume, ')
          ..write('loadMode: $loadMode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, path, volume, loadMode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SoundReference &&
          other.id == this.id &&
          other.path == this.path &&
          other.volume == this.volume &&
          other.loadMode == this.loadMode);
}

class SoundReferencesCompanion extends UpdateCompanion<SoundReference> {
  final Value<int> id;
  final Value<String> path;
  final Value<double> volume;
  final Value<LoadMode> loadMode;
  const SoundReferencesCompanion({
    this.id = const Value.absent(),
    this.path = const Value.absent(),
    this.volume = const Value.absent(),
    this.loadMode = const Value.absent(),
  });
  SoundReferencesCompanion.insert({
    this.id = const Value.absent(),
    required String path,
    this.volume = const Value.absent(),
    this.loadMode = const Value.absent(),
  }) : path = Value(path);
  static Insertable<SoundReference> custom({
    Expression<int>? id,
    Expression<String>? path,
    Expression<double>? volume,
    Expression<int>? loadMode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (path != null) 'path': path,
      if (volume != null) 'volume': volume,
      if (loadMode != null) 'load_mode': loadMode,
    });
  }

  SoundReferencesCompanion copyWith(
      {Value<int>? id,
      Value<String>? path,
      Value<double>? volume,
      Value<LoadMode>? loadMode}) {
    return SoundReferencesCompanion(
      id: id ?? this.id,
      path: path ?? this.path,
      volume: volume ?? this.volume,
      loadMode: loadMode ?? this.loadMode,
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
    if (loadMode.present) {
      map['load_mode'] = Variable<int>(
          $SoundReferencesTable.$converterloadMode.toSql(loadMode.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SoundReferencesCompanion(')
          ..write('id: $id, ')
          ..write('path: $path, ')
          ..write('volume: $volume, ')
          ..write('loadMode: $loadMode')
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
  static const VerificationMeta _moveIntervalMeta =
      const VerificationMeta('moveInterval');
  @override
  late final GeneratedColumn<int> moveInterval = GeneratedColumn<int>(
      'move_interval', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(500));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, footstepSoundId, wallSoundI, moveInterval];
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
    if (data.containsKey('move_interval')) {
      context.handle(
          _moveIntervalMeta,
          moveInterval.isAcceptableOrUnknown(
              data['move_interval']!, _moveIntervalMeta));
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
      moveInterval: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}move_interval'])!,
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

  /// How many milliseconds must elapse between footsteps on this surface.
  final int moveInterval;
  const RoomSurface(
      {required this.id,
      required this.name,
      required this.description,
      this.footstepSoundId,
      this.wallSoundI,
      required this.moveInterval});
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
    map['move_interval'] = Variable<int>(moveInterval);
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
      moveInterval: Value(moveInterval),
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
      moveInterval: serializer.fromJson<int>(json['moveInterval']),
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
      'moveInterval': serializer.toJson<int>(moveInterval),
    };
  }

  RoomSurface copyWith(
          {int? id,
          String? name,
          String? description,
          Value<int?> footstepSoundId = const Value.absent(),
          Value<int?> wallSoundI = const Value.absent(),
          int? moveInterval}) =>
      RoomSurface(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        footstepSoundId: footstepSoundId.present
            ? footstepSoundId.value
            : this.footstepSoundId,
        wallSoundI: wallSoundI.present ? wallSoundI.value : this.wallSoundI,
        moveInterval: moveInterval ?? this.moveInterval,
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
      moveInterval: data.moveInterval.present
          ? data.moveInterval.value
          : this.moveInterval,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoomSurface(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('footstepSoundId: $footstepSoundId, ')
          ..write('wallSoundI: $wallSoundI, ')
          ..write('moveInterval: $moveInterval')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, description, footstepSoundId, wallSoundI, moveInterval);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomSurface &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.footstepSoundId == this.footstepSoundId &&
          other.wallSoundI == this.wallSoundI &&
          other.moveInterval == this.moveInterval);
}

class RoomSurfacesCompanion extends UpdateCompanion<RoomSurface> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int?> footstepSoundId;
  final Value<int?> wallSoundI;
  final Value<int> moveInterval;
  const RoomSurfacesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.footstepSoundId = const Value.absent(),
    this.wallSoundI = const Value.absent(),
    this.moveInterval = const Value.absent(),
  });
  RoomSurfacesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    this.footstepSoundId = const Value.absent(),
    this.wallSoundI = const Value.absent(),
    this.moveInterval = const Value.absent(),
  })  : name = Value(name),
        description = Value(description);
  static Insertable<RoomSurface> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? footstepSoundId,
    Expression<int>? wallSoundI,
    Expression<int>? moveInterval,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (footstepSoundId != null) 'footstep_sound_id': footstepSoundId,
      if (wallSoundI != null) 'wall_sound_i': wallSoundI,
      if (moveInterval != null) 'move_interval': moveInterval,
    });
  }

  RoomSurfacesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<int?>? footstepSoundId,
      Value<int?>? wallSoundI,
      Value<int>? moveInterval}) {
    return RoomSurfacesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      footstepSoundId: footstepSoundId ?? this.footstepSoundId,
      wallSoundI: wallSoundI ?? this.wallSoundI,
      moveInterval: moveInterval ?? this.moveInterval,
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
    if (moveInterval.present) {
      map['move_interval'] = Variable<int>(moveInterval.value);
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
          ..write('wallSoundI: $wallSoundI, ')
          ..write('moveInterval: $moveInterval')
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

class $RoomExitsTable extends RoomExits
    with TableInfo<$RoomExitsTable, RoomExit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomExitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
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
  static const VerificationMeta _useSoundIdMeta =
      const VerificationMeta('useSoundId');
  @override
  late final GeneratedColumn<int> useSoundId = GeneratedColumn<int>(
      'use_sound_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sound_references (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, roomId, x, y, useSoundId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_exits';
  @override
  VerificationContext validateIntegrity(Insertable<RoomExit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('use_sound_id')) {
      context.handle(
          _useSoundIdMeta,
          useSoundId.isAcceptableOrUnknown(
              data['use_sound_id']!, _useSoundIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomExit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomExit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      roomId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}room_id'])!,
      x: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}x'])!,
      y: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}y'])!,
      useSoundId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}use_sound_id']),
    );
  }

  @override
  $RoomExitsTable createAlias(String alias) {
    return $RoomExitsTable(attachedDatabase, alias);
  }
}

class RoomExit extends DataClass implements Insertable<RoomExit> {
  /// The primary key field.
  final int id;

  /// The ID of the room this row is attached to.
  final int roomId;

  /// The x coordinate.
  final int x;

  /// The y coordinate.
  final int y;

  /// The ID of the sound to play when using this exit.
  final int? useSoundId;
  const RoomExit(
      {required this.id,
      required this.roomId,
      required this.x,
      required this.y,
      this.useSoundId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['room_id'] = Variable<int>(roomId);
    map['x'] = Variable<int>(x);
    map['y'] = Variable<int>(y);
    if (!nullToAbsent || useSoundId != null) {
      map['use_sound_id'] = Variable<int>(useSoundId);
    }
    return map;
  }

  RoomExitsCompanion toCompanion(bool nullToAbsent) {
    return RoomExitsCompanion(
      id: Value(id),
      roomId: Value(roomId),
      x: Value(x),
      y: Value(y),
      useSoundId: useSoundId == null && nullToAbsent
          ? const Value.absent()
          : Value(useSoundId),
    );
  }

  factory RoomExit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomExit(
      id: serializer.fromJson<int>(json['id']),
      roomId: serializer.fromJson<int>(json['roomId']),
      x: serializer.fromJson<int>(json['x']),
      y: serializer.fromJson<int>(json['y']),
      useSoundId: serializer.fromJson<int?>(json['useSoundId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'roomId': serializer.toJson<int>(roomId),
      'x': serializer.toJson<int>(x),
      'y': serializer.toJson<int>(y),
      'useSoundId': serializer.toJson<int?>(useSoundId),
    };
  }

  RoomExit copyWith(
          {int? id,
          int? roomId,
          int? x,
          int? y,
          Value<int?> useSoundId = const Value.absent()}) =>
      RoomExit(
        id: id ?? this.id,
        roomId: roomId ?? this.roomId,
        x: x ?? this.x,
        y: y ?? this.y,
        useSoundId: useSoundId.present ? useSoundId.value : this.useSoundId,
      );
  RoomExit copyWithCompanion(RoomExitsCompanion data) {
    return RoomExit(
      id: data.id.present ? data.id.value : this.id,
      roomId: data.roomId.present ? data.roomId.value : this.roomId,
      x: data.x.present ? data.x.value : this.x,
      y: data.y.present ? data.y.value : this.y,
      useSoundId:
          data.useSoundId.present ? data.useSoundId.value : this.useSoundId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoomExit(')
          ..write('id: $id, ')
          ..write('roomId: $roomId, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('useSoundId: $useSoundId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, roomId, x, y, useSoundId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomExit &&
          other.id == this.id &&
          other.roomId == this.roomId &&
          other.x == this.x &&
          other.y == this.y &&
          other.useSoundId == this.useSoundId);
}

class RoomExitsCompanion extends UpdateCompanion<RoomExit> {
  final Value<int> id;
  final Value<int> roomId;
  final Value<int> x;
  final Value<int> y;
  final Value<int?> useSoundId;
  const RoomExitsCompanion({
    this.id = const Value.absent(),
    this.roomId = const Value.absent(),
    this.x = const Value.absent(),
    this.y = const Value.absent(),
    this.useSoundId = const Value.absent(),
  });
  RoomExitsCompanion.insert({
    this.id = const Value.absent(),
    required int roomId,
    this.x = const Value.absent(),
    this.y = const Value.absent(),
    this.useSoundId = const Value.absent(),
  }) : roomId = Value(roomId);
  static Insertable<RoomExit> custom({
    Expression<int>? id,
    Expression<int>? roomId,
    Expression<int>? x,
    Expression<int>? y,
    Expression<int>? useSoundId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roomId != null) 'room_id': roomId,
      if (x != null) 'x': x,
      if (y != null) 'y': y,
      if (useSoundId != null) 'use_sound_id': useSoundId,
    });
  }

  RoomExitsCompanion copyWith(
      {Value<int>? id,
      Value<int>? roomId,
      Value<int>? x,
      Value<int>? y,
      Value<int?>? useSoundId}) {
    return RoomExitsCompanion(
      id: id ?? this.id,
      roomId: roomId ?? this.roomId,
      x: x ?? this.x,
      y: y ?? this.y,
      useSoundId: useSoundId ?? this.useSoundId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
    if (useSoundId.present) {
      map['use_sound_id'] = Variable<int>(useSoundId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomExitsCompanion(')
          ..write('id: $id, ')
          ..write('roomId: $roomId, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('useSoundId: $useSoundId')
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
  static const VerificationMeta _roomExitIdMeta =
      const VerificationMeta('roomExitId');
  @override
  late final GeneratedColumn<int> roomExitId = GeneratedColumn<int>(
      'room_exit_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES room_exits (id) ON DELETE SET NULL'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, ambianceId, roomId, x, y, roomExitId];
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
    if (data.containsKey('room_exit_id')) {
      context.handle(
          _roomExitIdMeta,
          roomExitId.isAcceptableOrUnknown(
              data['room_exit_id']!, _roomExitIdMeta));
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
      roomExitId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}room_exit_id']),
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

  /// The ID of a room exit object.
  final int? roomExitId;
  const RoomObject(
      {required this.id,
      required this.name,
      required this.description,
      this.ambianceId,
      required this.roomId,
      required this.x,
      required this.y,
      this.roomExitId});
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
    if (!nullToAbsent || roomExitId != null) {
      map['room_exit_id'] = Variable<int>(roomExitId);
    }
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
      roomExitId: roomExitId == null && nullToAbsent
          ? const Value.absent()
          : Value(roomExitId),
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
      roomExitId: serializer.fromJson<int?>(json['roomExitId']),
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
      'roomExitId': serializer.toJson<int?>(roomExitId),
    };
  }

  RoomObject copyWith(
          {int? id,
          String? name,
          String? description,
          Value<int?> ambianceId = const Value.absent(),
          int? roomId,
          int? x,
          int? y,
          Value<int?> roomExitId = const Value.absent()}) =>
      RoomObject(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        ambianceId: ambianceId.present ? ambianceId.value : this.ambianceId,
        roomId: roomId ?? this.roomId,
        x: x ?? this.x,
        y: y ?? this.y,
        roomExitId: roomExitId.present ? roomExitId.value : this.roomExitId,
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
      roomExitId:
          data.roomExitId.present ? data.roomExitId.value : this.roomExitId,
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
          ..write('y: $y, ')
          ..write('roomExitId: $roomExitId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, ambianceId, roomId, x, y, roomExitId);
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
          other.y == this.y &&
          other.roomExitId == this.roomExitId);
}

class RoomObjectsCompanion extends UpdateCompanion<RoomObject> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int?> ambianceId;
  final Value<int> roomId;
  final Value<int> x;
  final Value<int> y;
  final Value<int?> roomExitId;
  const RoomObjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.ambianceId = const Value.absent(),
    this.roomId = const Value.absent(),
    this.x = const Value.absent(),
    this.y = const Value.absent(),
    this.roomExitId = const Value.absent(),
  });
  RoomObjectsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    this.ambianceId = const Value.absent(),
    required int roomId,
    this.x = const Value.absent(),
    this.y = const Value.absent(),
    this.roomExitId = const Value.absent(),
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
    Expression<int>? roomExitId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (ambianceId != null) 'ambiance_id': ambianceId,
      if (roomId != null) 'room_id': roomId,
      if (x != null) 'x': x,
      if (y != null) 'y': y,
      if (roomExitId != null) 'room_exit_id': roomExitId,
    });
  }

  RoomObjectsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<int?>? ambianceId,
      Value<int>? roomId,
      Value<int>? x,
      Value<int>? y,
      Value<int?>? roomExitId}) {
    return RoomObjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      ambianceId: ambianceId ?? this.ambianceId,
      roomId: roomId ?? this.roomId,
      x: x ?? this.x,
      y: y ?? this.y,
      roomExitId: roomExitId ?? this.roomExitId,
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
    if (roomExitId.present) {
      map['room_exit_id'] = Variable<int>(roomExitId.value);
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
          ..write('y: $y, ')
          ..write('roomExitId: $roomExitId')
          ..write(')'))
        .toString();
  }
}

class $PlayerClassesTable extends PlayerClasses
    with TableInfo<$PlayerClassesTable, PlayerClass> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayerClassesTable(this.attachedDatabase, [this._alias]);
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
  List<GeneratedColumn> get $columns => [id, name, description, roomId, x, y];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'player_classes';
  @override
  VerificationContext validateIntegrity(Insertable<PlayerClass> instance,
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
  PlayerClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlayerClass(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      roomId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}room_id'])!,
      x: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}x'])!,
      y: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}y'])!,
    );
  }

  @override
  $PlayerClassesTable createAlias(String alias) {
    return $PlayerClassesTable(attachedDatabase, alias);
  }
}

class PlayerClass extends DataClass implements Insertable<PlayerClass> {
  /// The primary key field.
  final int id;

  /// The name column.
  final String name;

  /// The description column.
  final String description;

  /// The ID of the room this row is attached to.
  final int roomId;

  /// The x coordinate.
  final int x;

  /// The y coordinate.
  final int y;
  const PlayerClass(
      {required this.id,
      required this.name,
      required this.description,
      required this.roomId,
      required this.x,
      required this.y});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['room_id'] = Variable<int>(roomId);
    map['x'] = Variable<int>(x);
    map['y'] = Variable<int>(y);
    return map;
  }

  PlayerClassesCompanion toCompanion(bool nullToAbsent) {
    return PlayerClassesCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      roomId: Value(roomId),
      x: Value(x),
      y: Value(y),
    );
  }

  factory PlayerClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlayerClass(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
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
      'roomId': serializer.toJson<int>(roomId),
      'x': serializer.toJson<int>(x),
      'y': serializer.toJson<int>(y),
    };
  }

  PlayerClass copyWith(
          {int? id,
          String? name,
          String? description,
          int? roomId,
          int? x,
          int? y}) =>
      PlayerClass(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        roomId: roomId ?? this.roomId,
        x: x ?? this.x,
        y: y ?? this.y,
      );
  PlayerClass copyWithCompanion(PlayerClassesCompanion data) {
    return PlayerClass(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      roomId: data.roomId.present ? data.roomId.value : this.roomId,
      x: data.x.present ? data.x.value : this.x,
      y: data.y.present ? data.y.value : this.y,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlayerClass(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('roomId: $roomId, ')
          ..write('x: $x, ')
          ..write('y: $y')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, roomId, x, y);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayerClass &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.roomId == this.roomId &&
          other.x == this.x &&
          other.y == this.y);
}

class PlayerClassesCompanion extends UpdateCompanion<PlayerClass> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int> roomId;
  final Value<int> x;
  final Value<int> y;
  const PlayerClassesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.roomId = const Value.absent(),
    this.x = const Value.absent(),
    this.y = const Value.absent(),
  });
  PlayerClassesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    required int roomId,
    this.x = const Value.absent(),
    this.y = const Value.absent(),
  })  : name = Value(name),
        description = Value(description),
        roomId = Value(roomId);
  static Insertable<PlayerClass> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? roomId,
    Expression<int>? x,
    Expression<int>? y,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (roomId != null) 'room_id': roomId,
      if (x != null) 'x': x,
      if (y != null) 'y': y,
    });
  }

  PlayerClassesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<int>? roomId,
      Value<int>? x,
      Value<int>? y}) {
    return PlayerClassesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
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
    return (StringBuffer('PlayerClassesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('roomId: $roomId, ')
          ..write('x: $x, ')
          ..write('y: $y')
          ..write(')'))
        .toString();
  }
}

class $GameStatsTable extends GameStats
    with TableInfo<$GameStatsTable, GameStat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameStatsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _defaultValueMeta =
      const VerificationMeta('defaultValue');
  @override
  late final GeneratedColumn<int> defaultValue = GeneratedColumn<int>(
      'default_value', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(5));
  static const VerificationMeta _isVisibleMeta =
      const VerificationMeta('isVisible');
  @override
  late final GeneratedColumn<bool> isVisible = GeneratedColumn<bool>(
      'is_visible', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_visible" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _maxGameStatIdMeta =
      const VerificationMeta('maxGameStatId');
  @override
  late final GeneratedColumn<int> maxGameStatId = GeneratedColumn<int>(
      'max_game_stat_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES game_stats (id) ON DELETE SET NULL'));
  static const VerificationMeta _mathematicalOperatorMeta =
      const VerificationMeta('mathematicalOperator');
  @override
  late final GeneratedColumnWithTypeConverter<MathematicalOperator, int>
      mathematicalOperator = GeneratedColumn<int>(
              'mathematical_operator', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: Constant(MathematicalOperator.multiply.index))
          .withConverter<MathematicalOperator>(
              $GameStatsTable.$convertermathematicalOperator);
  static const VerificationMeta _maxValueMultiplierMeta =
      const VerificationMeta('maxValueMultiplier');
  @override
  late final GeneratedColumn<int> maxValueMultiplier = GeneratedColumn<int>(
      'max_value_multiplier', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        defaultValue,
        isVisible,
        maxGameStatId,
        mathematicalOperator,
        maxValueMultiplier
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_stats';
  @override
  VerificationContext validateIntegrity(Insertable<GameStat> instance,
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
    if (data.containsKey('default_value')) {
      context.handle(
          _defaultValueMeta,
          defaultValue.isAcceptableOrUnknown(
              data['default_value']!, _defaultValueMeta));
    }
    if (data.containsKey('is_visible')) {
      context.handle(_isVisibleMeta,
          isVisible.isAcceptableOrUnknown(data['is_visible']!, _isVisibleMeta));
    }
    if (data.containsKey('max_game_stat_id')) {
      context.handle(
          _maxGameStatIdMeta,
          maxGameStatId.isAcceptableOrUnknown(
              data['max_game_stat_id']!, _maxGameStatIdMeta));
    }
    context.handle(
        _mathematicalOperatorMeta, const VerificationResult.success());
    if (data.containsKey('max_value_multiplier')) {
      context.handle(
          _maxValueMultiplierMeta,
          maxValueMultiplier.isAcceptableOrUnknown(
              data['max_value_multiplier']!, _maxValueMultiplierMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameStat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameStat(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      defaultValue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}default_value'])!,
      isVisible: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_visible'])!,
      maxGameStatId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_game_stat_id']),
      mathematicalOperator: $GameStatsTable.$convertermathematicalOperator
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.int,
              data['${effectivePrefix}mathematical_operator'])!),
      maxValueMultiplier: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}max_value_multiplier'])!,
    );
  }

  @override
  $GameStatsTable createAlias(String alias) {
    return $GameStatsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MathematicalOperator, int, int>
      $convertermathematicalOperator =
      const EnumIndexConverter<MathematicalOperator>(
          MathematicalOperator.values);
}

class GameStat extends DataClass implements Insertable<GameStat> {
  /// The primary key field.
  final int id;

  /// The name column.
  final String name;

  /// The description column.
  final String description;

  /// The default value when no other default is provided.
  ///
  /// The [defaultValue] will be ignored in most cases.
  final int defaultValue;

  /// Whether or not this stat is visible to the player.
  final bool isVisible;

  /// The ID of the game stat whose value on the target (player or NPC) will be
  /// considered the maximum value for this stat when the stat is being boosted
  /// by [RoomSurfaces] or similar.
  ///
  /// **note**: If [maxGameStatId] is `null`, then [RoomSurfaceBoosts] will
  /// boost stats indefinitely. This is probably not what you want.
  final int? maxGameStatId;

  /// The mathematical operator to combine the value of the max game stat and
  /// [maxValueMultiplier] to get the final max value.
  final MathematicalOperator mathematicalOperator;

  /// The maximum value to combine with the value of the max stat to get the
  /// maximum value.
  final int maxValueMultiplier;
  const GameStat(
      {required this.id,
      required this.name,
      required this.description,
      required this.defaultValue,
      required this.isVisible,
      this.maxGameStatId,
      required this.mathematicalOperator,
      required this.maxValueMultiplier});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['default_value'] = Variable<int>(defaultValue);
    map['is_visible'] = Variable<bool>(isVisible);
    if (!nullToAbsent || maxGameStatId != null) {
      map['max_game_stat_id'] = Variable<int>(maxGameStatId);
    }
    {
      map['mathematical_operator'] = Variable<int>($GameStatsTable
          .$convertermathematicalOperator
          .toSql(mathematicalOperator));
    }
    map['max_value_multiplier'] = Variable<int>(maxValueMultiplier);
    return map;
  }

  GameStatsCompanion toCompanion(bool nullToAbsent) {
    return GameStatsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      defaultValue: Value(defaultValue),
      isVisible: Value(isVisible),
      maxGameStatId: maxGameStatId == null && nullToAbsent
          ? const Value.absent()
          : Value(maxGameStatId),
      mathematicalOperator: Value(mathematicalOperator),
      maxValueMultiplier: Value(maxValueMultiplier),
    );
  }

  factory GameStat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameStat(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      defaultValue: serializer.fromJson<int>(json['defaultValue']),
      isVisible: serializer.fromJson<bool>(json['isVisible']),
      maxGameStatId: serializer.fromJson<int?>(json['maxGameStatId']),
      mathematicalOperator: $GameStatsTable.$convertermathematicalOperator
          .fromJson(serializer.fromJson<int>(json['mathematicalOperator'])),
      maxValueMultiplier: serializer.fromJson<int>(json['maxValueMultiplier']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'defaultValue': serializer.toJson<int>(defaultValue),
      'isVisible': serializer.toJson<bool>(isVisible),
      'maxGameStatId': serializer.toJson<int?>(maxGameStatId),
      'mathematicalOperator': serializer.toJson<int>($GameStatsTable
          .$convertermathematicalOperator
          .toJson(mathematicalOperator)),
      'maxValueMultiplier': serializer.toJson<int>(maxValueMultiplier),
    };
  }

  GameStat copyWith(
          {int? id,
          String? name,
          String? description,
          int? defaultValue,
          bool? isVisible,
          Value<int?> maxGameStatId = const Value.absent(),
          MathematicalOperator? mathematicalOperator,
          int? maxValueMultiplier}) =>
      GameStat(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        defaultValue: defaultValue ?? this.defaultValue,
        isVisible: isVisible ?? this.isVisible,
        maxGameStatId:
            maxGameStatId.present ? maxGameStatId.value : this.maxGameStatId,
        mathematicalOperator: mathematicalOperator ?? this.mathematicalOperator,
        maxValueMultiplier: maxValueMultiplier ?? this.maxValueMultiplier,
      );
  GameStat copyWithCompanion(GameStatsCompanion data) {
    return GameStat(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      defaultValue: data.defaultValue.present
          ? data.defaultValue.value
          : this.defaultValue,
      isVisible: data.isVisible.present ? data.isVisible.value : this.isVisible,
      maxGameStatId: data.maxGameStatId.present
          ? data.maxGameStatId.value
          : this.maxGameStatId,
      mathematicalOperator: data.mathematicalOperator.present
          ? data.mathematicalOperator.value
          : this.mathematicalOperator,
      maxValueMultiplier: data.maxValueMultiplier.present
          ? data.maxValueMultiplier.value
          : this.maxValueMultiplier,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameStat(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('defaultValue: $defaultValue, ')
          ..write('isVisible: $isVisible, ')
          ..write('maxGameStatId: $maxGameStatId, ')
          ..write('mathematicalOperator: $mathematicalOperator, ')
          ..write('maxValueMultiplier: $maxValueMultiplier')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, defaultValue,
      isVisible, maxGameStatId, mathematicalOperator, maxValueMultiplier);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameStat &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.defaultValue == this.defaultValue &&
          other.isVisible == this.isVisible &&
          other.maxGameStatId == this.maxGameStatId &&
          other.mathematicalOperator == this.mathematicalOperator &&
          other.maxValueMultiplier == this.maxValueMultiplier);
}

class GameStatsCompanion extends UpdateCompanion<GameStat> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int> defaultValue;
  final Value<bool> isVisible;
  final Value<int?> maxGameStatId;
  final Value<MathematicalOperator> mathematicalOperator;
  final Value<int> maxValueMultiplier;
  const GameStatsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.defaultValue = const Value.absent(),
    this.isVisible = const Value.absent(),
    this.maxGameStatId = const Value.absent(),
    this.mathematicalOperator = const Value.absent(),
    this.maxValueMultiplier = const Value.absent(),
  });
  GameStatsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    this.defaultValue = const Value.absent(),
    this.isVisible = const Value.absent(),
    this.maxGameStatId = const Value.absent(),
    this.mathematicalOperator = const Value.absent(),
    this.maxValueMultiplier = const Value.absent(),
  })  : name = Value(name),
        description = Value(description);
  static Insertable<GameStat> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? defaultValue,
    Expression<bool>? isVisible,
    Expression<int>? maxGameStatId,
    Expression<int>? mathematicalOperator,
    Expression<int>? maxValueMultiplier,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (defaultValue != null) 'default_value': defaultValue,
      if (isVisible != null) 'is_visible': isVisible,
      if (maxGameStatId != null) 'max_game_stat_id': maxGameStatId,
      if (mathematicalOperator != null)
        'mathematical_operator': mathematicalOperator,
      if (maxValueMultiplier != null)
        'max_value_multiplier': maxValueMultiplier,
    });
  }

  GameStatsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<int>? defaultValue,
      Value<bool>? isVisible,
      Value<int?>? maxGameStatId,
      Value<MathematicalOperator>? mathematicalOperator,
      Value<int>? maxValueMultiplier}) {
    return GameStatsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      defaultValue: defaultValue ?? this.defaultValue,
      isVisible: isVisible ?? this.isVisible,
      maxGameStatId: maxGameStatId ?? this.maxGameStatId,
      mathematicalOperator: mathematicalOperator ?? this.mathematicalOperator,
      maxValueMultiplier: maxValueMultiplier ?? this.maxValueMultiplier,
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
    if (defaultValue.present) {
      map['default_value'] = Variable<int>(defaultValue.value);
    }
    if (isVisible.present) {
      map['is_visible'] = Variable<bool>(isVisible.value);
    }
    if (maxGameStatId.present) {
      map['max_game_stat_id'] = Variable<int>(maxGameStatId.value);
    }
    if (mathematicalOperator.present) {
      map['mathematical_operator'] = Variable<int>($GameStatsTable
          .$convertermathematicalOperator
          .toSql(mathematicalOperator.value));
    }
    if (maxValueMultiplier.present) {
      map['max_value_multiplier'] = Variable<int>(maxValueMultiplier.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameStatsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('defaultValue: $defaultValue, ')
          ..write('isVisible: $isVisible, ')
          ..write('maxGameStatId: $maxGameStatId, ')
          ..write('mathematicalOperator: $mathematicalOperator, ')
          ..write('maxValueMultiplier: $maxValueMultiplier')
          ..write(')'))
        .toString();
  }
}

class $RoomSurfaceBoostsTable extends RoomSurfaceBoosts
    with TableInfo<$RoomSurfaceBoostsTable, RoomSurfaceBoost> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomSurfaceBoostsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _roomSurfaceIdMeta =
      const VerificationMeta('roomSurfaceId');
  @override
  late final GeneratedColumn<int> roomSurfaceId = GeneratedColumn<int>(
      'room_surface_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES room_surfaces (id) ON DELETE CASCADE'));
  static const VerificationMeta _gameStatIdMeta =
      const VerificationMeta('gameStatId');
  @override
  late final GeneratedColumn<int> gameStatId = GeneratedColumn<int>(
      'game_stat_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES game_stats (id) ON DELETE CASCADE'));
  static const VerificationMeta _intervalMeta =
      const VerificationMeta('interval');
  @override
  late final GeneratedColumn<int> interval = GeneratedColumn<int>(
      'interval', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(30));
  static const VerificationMeta _boostMeta = const VerificationMeta('boost');
  @override
  late final GeneratedColumn<int> boost = GeneratedColumn<int>(
      'boost', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _boostSoundIdMeta =
      const VerificationMeta('boostSoundId');
  @override
  late final GeneratedColumn<int> boostSoundId = GeneratedColumn<int>(
      'boost_sound_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sound_references (id) ON DELETE SET NULL'));
  static const VerificationMeta _maxedOutSoundIdMeta =
      const VerificationMeta('maxedOutSoundId');
  @override
  late final GeneratedColumn<int> maxedOutSoundId = GeneratedColumn<int>(
      'maxed_out_sound_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sound_references (id) ON DELETE SET NULL'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        roomSurfaceId,
        gameStatId,
        interval,
        boost,
        boostSoundId,
        maxedOutSoundId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_surface_boosts';
  @override
  VerificationContext validateIntegrity(Insertable<RoomSurfaceBoost> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('room_surface_id')) {
      context.handle(
          _roomSurfaceIdMeta,
          roomSurfaceId.isAcceptableOrUnknown(
              data['room_surface_id']!, _roomSurfaceIdMeta));
    } else if (isInserting) {
      context.missing(_roomSurfaceIdMeta);
    }
    if (data.containsKey('game_stat_id')) {
      context.handle(
          _gameStatIdMeta,
          gameStatId.isAcceptableOrUnknown(
              data['game_stat_id']!, _gameStatIdMeta));
    } else if (isInserting) {
      context.missing(_gameStatIdMeta);
    }
    if (data.containsKey('interval')) {
      context.handle(_intervalMeta,
          interval.isAcceptableOrUnknown(data['interval']!, _intervalMeta));
    }
    if (data.containsKey('boost')) {
      context.handle(
          _boostMeta, boost.isAcceptableOrUnknown(data['boost']!, _boostMeta));
    }
    if (data.containsKey('boost_sound_id')) {
      context.handle(
          _boostSoundIdMeta,
          boostSoundId.isAcceptableOrUnknown(
              data['boost_sound_id']!, _boostSoundIdMeta));
    }
    if (data.containsKey('maxed_out_sound_id')) {
      context.handle(
          _maxedOutSoundIdMeta,
          maxedOutSoundId.isAcceptableOrUnknown(
              data['maxed_out_sound_id']!, _maxedOutSoundIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomSurfaceBoost map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomSurfaceBoost(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      roomSurfaceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}room_surface_id'])!,
      gameStatId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}game_stat_id'])!,
      interval: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}interval'])!,
      boost: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}boost'])!,
      boostSoundId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}boost_sound_id']),
      maxedOutSoundId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}maxed_out_sound_id']),
    );
  }

  @override
  $RoomSurfaceBoostsTable createAlias(String alias) {
    return $RoomSurfaceBoostsTable(attachedDatabase, alias);
  }
}

class RoomSurfaceBoost extends DataClass
    implements Insertable<RoomSurfaceBoost> {
  /// The primary key field.
  final int id;

  /// The ID of the room surface to use.
  final int roomSurfaceId;

  /// The ID of the game stat to use.
  final int gameStatId;

  /// How many seconds will elapse between this stat being replenished.
  final int interval;

  /// How much of this stat should be added each boost cycle.
  final int boost;

  /// The ID of the sound which will play if and when this stat is boosted.
  final int? boostSoundId;

  /// The ID of the sound that will play if this stat is maxed out.
  final int? maxedOutSoundId;
  const RoomSurfaceBoost(
      {required this.id,
      required this.roomSurfaceId,
      required this.gameStatId,
      required this.interval,
      required this.boost,
      this.boostSoundId,
      this.maxedOutSoundId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['room_surface_id'] = Variable<int>(roomSurfaceId);
    map['game_stat_id'] = Variable<int>(gameStatId);
    map['interval'] = Variable<int>(interval);
    map['boost'] = Variable<int>(boost);
    if (!nullToAbsent || boostSoundId != null) {
      map['boost_sound_id'] = Variable<int>(boostSoundId);
    }
    if (!nullToAbsent || maxedOutSoundId != null) {
      map['maxed_out_sound_id'] = Variable<int>(maxedOutSoundId);
    }
    return map;
  }

  RoomSurfaceBoostsCompanion toCompanion(bool nullToAbsent) {
    return RoomSurfaceBoostsCompanion(
      id: Value(id),
      roomSurfaceId: Value(roomSurfaceId),
      gameStatId: Value(gameStatId),
      interval: Value(interval),
      boost: Value(boost),
      boostSoundId: boostSoundId == null && nullToAbsent
          ? const Value.absent()
          : Value(boostSoundId),
      maxedOutSoundId: maxedOutSoundId == null && nullToAbsent
          ? const Value.absent()
          : Value(maxedOutSoundId),
    );
  }

  factory RoomSurfaceBoost.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomSurfaceBoost(
      id: serializer.fromJson<int>(json['id']),
      roomSurfaceId: serializer.fromJson<int>(json['roomSurfaceId']),
      gameStatId: serializer.fromJson<int>(json['gameStatId']),
      interval: serializer.fromJson<int>(json['interval']),
      boost: serializer.fromJson<int>(json['boost']),
      boostSoundId: serializer.fromJson<int?>(json['boostSoundId']),
      maxedOutSoundId: serializer.fromJson<int?>(json['maxedOutSoundId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'roomSurfaceId': serializer.toJson<int>(roomSurfaceId),
      'gameStatId': serializer.toJson<int>(gameStatId),
      'interval': serializer.toJson<int>(interval),
      'boost': serializer.toJson<int>(boost),
      'boostSoundId': serializer.toJson<int?>(boostSoundId),
      'maxedOutSoundId': serializer.toJson<int?>(maxedOutSoundId),
    };
  }

  RoomSurfaceBoost copyWith(
          {int? id,
          int? roomSurfaceId,
          int? gameStatId,
          int? interval,
          int? boost,
          Value<int?> boostSoundId = const Value.absent(),
          Value<int?> maxedOutSoundId = const Value.absent()}) =>
      RoomSurfaceBoost(
        id: id ?? this.id,
        roomSurfaceId: roomSurfaceId ?? this.roomSurfaceId,
        gameStatId: gameStatId ?? this.gameStatId,
        interval: interval ?? this.interval,
        boost: boost ?? this.boost,
        boostSoundId:
            boostSoundId.present ? boostSoundId.value : this.boostSoundId,
        maxedOutSoundId: maxedOutSoundId.present
            ? maxedOutSoundId.value
            : this.maxedOutSoundId,
      );
  RoomSurfaceBoost copyWithCompanion(RoomSurfaceBoostsCompanion data) {
    return RoomSurfaceBoost(
      id: data.id.present ? data.id.value : this.id,
      roomSurfaceId: data.roomSurfaceId.present
          ? data.roomSurfaceId.value
          : this.roomSurfaceId,
      gameStatId:
          data.gameStatId.present ? data.gameStatId.value : this.gameStatId,
      interval: data.interval.present ? data.interval.value : this.interval,
      boost: data.boost.present ? data.boost.value : this.boost,
      boostSoundId: data.boostSoundId.present
          ? data.boostSoundId.value
          : this.boostSoundId,
      maxedOutSoundId: data.maxedOutSoundId.present
          ? data.maxedOutSoundId.value
          : this.maxedOutSoundId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoomSurfaceBoost(')
          ..write('id: $id, ')
          ..write('roomSurfaceId: $roomSurfaceId, ')
          ..write('gameStatId: $gameStatId, ')
          ..write('interval: $interval, ')
          ..write('boost: $boost, ')
          ..write('boostSoundId: $boostSoundId, ')
          ..write('maxedOutSoundId: $maxedOutSoundId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, roomSurfaceId, gameStatId, interval,
      boost, boostSoundId, maxedOutSoundId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomSurfaceBoost &&
          other.id == this.id &&
          other.roomSurfaceId == this.roomSurfaceId &&
          other.gameStatId == this.gameStatId &&
          other.interval == this.interval &&
          other.boost == this.boost &&
          other.boostSoundId == this.boostSoundId &&
          other.maxedOutSoundId == this.maxedOutSoundId);
}

class RoomSurfaceBoostsCompanion extends UpdateCompanion<RoomSurfaceBoost> {
  final Value<int> id;
  final Value<int> roomSurfaceId;
  final Value<int> gameStatId;
  final Value<int> interval;
  final Value<int> boost;
  final Value<int?> boostSoundId;
  final Value<int?> maxedOutSoundId;
  const RoomSurfaceBoostsCompanion({
    this.id = const Value.absent(),
    this.roomSurfaceId = const Value.absent(),
    this.gameStatId = const Value.absent(),
    this.interval = const Value.absent(),
    this.boost = const Value.absent(),
    this.boostSoundId = const Value.absent(),
    this.maxedOutSoundId = const Value.absent(),
  });
  RoomSurfaceBoostsCompanion.insert({
    this.id = const Value.absent(),
    required int roomSurfaceId,
    required int gameStatId,
    this.interval = const Value.absent(),
    this.boost = const Value.absent(),
    this.boostSoundId = const Value.absent(),
    this.maxedOutSoundId = const Value.absent(),
  })  : roomSurfaceId = Value(roomSurfaceId),
        gameStatId = Value(gameStatId);
  static Insertable<RoomSurfaceBoost> custom({
    Expression<int>? id,
    Expression<int>? roomSurfaceId,
    Expression<int>? gameStatId,
    Expression<int>? interval,
    Expression<int>? boost,
    Expression<int>? boostSoundId,
    Expression<int>? maxedOutSoundId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roomSurfaceId != null) 'room_surface_id': roomSurfaceId,
      if (gameStatId != null) 'game_stat_id': gameStatId,
      if (interval != null) 'interval': interval,
      if (boost != null) 'boost': boost,
      if (boostSoundId != null) 'boost_sound_id': boostSoundId,
      if (maxedOutSoundId != null) 'maxed_out_sound_id': maxedOutSoundId,
    });
  }

  RoomSurfaceBoostsCompanion copyWith(
      {Value<int>? id,
      Value<int>? roomSurfaceId,
      Value<int>? gameStatId,
      Value<int>? interval,
      Value<int>? boost,
      Value<int?>? boostSoundId,
      Value<int?>? maxedOutSoundId}) {
    return RoomSurfaceBoostsCompanion(
      id: id ?? this.id,
      roomSurfaceId: roomSurfaceId ?? this.roomSurfaceId,
      gameStatId: gameStatId ?? this.gameStatId,
      interval: interval ?? this.interval,
      boost: boost ?? this.boost,
      boostSoundId: boostSoundId ?? this.boostSoundId,
      maxedOutSoundId: maxedOutSoundId ?? this.maxedOutSoundId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (roomSurfaceId.present) {
      map['room_surface_id'] = Variable<int>(roomSurfaceId.value);
    }
    if (gameStatId.present) {
      map['game_stat_id'] = Variable<int>(gameStatId.value);
    }
    if (interval.present) {
      map['interval'] = Variable<int>(interval.value);
    }
    if (boost.present) {
      map['boost'] = Variable<int>(boost.value);
    }
    if (boostSoundId.present) {
      map['boost_sound_id'] = Variable<int>(boostSoundId.value);
    }
    if (maxedOutSoundId.present) {
      map['maxed_out_sound_id'] = Variable<int>(maxedOutSoundId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomSurfaceBoostsCompanion(')
          ..write('id: $id, ')
          ..write('roomSurfaceId: $roomSurfaceId, ')
          ..write('gameStatId: $gameStatId, ')
          ..write('interval: $interval, ')
          ..write('boost: $boost, ')
          ..write('boostSoundId: $boostSoundId, ')
          ..write('maxedOutSoundId: $maxedOutSoundId')
          ..write(')'))
        .toString();
  }
}

class $RoomSurfaceCostsTable extends RoomSurfaceCosts
    with TableInfo<$RoomSurfaceCostsTable, RoomSurfaceCost> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomSurfaceCostsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _roomSurfaceIdMeta =
      const VerificationMeta('roomSurfaceId');
  @override
  late final GeneratedColumn<int> roomSurfaceId = GeneratedColumn<int>(
      'room_surface_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES room_surfaces (id) ON DELETE CASCADE'));
  static const VerificationMeta _gameStatIdMeta =
      const VerificationMeta('gameStatId');
  @override
  late final GeneratedColumn<int> gameStatId = GeneratedColumn<int>(
      'game_stat_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES game_stats (id) ON DELETE CASCADE'));
  static const VerificationMeta _surfaceCostMeta =
      const VerificationMeta('surfaceCost');
  @override
  late final GeneratedColumn<int> surfaceCost = GeneratedColumn<int>(
      'surface_cost', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _exhaustedSoundIdMeta =
      const VerificationMeta('exhaustedSoundId');
  @override
  late final GeneratedColumn<int> exhaustedSoundId = GeneratedColumn<int>(
      'exhausted_sound_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sound_references (id) ON DELETE SET NULL'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, roomSurfaceId, gameStatId, surfaceCost, exhaustedSoundId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_surface_costs';
  @override
  VerificationContext validateIntegrity(Insertable<RoomSurfaceCost> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('room_surface_id')) {
      context.handle(
          _roomSurfaceIdMeta,
          roomSurfaceId.isAcceptableOrUnknown(
              data['room_surface_id']!, _roomSurfaceIdMeta));
    } else if (isInserting) {
      context.missing(_roomSurfaceIdMeta);
    }
    if (data.containsKey('game_stat_id')) {
      context.handle(
          _gameStatIdMeta,
          gameStatId.isAcceptableOrUnknown(
              data['game_stat_id']!, _gameStatIdMeta));
    } else if (isInserting) {
      context.missing(_gameStatIdMeta);
    }
    if (data.containsKey('surface_cost')) {
      context.handle(
          _surfaceCostMeta,
          surfaceCost.isAcceptableOrUnknown(
              data['surface_cost']!, _surfaceCostMeta));
    }
    if (data.containsKey('exhausted_sound_id')) {
      context.handle(
          _exhaustedSoundIdMeta,
          exhaustedSoundId.isAcceptableOrUnknown(
              data['exhausted_sound_id']!, _exhaustedSoundIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomSurfaceCost map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomSurfaceCost(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      roomSurfaceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}room_surface_id'])!,
      gameStatId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}game_stat_id'])!,
      surfaceCost: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}surface_cost'])!,
      exhaustedSoundId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}exhausted_sound_id']),
    );
  }

  @override
  $RoomSurfaceCostsTable createAlias(String alias) {
    return $RoomSurfaceCostsTable(attachedDatabase, alias);
  }
}

class RoomSurfaceCost extends DataClass implements Insertable<RoomSurfaceCost> {
  /// The primary key field.
  final int id;

  /// The ID of the room surface to use.
  final int roomSurfaceId;

  /// The ID of the game stat to use.
  final int gameStatId;

  /// How much of this stat should be subtracted when travelling the surface.
  final int surfaceCost;

  /// The ID of the sound to play when the player does not have enough of this
  /// stat.
  final int? exhaustedSoundId;
  const RoomSurfaceCost(
      {required this.id,
      required this.roomSurfaceId,
      required this.gameStatId,
      required this.surfaceCost,
      this.exhaustedSoundId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['room_surface_id'] = Variable<int>(roomSurfaceId);
    map['game_stat_id'] = Variable<int>(gameStatId);
    map['surface_cost'] = Variable<int>(surfaceCost);
    if (!nullToAbsent || exhaustedSoundId != null) {
      map['exhausted_sound_id'] = Variable<int>(exhaustedSoundId);
    }
    return map;
  }

  RoomSurfaceCostsCompanion toCompanion(bool nullToAbsent) {
    return RoomSurfaceCostsCompanion(
      id: Value(id),
      roomSurfaceId: Value(roomSurfaceId),
      gameStatId: Value(gameStatId),
      surfaceCost: Value(surfaceCost),
      exhaustedSoundId: exhaustedSoundId == null && nullToAbsent
          ? const Value.absent()
          : Value(exhaustedSoundId),
    );
  }

  factory RoomSurfaceCost.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomSurfaceCost(
      id: serializer.fromJson<int>(json['id']),
      roomSurfaceId: serializer.fromJson<int>(json['roomSurfaceId']),
      gameStatId: serializer.fromJson<int>(json['gameStatId']),
      surfaceCost: serializer.fromJson<int>(json['surfaceCost']),
      exhaustedSoundId: serializer.fromJson<int?>(json['exhaustedSoundId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'roomSurfaceId': serializer.toJson<int>(roomSurfaceId),
      'gameStatId': serializer.toJson<int>(gameStatId),
      'surfaceCost': serializer.toJson<int>(surfaceCost),
      'exhaustedSoundId': serializer.toJson<int?>(exhaustedSoundId),
    };
  }

  RoomSurfaceCost copyWith(
          {int? id,
          int? roomSurfaceId,
          int? gameStatId,
          int? surfaceCost,
          Value<int?> exhaustedSoundId = const Value.absent()}) =>
      RoomSurfaceCost(
        id: id ?? this.id,
        roomSurfaceId: roomSurfaceId ?? this.roomSurfaceId,
        gameStatId: gameStatId ?? this.gameStatId,
        surfaceCost: surfaceCost ?? this.surfaceCost,
        exhaustedSoundId: exhaustedSoundId.present
            ? exhaustedSoundId.value
            : this.exhaustedSoundId,
      );
  RoomSurfaceCost copyWithCompanion(RoomSurfaceCostsCompanion data) {
    return RoomSurfaceCost(
      id: data.id.present ? data.id.value : this.id,
      roomSurfaceId: data.roomSurfaceId.present
          ? data.roomSurfaceId.value
          : this.roomSurfaceId,
      gameStatId:
          data.gameStatId.present ? data.gameStatId.value : this.gameStatId,
      surfaceCost:
          data.surfaceCost.present ? data.surfaceCost.value : this.surfaceCost,
      exhaustedSoundId: data.exhaustedSoundId.present
          ? data.exhaustedSoundId.value
          : this.exhaustedSoundId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoomSurfaceCost(')
          ..write('id: $id, ')
          ..write('roomSurfaceId: $roomSurfaceId, ')
          ..write('gameStatId: $gameStatId, ')
          ..write('surfaceCost: $surfaceCost, ')
          ..write('exhaustedSoundId: $exhaustedSoundId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, roomSurfaceId, gameStatId, surfaceCost, exhaustedSoundId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomSurfaceCost &&
          other.id == this.id &&
          other.roomSurfaceId == this.roomSurfaceId &&
          other.gameStatId == this.gameStatId &&
          other.surfaceCost == this.surfaceCost &&
          other.exhaustedSoundId == this.exhaustedSoundId);
}

class RoomSurfaceCostsCompanion extends UpdateCompanion<RoomSurfaceCost> {
  final Value<int> id;
  final Value<int> roomSurfaceId;
  final Value<int> gameStatId;
  final Value<int> surfaceCost;
  final Value<int?> exhaustedSoundId;
  const RoomSurfaceCostsCompanion({
    this.id = const Value.absent(),
    this.roomSurfaceId = const Value.absent(),
    this.gameStatId = const Value.absent(),
    this.surfaceCost = const Value.absent(),
    this.exhaustedSoundId = const Value.absent(),
  });
  RoomSurfaceCostsCompanion.insert({
    this.id = const Value.absent(),
    required int roomSurfaceId,
    required int gameStatId,
    this.surfaceCost = const Value.absent(),
    this.exhaustedSoundId = const Value.absent(),
  })  : roomSurfaceId = Value(roomSurfaceId),
        gameStatId = Value(gameStatId);
  static Insertable<RoomSurfaceCost> custom({
    Expression<int>? id,
    Expression<int>? roomSurfaceId,
    Expression<int>? gameStatId,
    Expression<int>? surfaceCost,
    Expression<int>? exhaustedSoundId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roomSurfaceId != null) 'room_surface_id': roomSurfaceId,
      if (gameStatId != null) 'game_stat_id': gameStatId,
      if (surfaceCost != null) 'surface_cost': surfaceCost,
      if (exhaustedSoundId != null) 'exhausted_sound_id': exhaustedSoundId,
    });
  }

  RoomSurfaceCostsCompanion copyWith(
      {Value<int>? id,
      Value<int>? roomSurfaceId,
      Value<int>? gameStatId,
      Value<int>? surfaceCost,
      Value<int?>? exhaustedSoundId}) {
    return RoomSurfaceCostsCompanion(
      id: id ?? this.id,
      roomSurfaceId: roomSurfaceId ?? this.roomSurfaceId,
      gameStatId: gameStatId ?? this.gameStatId,
      surfaceCost: surfaceCost ?? this.surfaceCost,
      exhaustedSoundId: exhaustedSoundId ?? this.exhaustedSoundId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (roomSurfaceId.present) {
      map['room_surface_id'] = Variable<int>(roomSurfaceId.value);
    }
    if (gameStatId.present) {
      map['game_stat_id'] = Variable<int>(gameStatId.value);
    }
    if (surfaceCost.present) {
      map['surface_cost'] = Variable<int>(surfaceCost.value);
    }
    if (exhaustedSoundId.present) {
      map['exhausted_sound_id'] = Variable<int>(exhaustedSoundId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomSurfaceCostsCompanion(')
          ..write('id: $id, ')
          ..write('roomSurfaceId: $roomSurfaceId, ')
          ..write('gameStatId: $gameStatId, ')
          ..write('surfaceCost: $surfaceCost, ')
          ..write('exhaustedSoundId: $exhaustedSoundId')
          ..write(')'))
        .toString();
  }
}

class $PlayerClassGameStatsTable extends PlayerClassGameStats
    with TableInfo<$PlayerClassGameStatsTable, PlayerClassGameStat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayerClassGameStatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _playerClassIdMeta =
      const VerificationMeta('playerClassId');
  @override
  late final GeneratedColumn<int> playerClassId = GeneratedColumn<int>(
      'player_class_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES player_classes (id) ON DELETE CASCADE'));
  static const VerificationMeta _gameStatIdMeta =
      const VerificationMeta('gameStatId');
  @override
  late final GeneratedColumn<int> gameStatId = GeneratedColumn<int>(
      'game_stat_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES game_stats (id) ON DELETE CASCADE'));
  static const VerificationMeta _defaultValueMeta =
      const VerificationMeta('defaultValue');
  @override
  late final GeneratedColumn<int> defaultValue = GeneratedColumn<int>(
      'default_value', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, playerClassId, gameStatId, defaultValue];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'player_class_game_stats';
  @override
  VerificationContext validateIntegrity(
      Insertable<PlayerClassGameStat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('player_class_id')) {
      context.handle(
          _playerClassIdMeta,
          playerClassId.isAcceptableOrUnknown(
              data['player_class_id']!, _playerClassIdMeta));
    } else if (isInserting) {
      context.missing(_playerClassIdMeta);
    }
    if (data.containsKey('game_stat_id')) {
      context.handle(
          _gameStatIdMeta,
          gameStatId.isAcceptableOrUnknown(
              data['game_stat_id']!, _gameStatIdMeta));
    } else if (isInserting) {
      context.missing(_gameStatIdMeta);
    }
    if (data.containsKey('default_value')) {
      context.handle(
          _defaultValueMeta,
          defaultValue.isAcceptableOrUnknown(
              data['default_value']!, _defaultValueMeta));
    } else if (isInserting) {
      context.missing(_defaultValueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlayerClassGameStat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlayerClassGameStat(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      playerClassId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}player_class_id'])!,
      gameStatId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}game_stat_id'])!,
      defaultValue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}default_value'])!,
    );
  }

  @override
  $PlayerClassGameStatsTable createAlias(String alias) {
    return $PlayerClassGameStatsTable(attachedDatabase, alias);
  }
}

class PlayerClassGameStat extends DataClass
    implements Insertable<PlayerClassGameStat> {
  /// The primary key field.
  final int id;

  /// The ID of a player class.
  final int playerClassId;

  /// The ID of the game stat to use.
  final int gameStatId;

  /// The default value to use.
  final int defaultValue;
  const PlayerClassGameStat(
      {required this.id,
      required this.playerClassId,
      required this.gameStatId,
      required this.defaultValue});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['player_class_id'] = Variable<int>(playerClassId);
    map['game_stat_id'] = Variable<int>(gameStatId);
    map['default_value'] = Variable<int>(defaultValue);
    return map;
  }

  PlayerClassGameStatsCompanion toCompanion(bool nullToAbsent) {
    return PlayerClassGameStatsCompanion(
      id: Value(id),
      playerClassId: Value(playerClassId),
      gameStatId: Value(gameStatId),
      defaultValue: Value(defaultValue),
    );
  }

  factory PlayerClassGameStat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlayerClassGameStat(
      id: serializer.fromJson<int>(json['id']),
      playerClassId: serializer.fromJson<int>(json['playerClassId']),
      gameStatId: serializer.fromJson<int>(json['gameStatId']),
      defaultValue: serializer.fromJson<int>(json['defaultValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'playerClassId': serializer.toJson<int>(playerClassId),
      'gameStatId': serializer.toJson<int>(gameStatId),
      'defaultValue': serializer.toJson<int>(defaultValue),
    };
  }

  PlayerClassGameStat copyWith(
          {int? id, int? playerClassId, int? gameStatId, int? defaultValue}) =>
      PlayerClassGameStat(
        id: id ?? this.id,
        playerClassId: playerClassId ?? this.playerClassId,
        gameStatId: gameStatId ?? this.gameStatId,
        defaultValue: defaultValue ?? this.defaultValue,
      );
  PlayerClassGameStat copyWithCompanion(PlayerClassGameStatsCompanion data) {
    return PlayerClassGameStat(
      id: data.id.present ? data.id.value : this.id,
      playerClassId: data.playerClassId.present
          ? data.playerClassId.value
          : this.playerClassId,
      gameStatId:
          data.gameStatId.present ? data.gameStatId.value : this.gameStatId,
      defaultValue: data.defaultValue.present
          ? data.defaultValue.value
          : this.defaultValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlayerClassGameStat(')
          ..write('id: $id, ')
          ..write('playerClassId: $playerClassId, ')
          ..write('gameStatId: $gameStatId, ')
          ..write('defaultValue: $defaultValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, playerClassId, gameStatId, defaultValue);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayerClassGameStat &&
          other.id == this.id &&
          other.playerClassId == this.playerClassId &&
          other.gameStatId == this.gameStatId &&
          other.defaultValue == this.defaultValue);
}

class PlayerClassGameStatsCompanion
    extends UpdateCompanion<PlayerClassGameStat> {
  final Value<int> id;
  final Value<int> playerClassId;
  final Value<int> gameStatId;
  final Value<int> defaultValue;
  const PlayerClassGameStatsCompanion({
    this.id = const Value.absent(),
    this.playerClassId = const Value.absent(),
    this.gameStatId = const Value.absent(),
    this.defaultValue = const Value.absent(),
  });
  PlayerClassGameStatsCompanion.insert({
    this.id = const Value.absent(),
    required int playerClassId,
    required int gameStatId,
    required int defaultValue,
  })  : playerClassId = Value(playerClassId),
        gameStatId = Value(gameStatId),
        defaultValue = Value(defaultValue);
  static Insertable<PlayerClassGameStat> custom({
    Expression<int>? id,
    Expression<int>? playerClassId,
    Expression<int>? gameStatId,
    Expression<int>? defaultValue,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (playerClassId != null) 'player_class_id': playerClassId,
      if (gameStatId != null) 'game_stat_id': gameStatId,
      if (defaultValue != null) 'default_value': defaultValue,
    });
  }

  PlayerClassGameStatsCompanion copyWith(
      {Value<int>? id,
      Value<int>? playerClassId,
      Value<int>? gameStatId,
      Value<int>? defaultValue}) {
    return PlayerClassGameStatsCompanion(
      id: id ?? this.id,
      playerClassId: playerClassId ?? this.playerClassId,
      gameStatId: gameStatId ?? this.gameStatId,
      defaultValue: defaultValue ?? this.defaultValue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (playerClassId.present) {
      map['player_class_id'] = Variable<int>(playerClassId.value);
    }
    if (gameStatId.present) {
      map['game_stat_id'] = Variable<int>(gameStatId.value);
    }
    if (defaultValue.present) {
      map['default_value'] = Variable<int>(defaultValue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayerClassGameStatsCompanion(')
          ..write('id: $id, ')
          ..write('playerClassId: $playerClassId, ')
          ..write('gameStatId: $gameStatId, ')
          ..write('defaultValue: $defaultValue')
          ..write(')'))
        .toString();
  }
}

class $RoomObjectRandomSoundsTable extends RoomObjectRandomSounds
    with TableInfo<$RoomObjectRandomSoundsTable, RoomObjectRandomSound> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomObjectRandomSoundsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _roomObjectIdMeta =
      const VerificationMeta('roomObjectId');
  @override
  late final GeneratedColumn<int> roomObjectId = GeneratedColumn<int>(
      'room_object_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES room_objects (id) ON DELETE CASCADE'));
  static const VerificationMeta _soundIdMeta =
      const VerificationMeta('soundId');
  @override
  late final GeneratedColumn<int> soundId = GeneratedColumn<int>(
      'sound_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sound_references (id) ON DELETE CASCADE'));
  static const VerificationMeta _minIntervalMeta =
      const VerificationMeta('minInterval');
  @override
  late final GeneratedColumn<int> minInterval = GeneratedColumn<int>(
      'min_interval', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(5));
  static const VerificationMeta _maxIntervalMeta =
      const VerificationMeta('maxInterval');
  @override
  late final GeneratedColumn<int> maxInterval = GeneratedColumn<int>(
      'max_interval', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(30));
  @override
  List<GeneratedColumn> get $columns =>
      [id, roomObjectId, soundId, minInterval, maxInterval];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_object_random_sounds';
  @override
  VerificationContext validateIntegrity(
      Insertable<RoomObjectRandomSound> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('room_object_id')) {
      context.handle(
          _roomObjectIdMeta,
          roomObjectId.isAcceptableOrUnknown(
              data['room_object_id']!, _roomObjectIdMeta));
    } else if (isInserting) {
      context.missing(_roomObjectIdMeta);
    }
    if (data.containsKey('sound_id')) {
      context.handle(_soundIdMeta,
          soundId.isAcceptableOrUnknown(data['sound_id']!, _soundIdMeta));
    } else if (isInserting) {
      context.missing(_soundIdMeta);
    }
    if (data.containsKey('min_interval')) {
      context.handle(
          _minIntervalMeta,
          minInterval.isAcceptableOrUnknown(
              data['min_interval']!, _minIntervalMeta));
    }
    if (data.containsKey('max_interval')) {
      context.handle(
          _maxIntervalMeta,
          maxInterval.isAcceptableOrUnknown(
              data['max_interval']!, _maxIntervalMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomObjectRandomSound map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomObjectRandomSound(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      roomObjectId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}room_object_id'])!,
      soundId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sound_id'])!,
      minInterval: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}min_interval'])!,
      maxInterval: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_interval'])!,
    );
  }

  @override
  $RoomObjectRandomSoundsTable createAlias(String alias) {
    return $RoomObjectRandomSoundsTable(attachedDatabase, alias);
  }
}

class RoomObjectRandomSound extends DataClass
    implements Insertable<RoomObjectRandomSound> {
  /// The primary key field.
  final int id;

  /// The ID of the room object which will emit this sound.
  final int roomObjectId;

  /// The ID of the sound which will be played.
  final int soundId;

  /// The minimum number of seconds which will elapse between plays of this
  /// sound.
  final int minInterval;

  /// The maximum number of seconds which will elapse between plays of this
  /// sound.
  final int maxInterval;
  const RoomObjectRandomSound(
      {required this.id,
      required this.roomObjectId,
      required this.soundId,
      required this.minInterval,
      required this.maxInterval});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['room_object_id'] = Variable<int>(roomObjectId);
    map['sound_id'] = Variable<int>(soundId);
    map['min_interval'] = Variable<int>(minInterval);
    map['max_interval'] = Variable<int>(maxInterval);
    return map;
  }

  RoomObjectRandomSoundsCompanion toCompanion(bool nullToAbsent) {
    return RoomObjectRandomSoundsCompanion(
      id: Value(id),
      roomObjectId: Value(roomObjectId),
      soundId: Value(soundId),
      minInterval: Value(minInterval),
      maxInterval: Value(maxInterval),
    );
  }

  factory RoomObjectRandomSound.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomObjectRandomSound(
      id: serializer.fromJson<int>(json['id']),
      roomObjectId: serializer.fromJson<int>(json['roomObjectId']),
      soundId: serializer.fromJson<int>(json['soundId']),
      minInterval: serializer.fromJson<int>(json['minInterval']),
      maxInterval: serializer.fromJson<int>(json['maxInterval']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'roomObjectId': serializer.toJson<int>(roomObjectId),
      'soundId': serializer.toJson<int>(soundId),
      'minInterval': serializer.toJson<int>(minInterval),
      'maxInterval': serializer.toJson<int>(maxInterval),
    };
  }

  RoomObjectRandomSound copyWith(
          {int? id,
          int? roomObjectId,
          int? soundId,
          int? minInterval,
          int? maxInterval}) =>
      RoomObjectRandomSound(
        id: id ?? this.id,
        roomObjectId: roomObjectId ?? this.roomObjectId,
        soundId: soundId ?? this.soundId,
        minInterval: minInterval ?? this.minInterval,
        maxInterval: maxInterval ?? this.maxInterval,
      );
  RoomObjectRandomSound copyWithCompanion(
      RoomObjectRandomSoundsCompanion data) {
    return RoomObjectRandomSound(
      id: data.id.present ? data.id.value : this.id,
      roomObjectId: data.roomObjectId.present
          ? data.roomObjectId.value
          : this.roomObjectId,
      soundId: data.soundId.present ? data.soundId.value : this.soundId,
      minInterval:
          data.minInterval.present ? data.minInterval.value : this.minInterval,
      maxInterval:
          data.maxInterval.present ? data.maxInterval.value : this.maxInterval,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoomObjectRandomSound(')
          ..write('id: $id, ')
          ..write('roomObjectId: $roomObjectId, ')
          ..write('soundId: $soundId, ')
          ..write('minInterval: $minInterval, ')
          ..write('maxInterval: $maxInterval')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, roomObjectId, soundId, minInterval, maxInterval);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomObjectRandomSound &&
          other.id == this.id &&
          other.roomObjectId == this.roomObjectId &&
          other.soundId == this.soundId &&
          other.minInterval == this.minInterval &&
          other.maxInterval == this.maxInterval);
}

class RoomObjectRandomSoundsCompanion
    extends UpdateCompanion<RoomObjectRandomSound> {
  final Value<int> id;
  final Value<int> roomObjectId;
  final Value<int> soundId;
  final Value<int> minInterval;
  final Value<int> maxInterval;
  const RoomObjectRandomSoundsCompanion({
    this.id = const Value.absent(),
    this.roomObjectId = const Value.absent(),
    this.soundId = const Value.absent(),
    this.minInterval = const Value.absent(),
    this.maxInterval = const Value.absent(),
  });
  RoomObjectRandomSoundsCompanion.insert({
    this.id = const Value.absent(),
    required int roomObjectId,
    required int soundId,
    this.minInterval = const Value.absent(),
    this.maxInterval = const Value.absent(),
  })  : roomObjectId = Value(roomObjectId),
        soundId = Value(soundId);
  static Insertable<RoomObjectRandomSound> custom({
    Expression<int>? id,
    Expression<int>? roomObjectId,
    Expression<int>? soundId,
    Expression<int>? minInterval,
    Expression<int>? maxInterval,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roomObjectId != null) 'room_object_id': roomObjectId,
      if (soundId != null) 'sound_id': soundId,
      if (minInterval != null) 'min_interval': minInterval,
      if (maxInterval != null) 'max_interval': maxInterval,
    });
  }

  RoomObjectRandomSoundsCompanion copyWith(
      {Value<int>? id,
      Value<int>? roomObjectId,
      Value<int>? soundId,
      Value<int>? minInterval,
      Value<int>? maxInterval}) {
    return RoomObjectRandomSoundsCompanion(
      id: id ?? this.id,
      roomObjectId: roomObjectId ?? this.roomObjectId,
      soundId: soundId ?? this.soundId,
      minInterval: minInterval ?? this.minInterval,
      maxInterval: maxInterval ?? this.maxInterval,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (roomObjectId.present) {
      map['room_object_id'] = Variable<int>(roomObjectId.value);
    }
    if (soundId.present) {
      map['sound_id'] = Variable<int>(soundId.value);
    }
    if (minInterval.present) {
      map['min_interval'] = Variable<int>(minInterval.value);
    }
    if (maxInterval.present) {
      map['max_interval'] = Variable<int>(maxInterval.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomObjectRandomSoundsCompanion(')
          ..write('id: $id, ')
          ..write('roomObjectId: $roomObjectId, ')
          ..write('soundId: $soundId, ')
          ..write('minInterval: $minInterval, ')
          ..write('maxInterval: $maxInterval')
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
  late final $RoomExitsTable roomExits = $RoomExitsTable(this);
  late final $RoomObjectsTable roomObjects = $RoomObjectsTable(this);
  late final $PlayerClassesTable playerClasses = $PlayerClassesTable(this);
  late final $GameStatsTable gameStats = $GameStatsTable(this);
  late final $RoomSurfaceBoostsTable roomSurfaceBoosts =
      $RoomSurfaceBoostsTable(this);
  late final $RoomSurfaceCostsTable roomSurfaceCosts =
      $RoomSurfaceCostsTable(this);
  late final $PlayerClassGameStatsTable playerClassGameStats =
      $PlayerClassGameStatsTable(this);
  late final $RoomObjectRandomSoundsTable roomObjectRandomSounds =
      $RoomObjectRandomSoundsTable(this);
  late final Index roomObjectCoordinatesIndex = Index(
      'room_object_coordinates_index',
      'CREATE INDEX room_object_coordinates_index ON room_objects (x, y)');
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        soundReferences,
        zones,
        roomSurfaces,
        rooms,
        roomExits,
        roomObjects,
        playerClasses,
        gameStats,
        roomSurfaceBoosts,
        roomSurfaceCosts,
        playerClassGameStats,
        roomObjectRandomSounds,
        roomObjectCoordinatesIndex
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('rooms',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_exits', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('rooms',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_objects', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('room_exits',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_objects', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('rooms',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('player_classes', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('game_stats',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('game_stats', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('room_surfaces',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_surface_boosts', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('game_stats',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_surface_boosts', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('sound_references',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_surface_boosts', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('sound_references',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_surface_boosts', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('room_surfaces',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_surface_costs', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('game_stats',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_surface_costs', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('sound_references',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_surface_costs', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('player_classes',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('player_class_game_stats', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('game_stats',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('player_class_game_stats', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('room_objects',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_object_random_sounds', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('sound_references',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_object_random_sounds', kind: UpdateKind.delete),
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
  Value<LoadMode> loadMode,
});
typedef $$SoundReferencesTableUpdateCompanionBuilder = SoundReferencesCompanion
    Function({
  Value<int> id,
  Value<String> path,
  Value<double> volume,
  Value<LoadMode> loadMode,
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
        .filter((f) => f.musicId.id.sqlEquals($_itemColumn<int>('id')!));

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
        .filter(
            (f) => f.footstepSoundId.id.sqlEquals($_itemColumn<int>('id')!));

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
        .filter((f) => f.wallSoundI.id.sqlEquals($_itemColumn<int>('id')!));

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
        .filter((f) => f.ambianceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_roomsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RoomExitsTable, List<RoomExit>>
      _roomExitsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.roomExits,
              aliasName: $_aliasNameGenerator(
                  db.soundReferences.id, db.roomExits.useSoundId));

  $$RoomExitsTableProcessedTableManager get roomExitsRefs {
    final manager = $$RoomExitsTableTableManager($_db, $_db.roomExits)
        .filter((f) => f.useSoundId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_roomExitsRefsTable($_db));
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
        .filter((f) => f.ambianceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_roomObjectsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RoomSurfaceBoostsTable, List<RoomSurfaceBoost>>
      _roomSurfaceBoostBoostSoundsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.roomSurfaceBoosts,
              aliasName: $_aliasNameGenerator(
                  db.soundReferences.id, db.roomSurfaceBoosts.boostSoundId));

  $$RoomSurfaceBoostsTableProcessedTableManager
      get roomSurfaceBoostBoostSounds {
    final manager = $$RoomSurfaceBoostsTableTableManager(
            $_db, $_db.roomSurfaceBoosts)
        .filter((f) => f.boostSoundId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_roomSurfaceBoostBoostSoundsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RoomSurfaceBoostsTable, List<RoomSurfaceBoost>>
      _roomSurfaceBoostMaxedOutSoundsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.roomSurfaceBoosts,
              aliasName: $_aliasNameGenerator(
                  db.soundReferences.id, db.roomSurfaceBoosts.maxedOutSoundId));

  $$RoomSurfaceBoostsTableProcessedTableManager
      get roomSurfaceBoostMaxedOutSounds {
    final manager = $$RoomSurfaceBoostsTableTableManager(
            $_db, $_db.roomSurfaceBoosts)
        .filter(
            (f) => f.maxedOutSoundId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult
        .readTableOrNull(_roomSurfaceBoostMaxedOutSoundsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RoomSurfaceCostsTable, List<RoomSurfaceCost>>
      _roomSurfaceCostsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.roomSurfaceCosts,
              aliasName: $_aliasNameGenerator(
                  db.soundReferences.id, db.roomSurfaceCosts.exhaustedSoundId));

  $$RoomSurfaceCostsTableProcessedTableManager get roomSurfaceCostsRefs {
    final manager =
        $$RoomSurfaceCostsTableTableManager($_db, $_db.roomSurfaceCosts).filter(
            (f) => f.exhaustedSoundId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_roomSurfaceCostsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RoomObjectRandomSoundsTable,
      List<RoomObjectRandomSound>> _roomObjectRandomSoundsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.roomObjectRandomSounds,
          aliasName: $_aliasNameGenerator(
              db.soundReferences.id, db.roomObjectRandomSounds.soundId));

  $$RoomObjectRandomSoundsTableProcessedTableManager
      get roomObjectRandomSoundsRefs {
    final manager = $$RoomObjectRandomSoundsTableTableManager(
            $_db, $_db.roomObjectRandomSounds)
        .filter((f) => f.soundId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_roomObjectRandomSoundsRefsTable($_db));
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

  ColumnWithTypeConverterFilters<LoadMode, LoadMode, int> get loadMode =>
      $composableBuilder(
          column: $table.loadMode,
          builder: (column) => ColumnWithTypeConverterFilters(column));

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

  Expression<bool> roomExitsRefs(
      Expression<bool> Function($$RoomExitsTableFilterComposer f) f) {
    final $$RoomExitsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomExits,
        getReferencedColumn: (t) => t.useSoundId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomExitsTableFilterComposer(
              $db: $db,
              $table: $db.roomExits,
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

  Expression<bool> roomSurfaceBoostBoostSounds(
      Expression<bool> Function($$RoomSurfaceBoostsTableFilterComposer f) f) {
    final $$RoomSurfaceBoostsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomSurfaceBoosts,
        getReferencedColumn: (t) => t.boostSoundId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomSurfaceBoostsTableFilterComposer(
              $db: $db,
              $table: $db.roomSurfaceBoosts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> roomSurfaceBoostMaxedOutSounds(
      Expression<bool> Function($$RoomSurfaceBoostsTableFilterComposer f) f) {
    final $$RoomSurfaceBoostsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomSurfaceBoosts,
        getReferencedColumn: (t) => t.maxedOutSoundId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomSurfaceBoostsTableFilterComposer(
              $db: $db,
              $table: $db.roomSurfaceBoosts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> roomSurfaceCostsRefs(
      Expression<bool> Function($$RoomSurfaceCostsTableFilterComposer f) f) {
    final $$RoomSurfaceCostsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomSurfaceCosts,
        getReferencedColumn: (t) => t.exhaustedSoundId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomSurfaceCostsTableFilterComposer(
              $db: $db,
              $table: $db.roomSurfaceCosts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> roomObjectRandomSoundsRefs(
      Expression<bool> Function($$RoomObjectRandomSoundsTableFilterComposer f)
          f) {
    final $$RoomObjectRandomSoundsTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.roomObjectRandomSounds,
            getReferencedColumn: (t) => t.soundId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RoomObjectRandomSoundsTableFilterComposer(
                  $db: $db,
                  $table: $db.roomObjectRandomSounds,
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

  ColumnOrderings<int> get loadMode => $composableBuilder(
      column: $table.loadMode, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumnWithTypeConverter<LoadMode, int> get loadMode =>
      $composableBuilder(column: $table.loadMode, builder: (column) => column);

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

  Expression<T> roomExitsRefs<T extends Object>(
      Expression<T> Function($$RoomExitsTableAnnotationComposer a) f) {
    final $$RoomExitsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomExits,
        getReferencedColumn: (t) => t.useSoundId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomExitsTableAnnotationComposer(
              $db: $db,
              $table: $db.roomExits,
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

  Expression<T> roomSurfaceBoostBoostSounds<T extends Object>(
      Expression<T> Function($$RoomSurfaceBoostsTableAnnotationComposer a) f) {
    final $$RoomSurfaceBoostsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.roomSurfaceBoosts,
            getReferencedColumn: (t) => t.boostSoundId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RoomSurfaceBoostsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.roomSurfaceBoosts,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> roomSurfaceBoostMaxedOutSounds<T extends Object>(
      Expression<T> Function($$RoomSurfaceBoostsTableAnnotationComposer a) f) {
    final $$RoomSurfaceBoostsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.roomSurfaceBoosts,
            getReferencedColumn: (t) => t.maxedOutSoundId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RoomSurfaceBoostsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.roomSurfaceBoosts,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> roomSurfaceCostsRefs<T extends Object>(
      Expression<T> Function($$RoomSurfaceCostsTableAnnotationComposer a) f) {
    final $$RoomSurfaceCostsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomSurfaceCosts,
        getReferencedColumn: (t) => t.exhaustedSoundId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomSurfaceCostsTableAnnotationComposer(
              $db: $db,
              $table: $db.roomSurfaceCosts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> roomObjectRandomSoundsRefs<T extends Object>(
      Expression<T> Function($$RoomObjectRandomSoundsTableAnnotationComposer a)
          f) {
    final $$RoomObjectRandomSoundsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.roomObjectRandomSounds,
            getReferencedColumn: (t) => t.soundId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RoomObjectRandomSoundsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.roomObjectRandomSounds,
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
        bool roomExitsRefs,
        bool roomObjectsRefs,
        bool roomSurfaceBoostBoostSounds,
        bool roomSurfaceBoostMaxedOutSounds,
        bool roomSurfaceCostsRefs,
        bool roomObjectRandomSoundsRefs})> {
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
            Value<LoadMode> loadMode = const Value.absent(),
          }) =>
              SoundReferencesCompanion(
            id: id,
            path: path,
            volume: volume,
            loadMode: loadMode,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String path,
            Value<double> volume = const Value.absent(),
            Value<LoadMode> loadMode = const Value.absent(),
          }) =>
              SoundReferencesCompanion.insert(
            id: id,
            path: path,
            volume: volume,
            loadMode: loadMode,
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
              roomExitsRefs = false,
              roomObjectsRefs = false,
              roomSurfaceBoostBoostSounds = false,
              roomSurfaceBoostMaxedOutSounds = false,
              roomSurfaceCostsRefs = false,
              roomObjectRandomSoundsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (zonesRefs) db.zones,
                if (footstepsSurfaces) db.roomSurfaces,
                if (wallSoundsSurfaces) db.roomSurfaces,
                if (roomsRefs) db.rooms,
                if (roomExitsRefs) db.roomExits,
                if (roomObjectsRefs) db.roomObjects,
                if (roomSurfaceBoostBoostSounds) db.roomSurfaceBoosts,
                if (roomSurfaceBoostMaxedOutSounds) db.roomSurfaceBoosts,
                if (roomSurfaceCostsRefs) db.roomSurfaceCosts,
                if (roomObjectRandomSoundsRefs) db.roomObjectRandomSounds
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
                  if (roomExitsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$SoundReferencesTableReferences
                            ._roomExitsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SoundReferencesTableReferences(db, table, p0)
                                .roomExitsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.useSoundId == item.id),
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
                        typedResults: items),
                  if (roomSurfaceBoostBoostSounds)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$SoundReferencesTableReferences
                            ._roomSurfaceBoostBoostSoundsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SoundReferencesTableReferences(db, table, p0)
                                .roomSurfaceBoostBoostSounds,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.boostSoundId == item.id),
                        typedResults: items),
                  if (roomSurfaceBoostMaxedOutSounds)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$SoundReferencesTableReferences
                            ._roomSurfaceBoostMaxedOutSoundsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SoundReferencesTableReferences(db, table, p0)
                                .roomSurfaceBoostMaxedOutSounds,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.maxedOutSoundId == item.id),
                        typedResults: items),
                  if (roomSurfaceCostsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$SoundReferencesTableReferences
                            ._roomSurfaceCostsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SoundReferencesTableReferences(db, table, p0)
                                .roomSurfaceCostsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.exhaustedSoundId == item.id),
                        typedResults: items),
                  if (roomObjectRandomSoundsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$SoundReferencesTableReferences
                            ._roomObjectRandomSoundsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SoundReferencesTableReferences(db, table, p0)
                                .roomObjectRandomSoundsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.soundId == item.id),
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
        bool roomExitsRefs,
        bool roomObjectsRefs,
        bool roomSurfaceBoostBoostSounds,
        bool roomSurfaceBoostMaxedOutSounds,
        bool roomSurfaceCostsRefs,
        bool roomObjectRandomSoundsRefs})>;
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
    final $_column = $_itemColumn<int>('music_id');
    if ($_column == null) return null;
    final manager =
        $$SoundReferencesTableTableManager($_db, $_db.soundReferences)
            .filter((f) => f.id.sqlEquals($_column));
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
        .filter((f) => f.zoneId.id.sqlEquals($_itemColumn<int>('id')!));

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
  Value<int> moveInterval,
});
typedef $$RoomSurfacesTableUpdateCompanionBuilder = RoomSurfacesCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> description,
  Value<int?> footstepSoundId,
  Value<int?> wallSoundI,
  Value<int> moveInterval,
});

final class $$RoomSurfacesTableReferences
    extends BaseReferences<_$AppDatabase, $RoomSurfacesTable, RoomSurface> {
  $$RoomSurfacesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SoundReferencesTable _footstepSoundIdTable(_$AppDatabase db) =>
      db.soundReferences.createAlias($_aliasNameGenerator(
          db.roomSurfaces.footstepSoundId, db.soundReferences.id));

  $$SoundReferencesTableProcessedTableManager? get footstepSoundId {
    final $_column = $_itemColumn<int>('footstep_sound_id');
    if ($_column == null) return null;
    final manager =
        $$SoundReferencesTableTableManager($_db, $_db.soundReferences)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_footstepSoundIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SoundReferencesTable _wallSoundITable(_$AppDatabase db) =>
      db.soundReferences.createAlias($_aliasNameGenerator(
          db.roomSurfaces.wallSoundI, db.soundReferences.id));

  $$SoundReferencesTableProcessedTableManager? get wallSoundI {
    final $_column = $_itemColumn<int>('wall_sound_i');
    if ($_column == null) return null;
    final manager =
        $$SoundReferencesTableTableManager($_db, $_db.soundReferences)
            .filter((f) => f.id.sqlEquals($_column));
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
        .filter((f) => f.surfaceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_roomsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RoomSurfaceBoostsTable, List<RoomSurfaceBoost>>
      _roomSurfaceBoostsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.roomSurfaceBoosts,
              aliasName: $_aliasNameGenerator(
                  db.roomSurfaces.id, db.roomSurfaceBoosts.roomSurfaceId));

  $$RoomSurfaceBoostsTableProcessedTableManager get roomSurfaceBoostsRefs {
    final manager = $$RoomSurfaceBoostsTableTableManager(
            $_db, $_db.roomSurfaceBoosts)
        .filter((f) => f.roomSurfaceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_roomSurfaceBoostsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RoomSurfaceCostsTable, List<RoomSurfaceCost>>
      _roomSurfaceCostsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.roomSurfaceCosts,
              aliasName: $_aliasNameGenerator(
                  db.roomSurfaces.id, db.roomSurfaceCosts.roomSurfaceId));

  $$RoomSurfaceCostsTableProcessedTableManager get roomSurfaceCostsRefs {
    final manager = $$RoomSurfaceCostsTableTableManager(
            $_db, $_db.roomSurfaceCosts)
        .filter((f) => f.roomSurfaceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_roomSurfaceCostsRefsTable($_db));
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

  ColumnFilters<int> get moveInterval => $composableBuilder(
      column: $table.moveInterval, builder: (column) => ColumnFilters(column));

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

  Expression<bool> roomSurfaceBoostsRefs(
      Expression<bool> Function($$RoomSurfaceBoostsTableFilterComposer f) f) {
    final $$RoomSurfaceBoostsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomSurfaceBoosts,
        getReferencedColumn: (t) => t.roomSurfaceId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomSurfaceBoostsTableFilterComposer(
              $db: $db,
              $table: $db.roomSurfaceBoosts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> roomSurfaceCostsRefs(
      Expression<bool> Function($$RoomSurfaceCostsTableFilterComposer f) f) {
    final $$RoomSurfaceCostsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomSurfaceCosts,
        getReferencedColumn: (t) => t.roomSurfaceId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomSurfaceCostsTableFilterComposer(
              $db: $db,
              $table: $db.roomSurfaceCosts,
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

  ColumnOrderings<int> get moveInterval => $composableBuilder(
      column: $table.moveInterval,
      builder: (column) => ColumnOrderings(column));

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

  GeneratedColumn<int> get moveInterval => $composableBuilder(
      column: $table.moveInterval, builder: (column) => column);

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

  Expression<T> roomSurfaceBoostsRefs<T extends Object>(
      Expression<T> Function($$RoomSurfaceBoostsTableAnnotationComposer a) f) {
    final $$RoomSurfaceBoostsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.roomSurfaceBoosts,
            getReferencedColumn: (t) => t.roomSurfaceId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RoomSurfaceBoostsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.roomSurfaceBoosts,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> roomSurfaceCostsRefs<T extends Object>(
      Expression<T> Function($$RoomSurfaceCostsTableAnnotationComposer a) f) {
    final $$RoomSurfaceCostsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomSurfaceCosts,
        getReferencedColumn: (t) => t.roomSurfaceId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomSurfaceCostsTableAnnotationComposer(
              $db: $db,
              $table: $db.roomSurfaceCosts,
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
        {bool footstepSoundId,
        bool wallSoundI,
        bool roomsRefs,
        bool roomSurfaceBoostsRefs,
        bool roomSurfaceCostsRefs})> {
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
            Value<int> moveInterval = const Value.absent(),
          }) =>
              RoomSurfacesCompanion(
            id: id,
            name: name,
            description: description,
            footstepSoundId: footstepSoundId,
            wallSoundI: wallSoundI,
            moveInterval: moveInterval,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String description,
            Value<int?> footstepSoundId = const Value.absent(),
            Value<int?> wallSoundI = const Value.absent(),
            Value<int> moveInterval = const Value.absent(),
          }) =>
              RoomSurfacesCompanion.insert(
            id: id,
            name: name,
            description: description,
            footstepSoundId: footstepSoundId,
            wallSoundI: wallSoundI,
            moveInterval: moveInterval,
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
              roomsRefs = false,
              roomSurfaceBoostsRefs = false,
              roomSurfaceCostsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (roomsRefs) db.rooms,
                if (roomSurfaceBoostsRefs) db.roomSurfaceBoosts,
                if (roomSurfaceCostsRefs) db.roomSurfaceCosts
              ],
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
                        typedResults: items),
                  if (roomSurfaceBoostsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$RoomSurfacesTableReferences
                            ._roomSurfaceBoostsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoomSurfacesTableReferences(db, table, p0)
                                .roomSurfaceBoostsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.roomSurfaceId == item.id),
                        typedResults: items),
                  if (roomSurfaceCostsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$RoomSurfacesTableReferences
                            ._roomSurfaceCostsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoomSurfacesTableReferences(db, table, p0)
                                .roomSurfaceCostsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.roomSurfaceId == item.id),
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
        {bool footstepSoundId,
        bool wallSoundI,
        bool roomsRefs,
        bool roomSurfaceBoostsRefs,
        bool roomSurfaceCostsRefs})>;
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
    final $_column = $_itemColumn<int>('ambiance_id');
    if ($_column == null) return null;
    final manager =
        $$SoundReferencesTableTableManager($_db, $_db.soundReferences)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ambianceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $ZonesTable _zoneIdTable(_$AppDatabase db) =>
      db.zones.createAlias($_aliasNameGenerator(db.rooms.zoneId, db.zones.id));

  $$ZonesTableProcessedTableManager get zoneId {
    final $_column = $_itemColumn<int>('zone_id')!;

    final manager = $$ZonesTableTableManager($_db, $_db.zones)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_zoneIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $RoomSurfacesTable _surfaceIdTable(_$AppDatabase db) =>
      db.roomSurfaces.createAlias(
          $_aliasNameGenerator(db.rooms.surfaceId, db.roomSurfaces.id));

  $$RoomSurfacesTableProcessedTableManager get surfaceId {
    final $_column = $_itemColumn<int>('surface_id')!;

    final manager = $$RoomSurfacesTableTableManager($_db, $_db.roomSurfaces)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_surfaceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$RoomExitsTable, List<RoomExit>>
      _roomExitsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.roomExits,
          aliasName: $_aliasNameGenerator(db.rooms.id, db.roomExits.roomId));

  $$RoomExitsTableProcessedTableManager get roomExitsRefs {
    final manager = $$RoomExitsTableTableManager($_db, $_db.roomExits)
        .filter((f) => f.roomId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_roomExitsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RoomObjectsTable, List<RoomObject>>
      _roomObjectsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.roomObjects,
          aliasName: $_aliasNameGenerator(db.rooms.id, db.roomObjects.roomId));

  $$RoomObjectsTableProcessedTableManager get roomObjectsRefs {
    final manager = $$RoomObjectsTableTableManager($_db, $_db.roomObjects)
        .filter((f) => f.roomId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_roomObjectsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PlayerClassesTable, List<PlayerClass>>
      _playerClassesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.playerClasses,
              aliasName:
                  $_aliasNameGenerator(db.rooms.id, db.playerClasses.roomId));

  $$PlayerClassesTableProcessedTableManager get playerClassesRefs {
    final manager = $$PlayerClassesTableTableManager($_db, $_db.playerClasses)
        .filter((f) => f.roomId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_playerClassesRefsTable($_db));
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

  Expression<bool> roomExitsRefs(
      Expression<bool> Function($$RoomExitsTableFilterComposer f) f) {
    final $$RoomExitsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomExits,
        getReferencedColumn: (t) => t.roomId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomExitsTableFilterComposer(
              $db: $db,
              $table: $db.roomExits,
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

  Expression<bool> playerClassesRefs(
      Expression<bool> Function($$PlayerClassesTableFilterComposer f) f) {
    final $$PlayerClassesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.playerClasses,
        getReferencedColumn: (t) => t.roomId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlayerClassesTableFilterComposer(
              $db: $db,
              $table: $db.playerClasses,
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

  Expression<T> roomExitsRefs<T extends Object>(
      Expression<T> Function($$RoomExitsTableAnnotationComposer a) f) {
    final $$RoomExitsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomExits,
        getReferencedColumn: (t) => t.roomId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomExitsTableAnnotationComposer(
              $db: $db,
              $table: $db.roomExits,
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

  Expression<T> playerClassesRefs<T extends Object>(
      Expression<T> Function($$PlayerClassesTableAnnotationComposer a) f) {
    final $$PlayerClassesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.playerClasses,
        getReferencedColumn: (t) => t.roomId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlayerClassesTableAnnotationComposer(
              $db: $db,
              $table: $db.playerClasses,
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
        {bool ambianceId,
        bool zoneId,
        bool surfaceId,
        bool roomExitsRefs,
        bool roomObjectsRefs,
        bool playerClassesRefs})> {
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
              roomExitsRefs = false,
              roomObjectsRefs = false,
              playerClassesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (roomExitsRefs) db.roomExits,
                if (roomObjectsRefs) db.roomObjects,
                if (playerClassesRefs) db.playerClasses
              ],
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
                  if (roomExitsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$RoomsTableReferences._roomExitsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoomsTableReferences(db, table, p0).roomExitsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.roomId == item.id),
                        typedResults: items),
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
                        typedResults: items),
                  if (playerClassesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$RoomsTableReferences._playerClassesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoomsTableReferences(db, table, p0)
                                .playerClassesRefs,
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
        {bool ambianceId,
        bool zoneId,
        bool surfaceId,
        bool roomExitsRefs,
        bool roomObjectsRefs,
        bool playerClassesRefs})>;
typedef $$RoomExitsTableCreateCompanionBuilder = RoomExitsCompanion Function({
  Value<int> id,
  required int roomId,
  Value<int> x,
  Value<int> y,
  Value<int?> useSoundId,
});
typedef $$RoomExitsTableUpdateCompanionBuilder = RoomExitsCompanion Function({
  Value<int> id,
  Value<int> roomId,
  Value<int> x,
  Value<int> y,
  Value<int?> useSoundId,
});

final class $$RoomExitsTableReferences
    extends BaseReferences<_$AppDatabase, $RoomExitsTable, RoomExit> {
  $$RoomExitsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RoomsTable _roomIdTable(_$AppDatabase db) => db.rooms
      .createAlias($_aliasNameGenerator(db.roomExits.roomId, db.rooms.id));

  $$RoomsTableProcessedTableManager get roomId {
    final $_column = $_itemColumn<int>('room_id')!;

    final manager = $$RoomsTableTableManager($_db, $_db.rooms)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roomIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SoundReferencesTable _useSoundIdTable(_$AppDatabase db) =>
      db.soundReferences.createAlias(
          $_aliasNameGenerator(db.roomExits.useSoundId, db.soundReferences.id));

  $$SoundReferencesTableProcessedTableManager? get useSoundId {
    final $_column = $_itemColumn<int>('use_sound_id');
    if ($_column == null) return null;
    final manager =
        $$SoundReferencesTableTableManager($_db, $_db.soundReferences)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_useSoundIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$RoomObjectsTable, List<RoomObject>>
      _roomObjectsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.roomObjects,
          aliasName:
              $_aliasNameGenerator(db.roomExits.id, db.roomObjects.roomExitId));

  $$RoomObjectsTableProcessedTableManager get roomObjectsRefs {
    final manager = $$RoomObjectsTableTableManager($_db, $_db.roomObjects)
        .filter((f) => f.roomExitId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_roomObjectsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$RoomExitsTableFilterComposer
    extends Composer<_$AppDatabase, $RoomExitsTable> {
  $$RoomExitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get x => $composableBuilder(
      column: $table.x, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get y => $composableBuilder(
      column: $table.y, builder: (column) => ColumnFilters(column));

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

  $$SoundReferencesTableFilterComposer get useSoundId {
    final $$SoundReferencesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.useSoundId,
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

  Expression<bool> roomObjectsRefs(
      Expression<bool> Function($$RoomObjectsTableFilterComposer f) f) {
    final $$RoomObjectsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomObjects,
        getReferencedColumn: (t) => t.roomExitId,
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

class $$RoomExitsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoomExitsTable> {
  $$RoomExitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get x => $composableBuilder(
      column: $table.x, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get y => $composableBuilder(
      column: $table.y, builder: (column) => ColumnOrderings(column));

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

  $$SoundReferencesTableOrderingComposer get useSoundId {
    final $$SoundReferencesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.useSoundId,
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

class $$RoomExitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoomExitsTable> {
  $$RoomExitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get x =>
      $composableBuilder(column: $table.x, builder: (column) => column);

  GeneratedColumn<int> get y =>
      $composableBuilder(column: $table.y, builder: (column) => column);

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

  $$SoundReferencesTableAnnotationComposer get useSoundId {
    final $$SoundReferencesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.useSoundId,
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

  Expression<T> roomObjectsRefs<T extends Object>(
      Expression<T> Function($$RoomObjectsTableAnnotationComposer a) f) {
    final $$RoomObjectsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomObjects,
        getReferencedColumn: (t) => t.roomExitId,
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

class $$RoomExitsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoomExitsTable,
    RoomExit,
    $$RoomExitsTableFilterComposer,
    $$RoomExitsTableOrderingComposer,
    $$RoomExitsTableAnnotationComposer,
    $$RoomExitsTableCreateCompanionBuilder,
    $$RoomExitsTableUpdateCompanionBuilder,
    (RoomExit, $$RoomExitsTableReferences),
    RoomExit,
    PrefetchHooks Function(
        {bool roomId, bool useSoundId, bool roomObjectsRefs})> {
  $$RoomExitsTableTableManager(_$AppDatabase db, $RoomExitsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomExitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomExitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomExitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> roomId = const Value.absent(),
            Value<int> x = const Value.absent(),
            Value<int> y = const Value.absent(),
            Value<int?> useSoundId = const Value.absent(),
          }) =>
              RoomExitsCompanion(
            id: id,
            roomId: roomId,
            x: x,
            y: y,
            useSoundId: useSoundId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int roomId,
            Value<int> x = const Value.absent(),
            Value<int> y = const Value.absent(),
            Value<int?> useSoundId = const Value.absent(),
          }) =>
              RoomExitsCompanion.insert(
            id: id,
            roomId: roomId,
            x: x,
            y: y,
            useSoundId: useSoundId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RoomExitsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {roomId = false, useSoundId = false, roomObjectsRefs = false}) {
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
                if (roomId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.roomId,
                    referencedTable:
                        $$RoomExitsTableReferences._roomIdTable(db),
                    referencedColumn:
                        $$RoomExitsTableReferences._roomIdTable(db).id,
                  ) as T;
                }
                if (useSoundId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.useSoundId,
                    referencedTable:
                        $$RoomExitsTableReferences._useSoundIdTable(db),
                    referencedColumn:
                        $$RoomExitsTableReferences._useSoundIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (roomObjectsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$RoomExitsTableReferences
                            ._roomObjectsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoomExitsTableReferences(db, table, p0)
                                .roomObjectsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.roomExitId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$RoomExitsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RoomExitsTable,
    RoomExit,
    $$RoomExitsTableFilterComposer,
    $$RoomExitsTableOrderingComposer,
    $$RoomExitsTableAnnotationComposer,
    $$RoomExitsTableCreateCompanionBuilder,
    $$RoomExitsTableUpdateCompanionBuilder,
    (RoomExit, $$RoomExitsTableReferences),
    RoomExit,
    PrefetchHooks Function(
        {bool roomId, bool useSoundId, bool roomObjectsRefs})>;
typedef $$RoomObjectsTableCreateCompanionBuilder = RoomObjectsCompanion
    Function({
  Value<int> id,
  required String name,
  required String description,
  Value<int?> ambianceId,
  required int roomId,
  Value<int> x,
  Value<int> y,
  Value<int?> roomExitId,
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
  Value<int?> roomExitId,
});

final class $$RoomObjectsTableReferences
    extends BaseReferences<_$AppDatabase, $RoomObjectsTable, RoomObject> {
  $$RoomObjectsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SoundReferencesTable _ambianceIdTable(_$AppDatabase db) =>
      db.soundReferences.createAlias($_aliasNameGenerator(
          db.roomObjects.ambianceId, db.soundReferences.id));

  $$SoundReferencesTableProcessedTableManager? get ambianceId {
    final $_column = $_itemColumn<int>('ambiance_id');
    if ($_column == null) return null;
    final manager =
        $$SoundReferencesTableTableManager($_db, $_db.soundReferences)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ambianceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $RoomsTable _roomIdTable(_$AppDatabase db) => db.rooms
      .createAlias($_aliasNameGenerator(db.roomObjects.roomId, db.rooms.id));

  $$RoomsTableProcessedTableManager get roomId {
    final $_column = $_itemColumn<int>('room_id')!;

    final manager = $$RoomsTableTableManager($_db, $_db.rooms)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roomIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $RoomExitsTable _roomExitIdTable(_$AppDatabase db) =>
      db.roomExits.createAlias(
          $_aliasNameGenerator(db.roomObjects.roomExitId, db.roomExits.id));

  $$RoomExitsTableProcessedTableManager? get roomExitId {
    final $_column = $_itemColumn<int>('room_exit_id');
    if ($_column == null) return null;
    final manager = $$RoomExitsTableTableManager($_db, $_db.roomExits)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roomExitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$RoomObjectRandomSoundsTable,
      List<RoomObjectRandomSound>> _roomObjectRandomSoundsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.roomObjectRandomSounds,
          aliasName: $_aliasNameGenerator(
              db.roomObjects.id, db.roomObjectRandomSounds.roomObjectId));

  $$RoomObjectRandomSoundsTableProcessedTableManager
      get roomObjectRandomSoundsRefs {
    final manager = $$RoomObjectRandomSoundsTableTableManager(
            $_db, $_db.roomObjectRandomSounds)
        .filter((f) => f.roomObjectId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_roomObjectRandomSoundsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
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

  $$RoomExitsTableFilterComposer get roomExitId {
    final $$RoomExitsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomExitId,
        referencedTable: $db.roomExits,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomExitsTableFilterComposer(
              $db: $db,
              $table: $db.roomExits,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> roomObjectRandomSoundsRefs(
      Expression<bool> Function($$RoomObjectRandomSoundsTableFilterComposer f)
          f) {
    final $$RoomObjectRandomSoundsTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.roomObjectRandomSounds,
            getReferencedColumn: (t) => t.roomObjectId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RoomObjectRandomSoundsTableFilterComposer(
                  $db: $db,
                  $table: $db.roomObjectRandomSounds,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
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

  $$RoomExitsTableOrderingComposer get roomExitId {
    final $$RoomExitsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomExitId,
        referencedTable: $db.roomExits,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomExitsTableOrderingComposer(
              $db: $db,
              $table: $db.roomExits,
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

  $$RoomExitsTableAnnotationComposer get roomExitId {
    final $$RoomExitsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomExitId,
        referencedTable: $db.roomExits,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomExitsTableAnnotationComposer(
              $db: $db,
              $table: $db.roomExits,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> roomObjectRandomSoundsRefs<T extends Object>(
      Expression<T> Function($$RoomObjectRandomSoundsTableAnnotationComposer a)
          f) {
    final $$RoomObjectRandomSoundsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.roomObjectRandomSounds,
            getReferencedColumn: (t) => t.roomObjectId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RoomObjectRandomSoundsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.roomObjectRandomSounds,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
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
    PrefetchHooks Function(
        {bool ambianceId,
        bool roomId,
        bool roomExitId,
        bool roomObjectRandomSoundsRefs})> {
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
            Value<int?> roomExitId = const Value.absent(),
          }) =>
              RoomObjectsCompanion(
            id: id,
            name: name,
            description: description,
            ambianceId: ambianceId,
            roomId: roomId,
            x: x,
            y: y,
            roomExitId: roomExitId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String description,
            Value<int?> ambianceId = const Value.absent(),
            required int roomId,
            Value<int> x = const Value.absent(),
            Value<int> y = const Value.absent(),
            Value<int?> roomExitId = const Value.absent(),
          }) =>
              RoomObjectsCompanion.insert(
            id: id,
            name: name,
            description: description,
            ambianceId: ambianceId,
            roomId: roomId,
            x: x,
            y: y,
            roomExitId: roomExitId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RoomObjectsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {ambianceId = false,
              roomId = false,
              roomExitId = false,
              roomObjectRandomSoundsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (roomObjectRandomSoundsRefs) db.roomObjectRandomSounds
              ],
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
                if (roomExitId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.roomExitId,
                    referencedTable:
                        $$RoomObjectsTableReferences._roomExitIdTable(db),
                    referencedColumn:
                        $$RoomObjectsTableReferences._roomExitIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (roomObjectRandomSoundsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$RoomObjectsTableReferences
                            ._roomObjectRandomSoundsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoomObjectsTableReferences(db, table, p0)
                                .roomObjectRandomSoundsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.roomObjectId == item.id),
                        typedResults: items)
                ];
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
    PrefetchHooks Function(
        {bool ambianceId,
        bool roomId,
        bool roomExitId,
        bool roomObjectRandomSoundsRefs})>;
typedef $$PlayerClassesTableCreateCompanionBuilder = PlayerClassesCompanion
    Function({
  Value<int> id,
  required String name,
  required String description,
  required int roomId,
  Value<int> x,
  Value<int> y,
});
typedef $$PlayerClassesTableUpdateCompanionBuilder = PlayerClassesCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> description,
  Value<int> roomId,
  Value<int> x,
  Value<int> y,
});

final class $$PlayerClassesTableReferences
    extends BaseReferences<_$AppDatabase, $PlayerClassesTable, PlayerClass> {
  $$PlayerClassesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $RoomsTable _roomIdTable(_$AppDatabase db) => db.rooms
      .createAlias($_aliasNameGenerator(db.playerClasses.roomId, db.rooms.id));

  $$RoomsTableProcessedTableManager get roomId {
    final $_column = $_itemColumn<int>('room_id')!;

    final manager = $$RoomsTableTableManager($_db, $_db.rooms)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roomIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$PlayerClassGameStatsTable,
      List<PlayerClassGameStat>> _playerClassGameStatsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.playerClassGameStats,
          aliasName: $_aliasNameGenerator(
              db.playerClasses.id, db.playerClassGameStats.playerClassId));

  $$PlayerClassGameStatsTableProcessedTableManager
      get playerClassGameStatsRefs {
    final manager = $$PlayerClassGameStatsTableTableManager(
            $_db, $_db.playerClassGameStats)
        .filter((f) => f.playerClassId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_playerClassGameStatsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PlayerClassesTableFilterComposer
    extends Composer<_$AppDatabase, $PlayerClassesTable> {
  $$PlayerClassesTableFilterComposer({
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

  Expression<bool> playerClassGameStatsRefs(
      Expression<bool> Function($$PlayerClassGameStatsTableFilterComposer f)
          f) {
    final $$PlayerClassGameStatsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.playerClassGameStats,
        getReferencedColumn: (t) => t.playerClassId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlayerClassGameStatsTableFilterComposer(
              $db: $db,
              $table: $db.playerClassGameStats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PlayerClassesTableOrderingComposer
    extends Composer<_$AppDatabase, $PlayerClassesTable> {
  $$PlayerClassesTableOrderingComposer({
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

class $$PlayerClassesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlayerClassesTable> {
  $$PlayerClassesTableAnnotationComposer({
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

  Expression<T> playerClassGameStatsRefs<T extends Object>(
      Expression<T> Function($$PlayerClassGameStatsTableAnnotationComposer a)
          f) {
    final $$PlayerClassGameStatsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.playerClassGameStats,
            getReferencedColumn: (t) => t.playerClassId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PlayerClassGameStatsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.playerClassGameStats,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$PlayerClassesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlayerClassesTable,
    PlayerClass,
    $$PlayerClassesTableFilterComposer,
    $$PlayerClassesTableOrderingComposer,
    $$PlayerClassesTableAnnotationComposer,
    $$PlayerClassesTableCreateCompanionBuilder,
    $$PlayerClassesTableUpdateCompanionBuilder,
    (PlayerClass, $$PlayerClassesTableReferences),
    PlayerClass,
    PrefetchHooks Function({bool roomId, bool playerClassGameStatsRefs})> {
  $$PlayerClassesTableTableManager(_$AppDatabase db, $PlayerClassesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayerClassesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayerClassesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayerClassesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> roomId = const Value.absent(),
            Value<int> x = const Value.absent(),
            Value<int> y = const Value.absent(),
          }) =>
              PlayerClassesCompanion(
            id: id,
            name: name,
            description: description,
            roomId: roomId,
            x: x,
            y: y,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String description,
            required int roomId,
            Value<int> x = const Value.absent(),
            Value<int> y = const Value.absent(),
          }) =>
              PlayerClassesCompanion.insert(
            id: id,
            name: name,
            description: description,
            roomId: roomId,
            x: x,
            y: y,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PlayerClassesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {roomId = false, playerClassGameStatsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (playerClassGameStatsRefs) db.playerClassGameStats
              ],
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
                if (roomId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.roomId,
                    referencedTable:
                        $$PlayerClassesTableReferences._roomIdTable(db),
                    referencedColumn:
                        $$PlayerClassesTableReferences._roomIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (playerClassGameStatsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$PlayerClassesTableReferences
                            ._playerClassGameStatsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlayerClassesTableReferences(db, table, p0)
                                .playerClassGameStatsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.playerClassId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PlayerClassesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PlayerClassesTable,
    PlayerClass,
    $$PlayerClassesTableFilterComposer,
    $$PlayerClassesTableOrderingComposer,
    $$PlayerClassesTableAnnotationComposer,
    $$PlayerClassesTableCreateCompanionBuilder,
    $$PlayerClassesTableUpdateCompanionBuilder,
    (PlayerClass, $$PlayerClassesTableReferences),
    PlayerClass,
    PrefetchHooks Function({bool roomId, bool playerClassGameStatsRefs})>;
typedef $$GameStatsTableCreateCompanionBuilder = GameStatsCompanion Function({
  Value<int> id,
  required String name,
  required String description,
  Value<int> defaultValue,
  Value<bool> isVisible,
  Value<int?> maxGameStatId,
  Value<MathematicalOperator> mathematicalOperator,
  Value<int> maxValueMultiplier,
});
typedef $$GameStatsTableUpdateCompanionBuilder = GameStatsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> description,
  Value<int> defaultValue,
  Value<bool> isVisible,
  Value<int?> maxGameStatId,
  Value<MathematicalOperator> mathematicalOperator,
  Value<int> maxValueMultiplier,
});

final class $$GameStatsTableReferences
    extends BaseReferences<_$AppDatabase, $GameStatsTable, GameStat> {
  $$GameStatsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GameStatsTable _maxGameStatIdTable(_$AppDatabase db) =>
      db.gameStats.createAlias(
          $_aliasNameGenerator(db.gameStats.maxGameStatId, db.gameStats.id));

  $$GameStatsTableProcessedTableManager? get maxGameStatId {
    final $_column = $_itemColumn<int>('max_game_stat_id');
    if ($_column == null) return null;
    final manager = $$GameStatsTableTableManager($_db, $_db.gameStats)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_maxGameStatIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$RoomSurfaceBoostsTable, List<RoomSurfaceBoost>>
      _roomSurfaceBoostsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.roomSurfaceBoosts,
              aliasName: $_aliasNameGenerator(
                  db.gameStats.id, db.roomSurfaceBoosts.gameStatId));

  $$RoomSurfaceBoostsTableProcessedTableManager get roomSurfaceBoostsRefs {
    final manager =
        $$RoomSurfaceBoostsTableTableManager($_db, $_db.roomSurfaceBoosts)
            .filter((f) => f.gameStatId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_roomSurfaceBoostsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RoomSurfaceCostsTable, List<RoomSurfaceCost>>
      _roomSurfaceCostsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.roomSurfaceCosts,
              aliasName: $_aliasNameGenerator(
                  db.gameStats.id, db.roomSurfaceCosts.gameStatId));

  $$RoomSurfaceCostsTableProcessedTableManager get roomSurfaceCostsRefs {
    final manager =
        $$RoomSurfaceCostsTableTableManager($_db, $_db.roomSurfaceCosts)
            .filter((f) => f.gameStatId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_roomSurfaceCostsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PlayerClassGameStatsTable,
      List<PlayerClassGameStat>> _playerClassGameStatsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.playerClassGameStats,
          aliasName: $_aliasNameGenerator(
              db.gameStats.id, db.playerClassGameStats.gameStatId));

  $$PlayerClassGameStatsTableProcessedTableManager
      get playerClassGameStatsRefs {
    final manager =
        $$PlayerClassGameStatsTableTableManager($_db, $_db.playerClassGameStats)
            .filter((f) => f.gameStatId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_playerClassGameStatsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GameStatsTableFilterComposer
    extends Composer<_$AppDatabase, $GameStatsTable> {
  $$GameStatsTableFilterComposer({
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

  ColumnFilters<int> get defaultValue => $composableBuilder(
      column: $table.defaultValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isVisible => $composableBuilder(
      column: $table.isVisible, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<MathematicalOperator, MathematicalOperator,
          int>
      get mathematicalOperator => $composableBuilder(
          column: $table.mathematicalOperator,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get maxValueMultiplier => $composableBuilder(
      column: $table.maxValueMultiplier,
      builder: (column) => ColumnFilters(column));

  $$GameStatsTableFilterComposer get maxGameStatId {
    final $$GameStatsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.maxGameStatId,
        referencedTable: $db.gameStats,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GameStatsTableFilterComposer(
              $db: $db,
              $table: $db.gameStats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> roomSurfaceBoostsRefs(
      Expression<bool> Function($$RoomSurfaceBoostsTableFilterComposer f) f) {
    final $$RoomSurfaceBoostsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomSurfaceBoosts,
        getReferencedColumn: (t) => t.gameStatId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomSurfaceBoostsTableFilterComposer(
              $db: $db,
              $table: $db.roomSurfaceBoosts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> roomSurfaceCostsRefs(
      Expression<bool> Function($$RoomSurfaceCostsTableFilterComposer f) f) {
    final $$RoomSurfaceCostsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomSurfaceCosts,
        getReferencedColumn: (t) => t.gameStatId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomSurfaceCostsTableFilterComposer(
              $db: $db,
              $table: $db.roomSurfaceCosts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> playerClassGameStatsRefs(
      Expression<bool> Function($$PlayerClassGameStatsTableFilterComposer f)
          f) {
    final $$PlayerClassGameStatsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.playerClassGameStats,
        getReferencedColumn: (t) => t.gameStatId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlayerClassGameStatsTableFilterComposer(
              $db: $db,
              $table: $db.playerClassGameStats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$GameStatsTableOrderingComposer
    extends Composer<_$AppDatabase, $GameStatsTable> {
  $$GameStatsTableOrderingComposer({
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

  ColumnOrderings<int> get defaultValue => $composableBuilder(
      column: $table.defaultValue,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isVisible => $composableBuilder(
      column: $table.isVisible, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get mathematicalOperator => $composableBuilder(
      column: $table.mathematicalOperator,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxValueMultiplier => $composableBuilder(
      column: $table.maxValueMultiplier,
      builder: (column) => ColumnOrderings(column));

  $$GameStatsTableOrderingComposer get maxGameStatId {
    final $$GameStatsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.maxGameStatId,
        referencedTable: $db.gameStats,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GameStatsTableOrderingComposer(
              $db: $db,
              $table: $db.gameStats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$GameStatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GameStatsTable> {
  $$GameStatsTableAnnotationComposer({
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

  GeneratedColumn<int> get defaultValue => $composableBuilder(
      column: $table.defaultValue, builder: (column) => column);

  GeneratedColumn<bool> get isVisible =>
      $composableBuilder(column: $table.isVisible, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MathematicalOperator, int>
      get mathematicalOperator => $composableBuilder(
          column: $table.mathematicalOperator, builder: (column) => column);

  GeneratedColumn<int> get maxValueMultiplier => $composableBuilder(
      column: $table.maxValueMultiplier, builder: (column) => column);

  $$GameStatsTableAnnotationComposer get maxGameStatId {
    final $$GameStatsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.maxGameStatId,
        referencedTable: $db.gameStats,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GameStatsTableAnnotationComposer(
              $db: $db,
              $table: $db.gameStats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> roomSurfaceBoostsRefs<T extends Object>(
      Expression<T> Function($$RoomSurfaceBoostsTableAnnotationComposer a) f) {
    final $$RoomSurfaceBoostsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.roomSurfaceBoosts,
            getReferencedColumn: (t) => t.gameStatId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RoomSurfaceBoostsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.roomSurfaceBoosts,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> roomSurfaceCostsRefs<T extends Object>(
      Expression<T> Function($$RoomSurfaceCostsTableAnnotationComposer a) f) {
    final $$RoomSurfaceCostsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomSurfaceCosts,
        getReferencedColumn: (t) => t.gameStatId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomSurfaceCostsTableAnnotationComposer(
              $db: $db,
              $table: $db.roomSurfaceCosts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> playerClassGameStatsRefs<T extends Object>(
      Expression<T> Function($$PlayerClassGameStatsTableAnnotationComposer a)
          f) {
    final $$PlayerClassGameStatsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.playerClassGameStats,
            getReferencedColumn: (t) => t.gameStatId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$PlayerClassGameStatsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.playerClassGameStats,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$GameStatsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GameStatsTable,
    GameStat,
    $$GameStatsTableFilterComposer,
    $$GameStatsTableOrderingComposer,
    $$GameStatsTableAnnotationComposer,
    $$GameStatsTableCreateCompanionBuilder,
    $$GameStatsTableUpdateCompanionBuilder,
    (GameStat, $$GameStatsTableReferences),
    GameStat,
    PrefetchHooks Function(
        {bool maxGameStatId,
        bool roomSurfaceBoostsRefs,
        bool roomSurfaceCostsRefs,
        bool playerClassGameStatsRefs})> {
  $$GameStatsTableTableManager(_$AppDatabase db, $GameStatsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameStatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameStatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameStatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> defaultValue = const Value.absent(),
            Value<bool> isVisible = const Value.absent(),
            Value<int?> maxGameStatId = const Value.absent(),
            Value<MathematicalOperator> mathematicalOperator =
                const Value.absent(),
            Value<int> maxValueMultiplier = const Value.absent(),
          }) =>
              GameStatsCompanion(
            id: id,
            name: name,
            description: description,
            defaultValue: defaultValue,
            isVisible: isVisible,
            maxGameStatId: maxGameStatId,
            mathematicalOperator: mathematicalOperator,
            maxValueMultiplier: maxValueMultiplier,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String description,
            Value<int> defaultValue = const Value.absent(),
            Value<bool> isVisible = const Value.absent(),
            Value<int?> maxGameStatId = const Value.absent(),
            Value<MathematicalOperator> mathematicalOperator =
                const Value.absent(),
            Value<int> maxValueMultiplier = const Value.absent(),
          }) =>
              GameStatsCompanion.insert(
            id: id,
            name: name,
            description: description,
            defaultValue: defaultValue,
            isVisible: isVisible,
            maxGameStatId: maxGameStatId,
            mathematicalOperator: mathematicalOperator,
            maxValueMultiplier: maxValueMultiplier,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$GameStatsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {maxGameStatId = false,
              roomSurfaceBoostsRefs = false,
              roomSurfaceCostsRefs = false,
              playerClassGameStatsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (roomSurfaceBoostsRefs) db.roomSurfaceBoosts,
                if (roomSurfaceCostsRefs) db.roomSurfaceCosts,
                if (playerClassGameStatsRefs) db.playerClassGameStats
              ],
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
                if (maxGameStatId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.maxGameStatId,
                    referencedTable:
                        $$GameStatsTableReferences._maxGameStatIdTable(db),
                    referencedColumn:
                        $$GameStatsTableReferences._maxGameStatIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (roomSurfaceBoostsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$GameStatsTableReferences
                            ._roomSurfaceBoostsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GameStatsTableReferences(db, table, p0)
                                .roomSurfaceBoostsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.gameStatId == item.id),
                        typedResults: items),
                  if (roomSurfaceCostsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$GameStatsTableReferences
                            ._roomSurfaceCostsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GameStatsTableReferences(db, table, p0)
                                .roomSurfaceCostsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.gameStatId == item.id),
                        typedResults: items),
                  if (playerClassGameStatsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$GameStatsTableReferences
                            ._playerClassGameStatsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GameStatsTableReferences(db, table, p0)
                                .playerClassGameStatsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.gameStatId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$GameStatsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GameStatsTable,
    GameStat,
    $$GameStatsTableFilterComposer,
    $$GameStatsTableOrderingComposer,
    $$GameStatsTableAnnotationComposer,
    $$GameStatsTableCreateCompanionBuilder,
    $$GameStatsTableUpdateCompanionBuilder,
    (GameStat, $$GameStatsTableReferences),
    GameStat,
    PrefetchHooks Function(
        {bool maxGameStatId,
        bool roomSurfaceBoostsRefs,
        bool roomSurfaceCostsRefs,
        bool playerClassGameStatsRefs})>;
typedef $$RoomSurfaceBoostsTableCreateCompanionBuilder
    = RoomSurfaceBoostsCompanion Function({
  Value<int> id,
  required int roomSurfaceId,
  required int gameStatId,
  Value<int> interval,
  Value<int> boost,
  Value<int?> boostSoundId,
  Value<int?> maxedOutSoundId,
});
typedef $$RoomSurfaceBoostsTableUpdateCompanionBuilder
    = RoomSurfaceBoostsCompanion Function({
  Value<int> id,
  Value<int> roomSurfaceId,
  Value<int> gameStatId,
  Value<int> interval,
  Value<int> boost,
  Value<int?> boostSoundId,
  Value<int?> maxedOutSoundId,
});

final class $$RoomSurfaceBoostsTableReferences extends BaseReferences<
    _$AppDatabase, $RoomSurfaceBoostsTable, RoomSurfaceBoost> {
  $$RoomSurfaceBoostsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $RoomSurfacesTable _roomSurfaceIdTable(_$AppDatabase db) =>
      db.roomSurfaces.createAlias($_aliasNameGenerator(
          db.roomSurfaceBoosts.roomSurfaceId, db.roomSurfaces.id));

  $$RoomSurfacesTableProcessedTableManager get roomSurfaceId {
    final $_column = $_itemColumn<int>('room_surface_id')!;

    final manager = $$RoomSurfacesTableTableManager($_db, $_db.roomSurfaces)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roomSurfaceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GameStatsTable _gameStatIdTable(_$AppDatabase db) =>
      db.gameStats.createAlias($_aliasNameGenerator(
          db.roomSurfaceBoosts.gameStatId, db.gameStats.id));

  $$GameStatsTableProcessedTableManager get gameStatId {
    final $_column = $_itemColumn<int>('game_stat_id')!;

    final manager = $$GameStatsTableTableManager($_db, $_db.gameStats)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_gameStatIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SoundReferencesTable _boostSoundIdTable(_$AppDatabase db) =>
      db.soundReferences.createAlias($_aliasNameGenerator(
          db.roomSurfaceBoosts.boostSoundId, db.soundReferences.id));

  $$SoundReferencesTableProcessedTableManager? get boostSoundId {
    final $_column = $_itemColumn<int>('boost_sound_id');
    if ($_column == null) return null;
    final manager =
        $$SoundReferencesTableTableManager($_db, $_db.soundReferences)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_boostSoundIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SoundReferencesTable _maxedOutSoundIdTable(_$AppDatabase db) =>
      db.soundReferences.createAlias($_aliasNameGenerator(
          db.roomSurfaceBoosts.maxedOutSoundId, db.soundReferences.id));

  $$SoundReferencesTableProcessedTableManager? get maxedOutSoundId {
    final $_column = $_itemColumn<int>('maxed_out_sound_id');
    if ($_column == null) return null;
    final manager =
        $$SoundReferencesTableTableManager($_db, $_db.soundReferences)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_maxedOutSoundIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RoomSurfaceBoostsTableFilterComposer
    extends Composer<_$AppDatabase, $RoomSurfaceBoostsTable> {
  $$RoomSurfaceBoostsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get interval => $composableBuilder(
      column: $table.interval, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get boost => $composableBuilder(
      column: $table.boost, builder: (column) => ColumnFilters(column));

  $$RoomSurfacesTableFilterComposer get roomSurfaceId {
    final $$RoomSurfacesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomSurfaceId,
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

  $$GameStatsTableFilterComposer get gameStatId {
    final $$GameStatsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gameStatId,
        referencedTable: $db.gameStats,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GameStatsTableFilterComposer(
              $db: $db,
              $table: $db.gameStats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SoundReferencesTableFilterComposer get boostSoundId {
    final $$SoundReferencesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.boostSoundId,
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

  $$SoundReferencesTableFilterComposer get maxedOutSoundId {
    final $$SoundReferencesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.maxedOutSoundId,
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

class $$RoomSurfaceBoostsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoomSurfaceBoostsTable> {
  $$RoomSurfaceBoostsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get interval => $composableBuilder(
      column: $table.interval, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get boost => $composableBuilder(
      column: $table.boost, builder: (column) => ColumnOrderings(column));

  $$RoomSurfacesTableOrderingComposer get roomSurfaceId {
    final $$RoomSurfacesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomSurfaceId,
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

  $$GameStatsTableOrderingComposer get gameStatId {
    final $$GameStatsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gameStatId,
        referencedTable: $db.gameStats,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GameStatsTableOrderingComposer(
              $db: $db,
              $table: $db.gameStats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SoundReferencesTableOrderingComposer get boostSoundId {
    final $$SoundReferencesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.boostSoundId,
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

  $$SoundReferencesTableOrderingComposer get maxedOutSoundId {
    final $$SoundReferencesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.maxedOutSoundId,
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

class $$RoomSurfaceBoostsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoomSurfaceBoostsTable> {
  $$RoomSurfaceBoostsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get interval =>
      $composableBuilder(column: $table.interval, builder: (column) => column);

  GeneratedColumn<int> get boost =>
      $composableBuilder(column: $table.boost, builder: (column) => column);

  $$RoomSurfacesTableAnnotationComposer get roomSurfaceId {
    final $$RoomSurfacesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomSurfaceId,
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

  $$GameStatsTableAnnotationComposer get gameStatId {
    final $$GameStatsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gameStatId,
        referencedTable: $db.gameStats,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GameStatsTableAnnotationComposer(
              $db: $db,
              $table: $db.gameStats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SoundReferencesTableAnnotationComposer get boostSoundId {
    final $$SoundReferencesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.boostSoundId,
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

  $$SoundReferencesTableAnnotationComposer get maxedOutSoundId {
    final $$SoundReferencesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.maxedOutSoundId,
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

class $$RoomSurfaceBoostsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoomSurfaceBoostsTable,
    RoomSurfaceBoost,
    $$RoomSurfaceBoostsTableFilterComposer,
    $$RoomSurfaceBoostsTableOrderingComposer,
    $$RoomSurfaceBoostsTableAnnotationComposer,
    $$RoomSurfaceBoostsTableCreateCompanionBuilder,
    $$RoomSurfaceBoostsTableUpdateCompanionBuilder,
    (RoomSurfaceBoost, $$RoomSurfaceBoostsTableReferences),
    RoomSurfaceBoost,
    PrefetchHooks Function(
        {bool roomSurfaceId,
        bool gameStatId,
        bool boostSoundId,
        bool maxedOutSoundId})> {
  $$RoomSurfaceBoostsTableTableManager(
      _$AppDatabase db, $RoomSurfaceBoostsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomSurfaceBoostsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomSurfaceBoostsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomSurfaceBoostsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> roomSurfaceId = const Value.absent(),
            Value<int> gameStatId = const Value.absent(),
            Value<int> interval = const Value.absent(),
            Value<int> boost = const Value.absent(),
            Value<int?> boostSoundId = const Value.absent(),
            Value<int?> maxedOutSoundId = const Value.absent(),
          }) =>
              RoomSurfaceBoostsCompanion(
            id: id,
            roomSurfaceId: roomSurfaceId,
            gameStatId: gameStatId,
            interval: interval,
            boost: boost,
            boostSoundId: boostSoundId,
            maxedOutSoundId: maxedOutSoundId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int roomSurfaceId,
            required int gameStatId,
            Value<int> interval = const Value.absent(),
            Value<int> boost = const Value.absent(),
            Value<int?> boostSoundId = const Value.absent(),
            Value<int?> maxedOutSoundId = const Value.absent(),
          }) =>
              RoomSurfaceBoostsCompanion.insert(
            id: id,
            roomSurfaceId: roomSurfaceId,
            gameStatId: gameStatId,
            interval: interval,
            boost: boost,
            boostSoundId: boostSoundId,
            maxedOutSoundId: maxedOutSoundId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RoomSurfaceBoostsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {roomSurfaceId = false,
              gameStatId = false,
              boostSoundId = false,
              maxedOutSoundId = false}) {
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
                if (roomSurfaceId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.roomSurfaceId,
                    referencedTable: $$RoomSurfaceBoostsTableReferences
                        ._roomSurfaceIdTable(db),
                    referencedColumn: $$RoomSurfaceBoostsTableReferences
                        ._roomSurfaceIdTable(db)
                        .id,
                  ) as T;
                }
                if (gameStatId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.gameStatId,
                    referencedTable:
                        $$RoomSurfaceBoostsTableReferences._gameStatIdTable(db),
                    referencedColumn: $$RoomSurfaceBoostsTableReferences
                        ._gameStatIdTable(db)
                        .id,
                  ) as T;
                }
                if (boostSoundId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.boostSoundId,
                    referencedTable: $$RoomSurfaceBoostsTableReferences
                        ._boostSoundIdTable(db),
                    referencedColumn: $$RoomSurfaceBoostsTableReferences
                        ._boostSoundIdTable(db)
                        .id,
                  ) as T;
                }
                if (maxedOutSoundId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.maxedOutSoundId,
                    referencedTable: $$RoomSurfaceBoostsTableReferences
                        ._maxedOutSoundIdTable(db),
                    referencedColumn: $$RoomSurfaceBoostsTableReferences
                        ._maxedOutSoundIdTable(db)
                        .id,
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

typedef $$RoomSurfaceBoostsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RoomSurfaceBoostsTable,
    RoomSurfaceBoost,
    $$RoomSurfaceBoostsTableFilterComposer,
    $$RoomSurfaceBoostsTableOrderingComposer,
    $$RoomSurfaceBoostsTableAnnotationComposer,
    $$RoomSurfaceBoostsTableCreateCompanionBuilder,
    $$RoomSurfaceBoostsTableUpdateCompanionBuilder,
    (RoomSurfaceBoost, $$RoomSurfaceBoostsTableReferences),
    RoomSurfaceBoost,
    PrefetchHooks Function(
        {bool roomSurfaceId,
        bool gameStatId,
        bool boostSoundId,
        bool maxedOutSoundId})>;
typedef $$RoomSurfaceCostsTableCreateCompanionBuilder
    = RoomSurfaceCostsCompanion Function({
  Value<int> id,
  required int roomSurfaceId,
  required int gameStatId,
  Value<int> surfaceCost,
  Value<int?> exhaustedSoundId,
});
typedef $$RoomSurfaceCostsTableUpdateCompanionBuilder
    = RoomSurfaceCostsCompanion Function({
  Value<int> id,
  Value<int> roomSurfaceId,
  Value<int> gameStatId,
  Value<int> surfaceCost,
  Value<int?> exhaustedSoundId,
});

final class $$RoomSurfaceCostsTableReferences extends BaseReferences<
    _$AppDatabase, $RoomSurfaceCostsTable, RoomSurfaceCost> {
  $$RoomSurfaceCostsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $RoomSurfacesTable _roomSurfaceIdTable(_$AppDatabase db) =>
      db.roomSurfaces.createAlias($_aliasNameGenerator(
          db.roomSurfaceCosts.roomSurfaceId, db.roomSurfaces.id));

  $$RoomSurfacesTableProcessedTableManager get roomSurfaceId {
    final $_column = $_itemColumn<int>('room_surface_id')!;

    final manager = $$RoomSurfacesTableTableManager($_db, $_db.roomSurfaces)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roomSurfaceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GameStatsTable _gameStatIdTable(_$AppDatabase db) =>
      db.gameStats.createAlias($_aliasNameGenerator(
          db.roomSurfaceCosts.gameStatId, db.gameStats.id));

  $$GameStatsTableProcessedTableManager get gameStatId {
    final $_column = $_itemColumn<int>('game_stat_id')!;

    final manager = $$GameStatsTableTableManager($_db, $_db.gameStats)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_gameStatIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SoundReferencesTable _exhaustedSoundIdTable(_$AppDatabase db) =>
      db.soundReferences.createAlias($_aliasNameGenerator(
          db.roomSurfaceCosts.exhaustedSoundId, db.soundReferences.id));

  $$SoundReferencesTableProcessedTableManager? get exhaustedSoundId {
    final $_column = $_itemColumn<int>('exhausted_sound_id');
    if ($_column == null) return null;
    final manager =
        $$SoundReferencesTableTableManager($_db, $_db.soundReferences)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_exhaustedSoundIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RoomSurfaceCostsTableFilterComposer
    extends Composer<_$AppDatabase, $RoomSurfaceCostsTable> {
  $$RoomSurfaceCostsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get surfaceCost => $composableBuilder(
      column: $table.surfaceCost, builder: (column) => ColumnFilters(column));

  $$RoomSurfacesTableFilterComposer get roomSurfaceId {
    final $$RoomSurfacesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomSurfaceId,
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

  $$GameStatsTableFilterComposer get gameStatId {
    final $$GameStatsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gameStatId,
        referencedTable: $db.gameStats,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GameStatsTableFilterComposer(
              $db: $db,
              $table: $db.gameStats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SoundReferencesTableFilterComposer get exhaustedSoundId {
    final $$SoundReferencesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exhaustedSoundId,
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

class $$RoomSurfaceCostsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoomSurfaceCostsTable> {
  $$RoomSurfaceCostsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get surfaceCost => $composableBuilder(
      column: $table.surfaceCost, builder: (column) => ColumnOrderings(column));

  $$RoomSurfacesTableOrderingComposer get roomSurfaceId {
    final $$RoomSurfacesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomSurfaceId,
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

  $$GameStatsTableOrderingComposer get gameStatId {
    final $$GameStatsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gameStatId,
        referencedTable: $db.gameStats,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GameStatsTableOrderingComposer(
              $db: $db,
              $table: $db.gameStats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SoundReferencesTableOrderingComposer get exhaustedSoundId {
    final $$SoundReferencesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exhaustedSoundId,
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

class $$RoomSurfaceCostsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoomSurfaceCostsTable> {
  $$RoomSurfaceCostsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get surfaceCost => $composableBuilder(
      column: $table.surfaceCost, builder: (column) => column);

  $$RoomSurfacesTableAnnotationComposer get roomSurfaceId {
    final $$RoomSurfacesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomSurfaceId,
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

  $$GameStatsTableAnnotationComposer get gameStatId {
    final $$GameStatsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gameStatId,
        referencedTable: $db.gameStats,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GameStatsTableAnnotationComposer(
              $db: $db,
              $table: $db.gameStats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SoundReferencesTableAnnotationComposer get exhaustedSoundId {
    final $$SoundReferencesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.exhaustedSoundId,
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

class $$RoomSurfaceCostsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoomSurfaceCostsTable,
    RoomSurfaceCost,
    $$RoomSurfaceCostsTableFilterComposer,
    $$RoomSurfaceCostsTableOrderingComposer,
    $$RoomSurfaceCostsTableAnnotationComposer,
    $$RoomSurfaceCostsTableCreateCompanionBuilder,
    $$RoomSurfaceCostsTableUpdateCompanionBuilder,
    (RoomSurfaceCost, $$RoomSurfaceCostsTableReferences),
    RoomSurfaceCost,
    PrefetchHooks Function(
        {bool roomSurfaceId, bool gameStatId, bool exhaustedSoundId})> {
  $$RoomSurfaceCostsTableTableManager(
      _$AppDatabase db, $RoomSurfaceCostsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomSurfaceCostsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomSurfaceCostsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomSurfaceCostsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> roomSurfaceId = const Value.absent(),
            Value<int> gameStatId = const Value.absent(),
            Value<int> surfaceCost = const Value.absent(),
            Value<int?> exhaustedSoundId = const Value.absent(),
          }) =>
              RoomSurfaceCostsCompanion(
            id: id,
            roomSurfaceId: roomSurfaceId,
            gameStatId: gameStatId,
            surfaceCost: surfaceCost,
            exhaustedSoundId: exhaustedSoundId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int roomSurfaceId,
            required int gameStatId,
            Value<int> surfaceCost = const Value.absent(),
            Value<int?> exhaustedSoundId = const Value.absent(),
          }) =>
              RoomSurfaceCostsCompanion.insert(
            id: id,
            roomSurfaceId: roomSurfaceId,
            gameStatId: gameStatId,
            surfaceCost: surfaceCost,
            exhaustedSoundId: exhaustedSoundId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RoomSurfaceCostsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {roomSurfaceId = false,
              gameStatId = false,
              exhaustedSoundId = false}) {
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
                if (roomSurfaceId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.roomSurfaceId,
                    referencedTable: $$RoomSurfaceCostsTableReferences
                        ._roomSurfaceIdTable(db),
                    referencedColumn: $$RoomSurfaceCostsTableReferences
                        ._roomSurfaceIdTable(db)
                        .id,
                  ) as T;
                }
                if (gameStatId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.gameStatId,
                    referencedTable:
                        $$RoomSurfaceCostsTableReferences._gameStatIdTable(db),
                    referencedColumn: $$RoomSurfaceCostsTableReferences
                        ._gameStatIdTable(db)
                        .id,
                  ) as T;
                }
                if (exhaustedSoundId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.exhaustedSoundId,
                    referencedTable: $$RoomSurfaceCostsTableReferences
                        ._exhaustedSoundIdTable(db),
                    referencedColumn: $$RoomSurfaceCostsTableReferences
                        ._exhaustedSoundIdTable(db)
                        .id,
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

typedef $$RoomSurfaceCostsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RoomSurfaceCostsTable,
    RoomSurfaceCost,
    $$RoomSurfaceCostsTableFilterComposer,
    $$RoomSurfaceCostsTableOrderingComposer,
    $$RoomSurfaceCostsTableAnnotationComposer,
    $$RoomSurfaceCostsTableCreateCompanionBuilder,
    $$RoomSurfaceCostsTableUpdateCompanionBuilder,
    (RoomSurfaceCost, $$RoomSurfaceCostsTableReferences),
    RoomSurfaceCost,
    PrefetchHooks Function(
        {bool roomSurfaceId, bool gameStatId, bool exhaustedSoundId})>;
typedef $$PlayerClassGameStatsTableCreateCompanionBuilder
    = PlayerClassGameStatsCompanion Function({
  Value<int> id,
  required int playerClassId,
  required int gameStatId,
  required int defaultValue,
});
typedef $$PlayerClassGameStatsTableUpdateCompanionBuilder
    = PlayerClassGameStatsCompanion Function({
  Value<int> id,
  Value<int> playerClassId,
  Value<int> gameStatId,
  Value<int> defaultValue,
});

final class $$PlayerClassGameStatsTableReferences extends BaseReferences<
    _$AppDatabase, $PlayerClassGameStatsTable, PlayerClassGameStat> {
  $$PlayerClassGameStatsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PlayerClassesTable _playerClassIdTable(_$AppDatabase db) =>
      db.playerClasses.createAlias($_aliasNameGenerator(
          db.playerClassGameStats.playerClassId, db.playerClasses.id));

  $$PlayerClassesTableProcessedTableManager get playerClassId {
    final $_column = $_itemColumn<int>('player_class_id')!;

    final manager = $$PlayerClassesTableTableManager($_db, $_db.playerClasses)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playerClassIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $GameStatsTable _gameStatIdTable(_$AppDatabase db) =>
      db.gameStats.createAlias($_aliasNameGenerator(
          db.playerClassGameStats.gameStatId, db.gameStats.id));

  $$GameStatsTableProcessedTableManager get gameStatId {
    final $_column = $_itemColumn<int>('game_stat_id')!;

    final manager = $$GameStatsTableTableManager($_db, $_db.gameStats)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_gameStatIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PlayerClassGameStatsTableFilterComposer
    extends Composer<_$AppDatabase, $PlayerClassGameStatsTable> {
  $$PlayerClassGameStatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get defaultValue => $composableBuilder(
      column: $table.defaultValue, builder: (column) => ColumnFilters(column));

  $$PlayerClassesTableFilterComposer get playerClassId {
    final $$PlayerClassesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.playerClassId,
        referencedTable: $db.playerClasses,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlayerClassesTableFilterComposer(
              $db: $db,
              $table: $db.playerClasses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GameStatsTableFilterComposer get gameStatId {
    final $$GameStatsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gameStatId,
        referencedTable: $db.gameStats,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GameStatsTableFilterComposer(
              $db: $db,
              $table: $db.gameStats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PlayerClassGameStatsTableOrderingComposer
    extends Composer<_$AppDatabase, $PlayerClassGameStatsTable> {
  $$PlayerClassGameStatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get defaultValue => $composableBuilder(
      column: $table.defaultValue,
      builder: (column) => ColumnOrderings(column));

  $$PlayerClassesTableOrderingComposer get playerClassId {
    final $$PlayerClassesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.playerClassId,
        referencedTable: $db.playerClasses,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlayerClassesTableOrderingComposer(
              $db: $db,
              $table: $db.playerClasses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GameStatsTableOrderingComposer get gameStatId {
    final $$GameStatsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gameStatId,
        referencedTable: $db.gameStats,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GameStatsTableOrderingComposer(
              $db: $db,
              $table: $db.gameStats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PlayerClassGameStatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlayerClassGameStatsTable> {
  $$PlayerClassGameStatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get defaultValue => $composableBuilder(
      column: $table.defaultValue, builder: (column) => column);

  $$PlayerClassesTableAnnotationComposer get playerClassId {
    final $$PlayerClassesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.playerClassId,
        referencedTable: $db.playerClasses,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlayerClassesTableAnnotationComposer(
              $db: $db,
              $table: $db.playerClasses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$GameStatsTableAnnotationComposer get gameStatId {
    final $$GameStatsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.gameStatId,
        referencedTable: $db.gameStats,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GameStatsTableAnnotationComposer(
              $db: $db,
              $table: $db.gameStats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PlayerClassGameStatsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlayerClassGameStatsTable,
    PlayerClassGameStat,
    $$PlayerClassGameStatsTableFilterComposer,
    $$PlayerClassGameStatsTableOrderingComposer,
    $$PlayerClassGameStatsTableAnnotationComposer,
    $$PlayerClassGameStatsTableCreateCompanionBuilder,
    $$PlayerClassGameStatsTableUpdateCompanionBuilder,
    (PlayerClassGameStat, $$PlayerClassGameStatsTableReferences),
    PlayerClassGameStat,
    PrefetchHooks Function({bool playerClassId, bool gameStatId})> {
  $$PlayerClassGameStatsTableTableManager(
      _$AppDatabase db, $PlayerClassGameStatsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayerClassGameStatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayerClassGameStatsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayerClassGameStatsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> playerClassId = const Value.absent(),
            Value<int> gameStatId = const Value.absent(),
            Value<int> defaultValue = const Value.absent(),
          }) =>
              PlayerClassGameStatsCompanion(
            id: id,
            playerClassId: playerClassId,
            gameStatId: gameStatId,
            defaultValue: defaultValue,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int playerClassId,
            required int gameStatId,
            required int defaultValue,
          }) =>
              PlayerClassGameStatsCompanion.insert(
            id: id,
            playerClassId: playerClassId,
            gameStatId: gameStatId,
            defaultValue: defaultValue,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PlayerClassGameStatsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({playerClassId = false, gameStatId = false}) {
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
                if (playerClassId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.playerClassId,
                    referencedTable: $$PlayerClassGameStatsTableReferences
                        ._playerClassIdTable(db),
                    referencedColumn: $$PlayerClassGameStatsTableReferences
                        ._playerClassIdTable(db)
                        .id,
                  ) as T;
                }
                if (gameStatId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.gameStatId,
                    referencedTable: $$PlayerClassGameStatsTableReferences
                        ._gameStatIdTable(db),
                    referencedColumn: $$PlayerClassGameStatsTableReferences
                        ._gameStatIdTable(db)
                        .id,
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

typedef $$PlayerClassGameStatsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $PlayerClassGameStatsTable,
        PlayerClassGameStat,
        $$PlayerClassGameStatsTableFilterComposer,
        $$PlayerClassGameStatsTableOrderingComposer,
        $$PlayerClassGameStatsTableAnnotationComposer,
        $$PlayerClassGameStatsTableCreateCompanionBuilder,
        $$PlayerClassGameStatsTableUpdateCompanionBuilder,
        (PlayerClassGameStat, $$PlayerClassGameStatsTableReferences),
        PlayerClassGameStat,
        PrefetchHooks Function({bool playerClassId, bool gameStatId})>;
typedef $$RoomObjectRandomSoundsTableCreateCompanionBuilder
    = RoomObjectRandomSoundsCompanion Function({
  Value<int> id,
  required int roomObjectId,
  required int soundId,
  Value<int> minInterval,
  Value<int> maxInterval,
});
typedef $$RoomObjectRandomSoundsTableUpdateCompanionBuilder
    = RoomObjectRandomSoundsCompanion Function({
  Value<int> id,
  Value<int> roomObjectId,
  Value<int> soundId,
  Value<int> minInterval,
  Value<int> maxInterval,
});

final class $$RoomObjectRandomSoundsTableReferences extends BaseReferences<
    _$AppDatabase, $RoomObjectRandomSoundsTable, RoomObjectRandomSound> {
  $$RoomObjectRandomSoundsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $RoomObjectsTable _roomObjectIdTable(_$AppDatabase db) =>
      db.roomObjects.createAlias($_aliasNameGenerator(
          db.roomObjectRandomSounds.roomObjectId, db.roomObjects.id));

  $$RoomObjectsTableProcessedTableManager get roomObjectId {
    final $_column = $_itemColumn<int>('room_object_id')!;

    final manager = $$RoomObjectsTableTableManager($_db, $_db.roomObjects)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roomObjectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SoundReferencesTable _soundIdTable(_$AppDatabase db) =>
      db.soundReferences.createAlias($_aliasNameGenerator(
          db.roomObjectRandomSounds.soundId, db.soundReferences.id));

  $$SoundReferencesTableProcessedTableManager get soundId {
    final $_column = $_itemColumn<int>('sound_id')!;

    final manager =
        $$SoundReferencesTableTableManager($_db, $_db.soundReferences)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_soundIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RoomObjectRandomSoundsTableFilterComposer
    extends Composer<_$AppDatabase, $RoomObjectRandomSoundsTable> {
  $$RoomObjectRandomSoundsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minInterval => $composableBuilder(
      column: $table.minInterval, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxInterval => $composableBuilder(
      column: $table.maxInterval, builder: (column) => ColumnFilters(column));

  $$RoomObjectsTableFilterComposer get roomObjectId {
    final $$RoomObjectsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomObjectId,
        referencedTable: $db.roomObjects,
        getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  $$SoundReferencesTableFilterComposer get soundId {
    final $$SoundReferencesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.soundId,
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

class $$RoomObjectRandomSoundsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoomObjectRandomSoundsTable> {
  $$RoomObjectRandomSoundsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minInterval => $composableBuilder(
      column: $table.minInterval, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxInterval => $composableBuilder(
      column: $table.maxInterval, builder: (column) => ColumnOrderings(column));

  $$RoomObjectsTableOrderingComposer get roomObjectId {
    final $$RoomObjectsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomObjectId,
        referencedTable: $db.roomObjects,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomObjectsTableOrderingComposer(
              $db: $db,
              $table: $db.roomObjects,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SoundReferencesTableOrderingComposer get soundId {
    final $$SoundReferencesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.soundId,
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

class $$RoomObjectRandomSoundsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoomObjectRandomSoundsTable> {
  $$RoomObjectRandomSoundsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get minInterval => $composableBuilder(
      column: $table.minInterval, builder: (column) => column);

  GeneratedColumn<int> get maxInterval => $composableBuilder(
      column: $table.maxInterval, builder: (column) => column);

  $$RoomObjectsTableAnnotationComposer get roomObjectId {
    final $$RoomObjectsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.roomObjectId,
        referencedTable: $db.roomObjects,
        getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  $$SoundReferencesTableAnnotationComposer get soundId {
    final $$SoundReferencesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.soundId,
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

class $$RoomObjectRandomSoundsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoomObjectRandomSoundsTable,
    RoomObjectRandomSound,
    $$RoomObjectRandomSoundsTableFilterComposer,
    $$RoomObjectRandomSoundsTableOrderingComposer,
    $$RoomObjectRandomSoundsTableAnnotationComposer,
    $$RoomObjectRandomSoundsTableCreateCompanionBuilder,
    $$RoomObjectRandomSoundsTableUpdateCompanionBuilder,
    (RoomObjectRandomSound, $$RoomObjectRandomSoundsTableReferences),
    RoomObjectRandomSound,
    PrefetchHooks Function({bool roomObjectId, bool soundId})> {
  $$RoomObjectRandomSoundsTableTableManager(
      _$AppDatabase db, $RoomObjectRandomSoundsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomObjectRandomSoundsTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomObjectRandomSoundsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomObjectRandomSoundsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> roomObjectId = const Value.absent(),
            Value<int> soundId = const Value.absent(),
            Value<int> minInterval = const Value.absent(),
            Value<int> maxInterval = const Value.absent(),
          }) =>
              RoomObjectRandomSoundsCompanion(
            id: id,
            roomObjectId: roomObjectId,
            soundId: soundId,
            minInterval: minInterval,
            maxInterval: maxInterval,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int roomObjectId,
            required int soundId,
            Value<int> minInterval = const Value.absent(),
            Value<int> maxInterval = const Value.absent(),
          }) =>
              RoomObjectRandomSoundsCompanion.insert(
            id: id,
            roomObjectId: roomObjectId,
            soundId: soundId,
            minInterval: minInterval,
            maxInterval: maxInterval,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RoomObjectRandomSoundsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({roomObjectId = false, soundId = false}) {
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
                if (roomObjectId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.roomObjectId,
                    referencedTable: $$RoomObjectRandomSoundsTableReferences
                        ._roomObjectIdTable(db),
                    referencedColumn: $$RoomObjectRandomSoundsTableReferences
                        ._roomObjectIdTable(db)
                        .id,
                  ) as T;
                }
                if (soundId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.soundId,
                    referencedTable: $$RoomObjectRandomSoundsTableReferences
                        ._soundIdTable(db),
                    referencedColumn: $$RoomObjectRandomSoundsTableReferences
                        ._soundIdTable(db)
                        .id,
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

typedef $$RoomObjectRandomSoundsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $RoomObjectRandomSoundsTable,
        RoomObjectRandomSound,
        $$RoomObjectRandomSoundsTableFilterComposer,
        $$RoomObjectRandomSoundsTableOrderingComposer,
        $$RoomObjectRandomSoundsTableAnnotationComposer,
        $$RoomObjectRandomSoundsTableCreateCompanionBuilder,
        $$RoomObjectRandomSoundsTableUpdateCompanionBuilder,
        (RoomObjectRandomSound, $$RoomObjectRandomSoundsTableReferences),
        RoomObjectRandomSound,
        PrefetchHooks Function({bool roomObjectId, bool soundId})>;

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
  $$RoomExitsTableTableManager get roomExits =>
      $$RoomExitsTableTableManager(_db, _db.roomExits);
  $$RoomObjectsTableTableManager get roomObjects =>
      $$RoomObjectsTableTableManager(_db, _db.roomObjects);
  $$PlayerClassesTableTableManager get playerClasses =>
      $$PlayerClassesTableTableManager(_db, _db.playerClasses);
  $$GameStatsTableTableManager get gameStats =>
      $$GameStatsTableTableManager(_db, _db.gameStats);
  $$RoomSurfaceBoostsTableTableManager get roomSurfaceBoosts =>
      $$RoomSurfaceBoostsTableTableManager(_db, _db.roomSurfaceBoosts);
  $$RoomSurfaceCostsTableTableManager get roomSurfaceCosts =>
      $$RoomSurfaceCostsTableTableManager(_db, _db.roomSurfaceCosts);
  $$PlayerClassGameStatsTableTableManager get playerClassGameStats =>
      $$PlayerClassGameStatsTableTableManager(_db, _db.playerClassGameStats);
  $$RoomObjectRandomSoundsTableTableManager get roomObjectRandomSounds =>
      $$RoomObjectRandomSoundsTableTableManager(
          _db, _db.roomObjectRandomSounds);
}
