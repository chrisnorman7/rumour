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

class $CommandsTable extends Commands with TableInfo<$CommandsTable, Command> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommandsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _spokenMessageMeta =
      const VerificationMeta('spokenMessage');
  @override
  late final GeneratedColumn<String> spokenMessage = GeneratedColumn<String>(
      'spoken_message', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('This command needs configuring.'));
  static const VerificationMeta _soundIdMeta =
      const VerificationMeta('soundId');
  @override
  late final GeneratedColumn<int> soundId = GeneratedColumn<int>(
      'sound_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sound_references (id) ON DELETE SET NULL'));
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, description, spokenMessage, soundId, url];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'commands';
  @override
  VerificationContext validateIntegrity(Insertable<Command> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('spoken_message')) {
      context.handle(
          _spokenMessageMeta,
          spokenMessage.isAcceptableOrUnknown(
              data['spoken_message']!, _spokenMessageMeta));
    }
    if (data.containsKey('sound_id')) {
      context.handle(_soundIdMeta,
          soundId.isAcceptableOrUnknown(data['sound_id']!, _soundIdMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Command map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Command(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      spokenMessage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}spoken_message']),
      soundId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sound_id']),
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url']),
    );
  }

  @override
  $CommandsTable createAlias(String alias) {
    return $CommandsTable(attachedDatabase, alias);
  }
}

class Command extends DataClass implements Insertable<Command> {
  /// The primary key field.
  final int id;

  /// The description column.
  final String description;

  /// The text to announce.
  final String? spokenMessage;

  /// The ID of a sound to play.
  final int? soundId;

  /// A URL to open.
  final String? url;
  const Command(
      {required this.id,
      required this.description,
      this.spokenMessage,
      this.soundId,
      this.url});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || spokenMessage != null) {
      map['spoken_message'] = Variable<String>(spokenMessage);
    }
    if (!nullToAbsent || soundId != null) {
      map['sound_id'] = Variable<int>(soundId);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    return map;
  }

  CommandsCompanion toCompanion(bool nullToAbsent) {
    return CommandsCompanion(
      id: Value(id),
      description: Value(description),
      spokenMessage: spokenMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(spokenMessage),
      soundId: soundId == null && nullToAbsent
          ? const Value.absent()
          : Value(soundId),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
    );
  }

  factory Command.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Command(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      spokenMessage: serializer.fromJson<String?>(json['spokenMessage']),
      soundId: serializer.fromJson<int?>(json['soundId']),
      url: serializer.fromJson<String?>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'spokenMessage': serializer.toJson<String?>(spokenMessage),
      'soundId': serializer.toJson<int?>(soundId),
      'url': serializer.toJson<String?>(url),
    };
  }

  Command copyWith(
          {int? id,
          String? description,
          Value<String?> spokenMessage = const Value.absent(),
          Value<int?> soundId = const Value.absent(),
          Value<String?> url = const Value.absent()}) =>
      Command(
        id: id ?? this.id,
        description: description ?? this.description,
        spokenMessage:
            spokenMessage.present ? spokenMessage.value : this.spokenMessage,
        soundId: soundId.present ? soundId.value : this.soundId,
        url: url.present ? url.value : this.url,
      );
  Command copyWithCompanion(CommandsCompanion data) {
    return Command(
      id: data.id.present ? data.id.value : this.id,
      description:
          data.description.present ? data.description.value : this.description,
      spokenMessage: data.spokenMessage.present
          ? data.spokenMessage.value
          : this.spokenMessage,
      soundId: data.soundId.present ? data.soundId.value : this.soundId,
      url: data.url.present ? data.url.value : this.url,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Command(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('spokenMessage: $spokenMessage, ')
          ..write('soundId: $soundId, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, spokenMessage, soundId, url);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Command &&
          other.id == this.id &&
          other.description == this.description &&
          other.spokenMessage == this.spokenMessage &&
          other.soundId == this.soundId &&
          other.url == this.url);
}

class CommandsCompanion extends UpdateCompanion<Command> {
  final Value<int> id;
  final Value<String> description;
  final Value<String?> spokenMessage;
  final Value<int?> soundId;
  final Value<String?> url;
  const CommandsCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.spokenMessage = const Value.absent(),
    this.soundId = const Value.absent(),
    this.url = const Value.absent(),
  });
  CommandsCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    this.spokenMessage = const Value.absent(),
    this.soundId = const Value.absent(),
    this.url = const Value.absent(),
  }) : description = Value(description);
  static Insertable<Command> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<String>? spokenMessage,
    Expression<int>? soundId,
    Expression<String>? url,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (spokenMessage != null) 'spoken_message': spokenMessage,
      if (soundId != null) 'sound_id': soundId,
      if (url != null) 'url': url,
    });
  }

  CommandsCompanion copyWith(
      {Value<int>? id,
      Value<String>? description,
      Value<String?>? spokenMessage,
      Value<int?>? soundId,
      Value<String?>? url}) {
    return CommandsCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      spokenMessage: spokenMessage ?? this.spokenMessage,
      soundId: soundId ?? this.soundId,
      url: url ?? this.url,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (spokenMessage.present) {
      map['spoken_message'] = Variable<String>(spokenMessage.value);
    }
    if (soundId.present) {
      map['sound_id'] = Variable<int>(soundId.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommandsCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('spokenMessage: $spokenMessage, ')
          ..write('soundId: $soundId, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }
}

class $CommandCallersTable extends CommandCallers
    with TableInfo<$CommandCallersTable, CommandCaller> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommandCallersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _parentCommandIdMeta =
      const VerificationMeta('parentCommandId');
  @override
  late final GeneratedColumn<int> parentCommandId = GeneratedColumn<int>(
      'parent_command_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES commands (id) ON DELETE CASCADE'));
  static const VerificationMeta _childCommandIdMeta =
      const VerificationMeta('childCommandId');
  @override
  late final GeneratedColumn<int> childCommandId = GeneratedColumn<int>(
      'child_command_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES commands (id) ON DELETE CASCADE'));
  static const VerificationMeta _callAfterMeta =
      const VerificationMeta('callAfter');
  @override
  late final GeneratedColumn<int> callAfter = GeneratedColumn<int>(
      'call_after', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, parentCommandId, childCommandId, callAfter];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'command_callers';
  @override
  VerificationContext validateIntegrity(Insertable<CommandCaller> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parent_command_id')) {
      context.handle(
          _parentCommandIdMeta,
          parentCommandId.isAcceptableOrUnknown(
              data['parent_command_id']!, _parentCommandIdMeta));
    }
    if (data.containsKey('child_command_id')) {
      context.handle(
          _childCommandIdMeta,
          childCommandId.isAcceptableOrUnknown(
              data['child_command_id']!, _childCommandIdMeta));
    } else if (isInserting) {
      context.missing(_childCommandIdMeta);
    }
    if (data.containsKey('call_after')) {
      context.handle(_callAfterMeta,
          callAfter.isAcceptableOrUnknown(data['call_after']!, _callAfterMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CommandCaller map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CommandCaller(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      parentCommandId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parent_command_id']),
      childCommandId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}child_command_id'])!,
      callAfter: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}call_after']),
    );
  }

  @override
  $CommandCallersTable createAlias(String alias) {
    return $CommandCallersTable(attachedDatabase, alias);
  }
}

class CommandCaller extends DataClass implements Insertable<CommandCaller> {
  /// The primary key field.
  final int id;

  /// The ID of the command which owns this caller.
  final int? parentCommandId;

  /// The ID of the command to call.
  final int childCommandId;

  /// How many seconds to wait before calling the command.
  final int? callAfter;
  const CommandCaller(
      {required this.id,
      this.parentCommandId,
      required this.childCommandId,
      this.callAfter});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || parentCommandId != null) {
      map['parent_command_id'] = Variable<int>(parentCommandId);
    }
    map['child_command_id'] = Variable<int>(childCommandId);
    if (!nullToAbsent || callAfter != null) {
      map['call_after'] = Variable<int>(callAfter);
    }
    return map;
  }

  CommandCallersCompanion toCompanion(bool nullToAbsent) {
    return CommandCallersCompanion(
      id: Value(id),
      parentCommandId: parentCommandId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentCommandId),
      childCommandId: Value(childCommandId),
      callAfter: callAfter == null && nullToAbsent
          ? const Value.absent()
          : Value(callAfter),
    );
  }

  factory CommandCaller.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CommandCaller(
      id: serializer.fromJson<int>(json['id']),
      parentCommandId: serializer.fromJson<int?>(json['parentCommandId']),
      childCommandId: serializer.fromJson<int>(json['childCommandId']),
      callAfter: serializer.fromJson<int?>(json['callAfter']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'parentCommandId': serializer.toJson<int?>(parentCommandId),
      'childCommandId': serializer.toJson<int>(childCommandId),
      'callAfter': serializer.toJson<int?>(callAfter),
    };
  }

  CommandCaller copyWith(
          {int? id,
          Value<int?> parentCommandId = const Value.absent(),
          int? childCommandId,
          Value<int?> callAfter = const Value.absent()}) =>
      CommandCaller(
        id: id ?? this.id,
        parentCommandId: parentCommandId.present
            ? parentCommandId.value
            : this.parentCommandId,
        childCommandId: childCommandId ?? this.childCommandId,
        callAfter: callAfter.present ? callAfter.value : this.callAfter,
      );
  CommandCaller copyWithCompanion(CommandCallersCompanion data) {
    return CommandCaller(
      id: data.id.present ? data.id.value : this.id,
      parentCommandId: data.parentCommandId.present
          ? data.parentCommandId.value
          : this.parentCommandId,
      childCommandId: data.childCommandId.present
          ? data.childCommandId.value
          : this.childCommandId,
      callAfter: data.callAfter.present ? data.callAfter.value : this.callAfter,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CommandCaller(')
          ..write('id: $id, ')
          ..write('parentCommandId: $parentCommandId, ')
          ..write('childCommandId: $childCommandId, ')
          ..write('callAfter: $callAfter')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, parentCommandId, childCommandId, callAfter);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommandCaller &&
          other.id == this.id &&
          other.parentCommandId == this.parentCommandId &&
          other.childCommandId == this.childCommandId &&
          other.callAfter == this.callAfter);
}

class CommandCallersCompanion extends UpdateCompanion<CommandCaller> {
  final Value<int> id;
  final Value<int?> parentCommandId;
  final Value<int> childCommandId;
  final Value<int?> callAfter;
  const CommandCallersCompanion({
    this.id = const Value.absent(),
    this.parentCommandId = const Value.absent(),
    this.childCommandId = const Value.absent(),
    this.callAfter = const Value.absent(),
  });
  CommandCallersCompanion.insert({
    this.id = const Value.absent(),
    this.parentCommandId = const Value.absent(),
    required int childCommandId,
    this.callAfter = const Value.absent(),
  }) : childCommandId = Value(childCommandId);
  static Insertable<CommandCaller> custom({
    Expression<int>? id,
    Expression<int>? parentCommandId,
    Expression<int>? childCommandId,
    Expression<int>? callAfter,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentCommandId != null) 'parent_command_id': parentCommandId,
      if (childCommandId != null) 'child_command_id': childCommandId,
      if (callAfter != null) 'call_after': callAfter,
    });
  }

  CommandCallersCompanion copyWith(
      {Value<int>? id,
      Value<int?>? parentCommandId,
      Value<int>? childCommandId,
      Value<int?>? callAfter}) {
    return CommandCallersCompanion(
      id: id ?? this.id,
      parentCommandId: parentCommandId ?? this.parentCommandId,
      childCommandId: childCommandId ?? this.childCommandId,
      callAfter: callAfter ?? this.callAfter,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parentCommandId.present) {
      map['parent_command_id'] = Variable<int>(parentCommandId.value);
    }
    if (childCommandId.present) {
      map['child_command_id'] = Variable<int>(childCommandId.value);
    }
    if (callAfter.present) {
      map['call_after'] = Variable<int>(callAfter.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommandCallersCompanion(')
          ..write('id: $id, ')
          ..write('parentCommandId: $parentCommandId, ')
          ..write('childCommandId: $childCommandId, ')
          ..write('callAfter: $callAfter')
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
  static const VerificationMeta _onEnterCommandCallerIdMeta =
      const VerificationMeta('onEnterCommandCallerId');
  @override
  late final GeneratedColumn<int> onEnterCommandCallerId = GeneratedColumn<int>(
      'on_enter_command_caller_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES command_callers (id) ON DELETE SET NULL'));
  static const VerificationMeta _onExitCommandCallerIdMeta =
      const VerificationMeta('onExitCommandCallerId');
  @override
  late final GeneratedColumn<int> onExitCommandCallerId = GeneratedColumn<int>(
      'on_exit_command_caller_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES command_callers (id) ON DELETE SET NULL'));
  static const VerificationMeta _onTeleportCommandCallerIdMeta =
      const VerificationMeta('onTeleportCommandCallerId');
  @override
  late final GeneratedColumn<int> onTeleportCommandCallerId =
      GeneratedColumn<int>('on_teleport_command_caller_id', aliasedName, true,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES command_callers (id) ON DELETE SET NULL'));
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
        surfaceId,
        onEnterCommandCallerId,
        onExitCommandCallerId,
        onTeleportCommandCallerId
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
    if (data.containsKey('on_enter_command_caller_id')) {
      context.handle(
          _onEnterCommandCallerIdMeta,
          onEnterCommandCallerId.isAcceptableOrUnknown(
              data['on_enter_command_caller_id']!,
              _onEnterCommandCallerIdMeta));
    }
    if (data.containsKey('on_exit_command_caller_id')) {
      context.handle(
          _onExitCommandCallerIdMeta,
          onExitCommandCallerId.isAcceptableOrUnknown(
              data['on_exit_command_caller_id']!, _onExitCommandCallerIdMeta));
    }
    if (data.containsKey('on_teleport_command_caller_id')) {
      context.handle(
          _onTeleportCommandCallerIdMeta,
          onTeleportCommandCallerId.isAcceptableOrUnknown(
              data['on_teleport_command_caller_id']!,
              _onTeleportCommandCallerIdMeta));
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
      onEnterCommandCallerId: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}on_enter_command_caller_id']),
      onExitCommandCallerId: attachedDatabase.typeMapping.read(DriftSqlType.int,
          data['${effectivePrefix}on_exit_command_caller_id']),
      onTeleportCommandCallerId: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}on_teleport_command_caller_id']),
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

  /// The ID of a command caller to use when the player enters this room.
  final int? onEnterCommandCallerId;

  /// The ID of a command caller to use when the player exits this room.
  final int? onExitCommandCallerId;

  /// The ID of a command caller to use when the player teleports in this room.
  final int? onTeleportCommandCallerId;
  const Room(
      {required this.id,
      required this.name,
      required this.description,
      required this.createdAt,
      this.ambianceId,
      required this.zoneId,
      required this.maxX,
      required this.maxY,
      required this.surfaceId,
      this.onEnterCommandCallerId,
      this.onExitCommandCallerId,
      this.onTeleportCommandCallerId});
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
    if (!nullToAbsent || onEnterCommandCallerId != null) {
      map['on_enter_command_caller_id'] = Variable<int>(onEnterCommandCallerId);
    }
    if (!nullToAbsent || onExitCommandCallerId != null) {
      map['on_exit_command_caller_id'] = Variable<int>(onExitCommandCallerId);
    }
    if (!nullToAbsent || onTeleportCommandCallerId != null) {
      map['on_teleport_command_caller_id'] =
          Variable<int>(onTeleportCommandCallerId);
    }
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
      onEnterCommandCallerId: onEnterCommandCallerId == null && nullToAbsent
          ? const Value.absent()
          : Value(onEnterCommandCallerId),
      onExitCommandCallerId: onExitCommandCallerId == null && nullToAbsent
          ? const Value.absent()
          : Value(onExitCommandCallerId),
      onTeleportCommandCallerId:
          onTeleportCommandCallerId == null && nullToAbsent
              ? const Value.absent()
              : Value(onTeleportCommandCallerId),
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
      onEnterCommandCallerId:
          serializer.fromJson<int?>(json['onEnterCommandCallerId']),
      onExitCommandCallerId:
          serializer.fromJson<int?>(json['onExitCommandCallerId']),
      onTeleportCommandCallerId:
          serializer.fromJson<int?>(json['onTeleportCommandCallerId']),
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
      'onEnterCommandCallerId': serializer.toJson<int?>(onEnterCommandCallerId),
      'onExitCommandCallerId': serializer.toJson<int?>(onExitCommandCallerId),
      'onTeleportCommandCallerId':
          serializer.toJson<int?>(onTeleportCommandCallerId),
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
          int? surfaceId,
          Value<int?> onEnterCommandCallerId = const Value.absent(),
          Value<int?> onExitCommandCallerId = const Value.absent(),
          Value<int?> onTeleportCommandCallerId = const Value.absent()}) =>
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
        onEnterCommandCallerId: onEnterCommandCallerId.present
            ? onEnterCommandCallerId.value
            : this.onEnterCommandCallerId,
        onExitCommandCallerId: onExitCommandCallerId.present
            ? onExitCommandCallerId.value
            : this.onExitCommandCallerId,
        onTeleportCommandCallerId: onTeleportCommandCallerId.present
            ? onTeleportCommandCallerId.value
            : this.onTeleportCommandCallerId,
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
      onEnterCommandCallerId: data.onEnterCommandCallerId.present
          ? data.onEnterCommandCallerId.value
          : this.onEnterCommandCallerId,
      onExitCommandCallerId: data.onExitCommandCallerId.present
          ? data.onExitCommandCallerId.value
          : this.onExitCommandCallerId,
      onTeleportCommandCallerId: data.onTeleportCommandCallerId.present
          ? data.onTeleportCommandCallerId.value
          : this.onTeleportCommandCallerId,
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
          ..write('surfaceId: $surfaceId, ')
          ..write('onEnterCommandCallerId: $onEnterCommandCallerId, ')
          ..write('onExitCommandCallerId: $onExitCommandCallerId, ')
          ..write('onTeleportCommandCallerId: $onTeleportCommandCallerId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      description,
      createdAt,
      ambianceId,
      zoneId,
      maxX,
      maxY,
      surfaceId,
      onEnterCommandCallerId,
      onExitCommandCallerId,
      onTeleportCommandCallerId);
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
          other.surfaceId == this.surfaceId &&
          other.onEnterCommandCallerId == this.onEnterCommandCallerId &&
          other.onExitCommandCallerId == this.onExitCommandCallerId &&
          other.onTeleportCommandCallerId == this.onTeleportCommandCallerId);
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
  final Value<int?> onEnterCommandCallerId;
  final Value<int?> onExitCommandCallerId;
  final Value<int?> onTeleportCommandCallerId;
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
    this.onEnterCommandCallerId = const Value.absent(),
    this.onExitCommandCallerId = const Value.absent(),
    this.onTeleportCommandCallerId = const Value.absent(),
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
    this.onEnterCommandCallerId = const Value.absent(),
    this.onExitCommandCallerId = const Value.absent(),
    this.onTeleportCommandCallerId = const Value.absent(),
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
    Expression<int>? onEnterCommandCallerId,
    Expression<int>? onExitCommandCallerId,
    Expression<int>? onTeleportCommandCallerId,
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
      if (onEnterCommandCallerId != null)
        'on_enter_command_caller_id': onEnterCommandCallerId,
      if (onExitCommandCallerId != null)
        'on_exit_command_caller_id': onExitCommandCallerId,
      if (onTeleportCommandCallerId != null)
        'on_teleport_command_caller_id': onTeleportCommandCallerId,
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
      Value<int>? surfaceId,
      Value<int?>? onEnterCommandCallerId,
      Value<int?>? onExitCommandCallerId,
      Value<int?>? onTeleportCommandCallerId}) {
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
      onEnterCommandCallerId:
          onEnterCommandCallerId ?? this.onEnterCommandCallerId,
      onExitCommandCallerId:
          onExitCommandCallerId ?? this.onExitCommandCallerId,
      onTeleportCommandCallerId:
          onTeleportCommandCallerId ?? this.onTeleportCommandCallerId,
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
    if (onEnterCommandCallerId.present) {
      map['on_enter_command_caller_id'] =
          Variable<int>(onEnterCommandCallerId.value);
    }
    if (onExitCommandCallerId.present) {
      map['on_exit_command_caller_id'] =
          Variable<int>(onExitCommandCallerId.value);
    }
    if (onTeleportCommandCallerId.present) {
      map['on_teleport_command_caller_id'] =
          Variable<int>(onTeleportCommandCallerId.value);
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
          ..write('surfaceId: $surfaceId, ')
          ..write('onEnterCommandCallerId: $onEnterCommandCallerId, ')
          ..write('onExitCommandCallerId: $onExitCommandCallerId, ')
          ..write('onTeleportCommandCallerId: $onTeleportCommandCallerId')
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
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Use exit'));
  static const VerificationMeta _earconIdMeta =
      const VerificationMeta('earconId');
  @override
  late final GeneratedColumn<int> earconId = GeneratedColumn<int>(
      'earcon_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sound_references (id) ON DELETE SET NULL'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, roomId, x, y, useSoundId, label, earconId];
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
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    }
    if (data.containsKey('earcon_id')) {
      context.handle(_earconIdMeta,
          earconId.isAcceptableOrUnknown(data['earcon_id']!, _earconIdMeta));
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
      label: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
      earconId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}earcon_id']),
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

  /// The label of this exit.
  ///
  /// The [label] will be used in the object actions menu.
  final String label;

  /// The ID of the earcon sound to use in the room object action menu.
  final int? earconId;
  const RoomExit(
      {required this.id,
      required this.roomId,
      required this.x,
      required this.y,
      this.useSoundId,
      required this.label,
      this.earconId});
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
    map['label'] = Variable<String>(label);
    if (!nullToAbsent || earconId != null) {
      map['earcon_id'] = Variable<int>(earconId);
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
      label: Value(label),
      earconId: earconId == null && nullToAbsent
          ? const Value.absent()
          : Value(earconId),
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
      label: serializer.fromJson<String>(json['label']),
      earconId: serializer.fromJson<int?>(json['earconId']),
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
      'label': serializer.toJson<String>(label),
      'earconId': serializer.toJson<int?>(earconId),
    };
  }

  RoomExit copyWith(
          {int? id,
          int? roomId,
          int? x,
          int? y,
          Value<int?> useSoundId = const Value.absent(),
          String? label,
          Value<int?> earconId = const Value.absent()}) =>
      RoomExit(
        id: id ?? this.id,
        roomId: roomId ?? this.roomId,
        x: x ?? this.x,
        y: y ?? this.y,
        useSoundId: useSoundId.present ? useSoundId.value : this.useSoundId,
        label: label ?? this.label,
        earconId: earconId.present ? earconId.value : this.earconId,
      );
  RoomExit copyWithCompanion(RoomExitsCompanion data) {
    return RoomExit(
      id: data.id.present ? data.id.value : this.id,
      roomId: data.roomId.present ? data.roomId.value : this.roomId,
      x: data.x.present ? data.x.value : this.x,
      y: data.y.present ? data.y.value : this.y,
      useSoundId:
          data.useSoundId.present ? data.useSoundId.value : this.useSoundId,
      label: data.label.present ? data.label.value : this.label,
      earconId: data.earconId.present ? data.earconId.value : this.earconId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoomExit(')
          ..write('id: $id, ')
          ..write('roomId: $roomId, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('useSoundId: $useSoundId, ')
          ..write('label: $label, ')
          ..write('earconId: $earconId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, roomId, x, y, useSoundId, label, earconId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomExit &&
          other.id == this.id &&
          other.roomId == this.roomId &&
          other.x == this.x &&
          other.y == this.y &&
          other.useSoundId == this.useSoundId &&
          other.label == this.label &&
          other.earconId == this.earconId);
}

class RoomExitsCompanion extends UpdateCompanion<RoomExit> {
  final Value<int> id;
  final Value<int> roomId;
  final Value<int> x;
  final Value<int> y;
  final Value<int?> useSoundId;
  final Value<String> label;
  final Value<int?> earconId;
  const RoomExitsCompanion({
    this.id = const Value.absent(),
    this.roomId = const Value.absent(),
    this.x = const Value.absent(),
    this.y = const Value.absent(),
    this.useSoundId = const Value.absent(),
    this.label = const Value.absent(),
    this.earconId = const Value.absent(),
  });
  RoomExitsCompanion.insert({
    this.id = const Value.absent(),
    required int roomId,
    this.x = const Value.absent(),
    this.y = const Value.absent(),
    this.useSoundId = const Value.absent(),
    this.label = const Value.absent(),
    this.earconId = const Value.absent(),
  }) : roomId = Value(roomId);
  static Insertable<RoomExit> custom({
    Expression<int>? id,
    Expression<int>? roomId,
    Expression<int>? x,
    Expression<int>? y,
    Expression<int>? useSoundId,
    Expression<String>? label,
    Expression<int>? earconId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roomId != null) 'room_id': roomId,
      if (x != null) 'x': x,
      if (y != null) 'y': y,
      if (useSoundId != null) 'use_sound_id': useSoundId,
      if (label != null) 'label': label,
      if (earconId != null) 'earcon_id': earconId,
    });
  }

  RoomExitsCompanion copyWith(
      {Value<int>? id,
      Value<int>? roomId,
      Value<int>? x,
      Value<int>? y,
      Value<int?>? useSoundId,
      Value<String>? label,
      Value<int?>? earconId}) {
    return RoomExitsCompanion(
      id: id ?? this.id,
      roomId: roomId ?? this.roomId,
      x: x ?? this.x,
      y: y ?? this.y,
      useSoundId: useSoundId ?? this.useSoundId,
      label: label ?? this.label,
      earconId: earconId ?? this.earconId,
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
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (earconId.present) {
      map['earcon_id'] = Variable<int>(earconId.value);
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
          ..write('useSoundId: $useSoundId, ')
          ..write('label: $label, ')
          ..write('earconId: $earconId')
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
  static const VerificationMeta _visibleMeta =
      const VerificationMeta('visible');
  @override
  late final GeneratedColumn<bool> visible = GeneratedColumn<bool>(
      'visible', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("visible" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _earconIdMeta =
      const VerificationMeta('earconId');
  @override
  late final GeneratedColumn<int> earconId = GeneratedColumn<int>(
      'earcon_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sound_references (id) ON DELETE SET NULL'));
  static const VerificationMeta _approachDistanceMeta =
      const VerificationMeta('approachDistance');
  @override
  late final GeneratedColumn<int> approachDistance = GeneratedColumn<int>(
      'approach_distance', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(2));
  static const VerificationMeta _onApproachCommandCallerIdMeta =
      const VerificationMeta('onApproachCommandCallerId');
  @override
  late final GeneratedColumn<int> onApproachCommandCallerId =
      GeneratedColumn<int>('on_approach_command_caller_id', aliasedName, true,
          type: DriftSqlType.int,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'REFERENCES command_callers (id) ON DELETE SET NULL'));
  static const VerificationMeta _onLeaveCommandCallerIdMeta =
      const VerificationMeta('onLeaveCommandCallerId');
  @override
  late final GeneratedColumn<int> onLeaveCommandCallerId = GeneratedColumn<int>(
      'on_leave_command_caller_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES command_callers (id) ON DELETE SET NULL'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        ambianceId,
        roomId,
        x,
        y,
        roomExitId,
        visible,
        earconId,
        approachDistance,
        onApproachCommandCallerId,
        onLeaveCommandCallerId
      ];
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
    if (data.containsKey('visible')) {
      context.handle(_visibleMeta,
          visible.isAcceptableOrUnknown(data['visible']!, _visibleMeta));
    }
    if (data.containsKey('earcon_id')) {
      context.handle(_earconIdMeta,
          earconId.isAcceptableOrUnknown(data['earcon_id']!, _earconIdMeta));
    }
    if (data.containsKey('approach_distance')) {
      context.handle(
          _approachDistanceMeta,
          approachDistance.isAcceptableOrUnknown(
              data['approach_distance']!, _approachDistanceMeta));
    }
    if (data.containsKey('on_approach_command_caller_id')) {
      context.handle(
          _onApproachCommandCallerIdMeta,
          onApproachCommandCallerId.isAcceptableOrUnknown(
              data['on_approach_command_caller_id']!,
              _onApproachCommandCallerIdMeta));
    }
    if (data.containsKey('on_leave_command_caller_id')) {
      context.handle(
          _onLeaveCommandCallerIdMeta,
          onLeaveCommandCallerId.isAcceptableOrUnknown(
              data['on_leave_command_caller_id']!,
              _onLeaveCommandCallerIdMeta));
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
      visible: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}visible'])!,
      earconId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}earcon_id']),
      approachDistance: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}approach_distance'])!,
      onApproachCommandCallerId: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}on_approach_command_caller_id']),
      onLeaveCommandCallerId: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}on_leave_command_caller_id']),
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

  /// Whether or not this object is visible to the player.
  ///
  /// If [visible] is `false`, then the player will still hear the ambiance.
  final bool visible;

  /// The ID of the earcon to use.
  final int? earconId;

  /// The distance at which an onApproach command will be called.
  final int approachDistance;

  /// The ID of a command caller to use when a player approaches this object.
  final int? onApproachCommandCallerId;

  /// The ID of a command caller to use when the player leaves this object
  /// behind.
  final int? onLeaveCommandCallerId;
  const RoomObject(
      {required this.id,
      required this.name,
      required this.description,
      this.ambianceId,
      required this.roomId,
      required this.x,
      required this.y,
      this.roomExitId,
      required this.visible,
      this.earconId,
      required this.approachDistance,
      this.onApproachCommandCallerId,
      this.onLeaveCommandCallerId});
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
    map['visible'] = Variable<bool>(visible);
    if (!nullToAbsent || earconId != null) {
      map['earcon_id'] = Variable<int>(earconId);
    }
    map['approach_distance'] = Variable<int>(approachDistance);
    if (!nullToAbsent || onApproachCommandCallerId != null) {
      map['on_approach_command_caller_id'] =
          Variable<int>(onApproachCommandCallerId);
    }
    if (!nullToAbsent || onLeaveCommandCallerId != null) {
      map['on_leave_command_caller_id'] = Variable<int>(onLeaveCommandCallerId);
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
      visible: Value(visible),
      earconId: earconId == null && nullToAbsent
          ? const Value.absent()
          : Value(earconId),
      approachDistance: Value(approachDistance),
      onApproachCommandCallerId:
          onApproachCommandCallerId == null && nullToAbsent
              ? const Value.absent()
              : Value(onApproachCommandCallerId),
      onLeaveCommandCallerId: onLeaveCommandCallerId == null && nullToAbsent
          ? const Value.absent()
          : Value(onLeaveCommandCallerId),
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
      visible: serializer.fromJson<bool>(json['visible']),
      earconId: serializer.fromJson<int?>(json['earconId']),
      approachDistance: serializer.fromJson<int>(json['approachDistance']),
      onApproachCommandCallerId:
          serializer.fromJson<int?>(json['onApproachCommandCallerId']),
      onLeaveCommandCallerId:
          serializer.fromJson<int?>(json['onLeaveCommandCallerId']),
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
      'visible': serializer.toJson<bool>(visible),
      'earconId': serializer.toJson<int?>(earconId),
      'approachDistance': serializer.toJson<int>(approachDistance),
      'onApproachCommandCallerId':
          serializer.toJson<int?>(onApproachCommandCallerId),
      'onLeaveCommandCallerId': serializer.toJson<int?>(onLeaveCommandCallerId),
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
          Value<int?> roomExitId = const Value.absent(),
          bool? visible,
          Value<int?> earconId = const Value.absent(),
          int? approachDistance,
          Value<int?> onApproachCommandCallerId = const Value.absent(),
          Value<int?> onLeaveCommandCallerId = const Value.absent()}) =>
      RoomObject(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        ambianceId: ambianceId.present ? ambianceId.value : this.ambianceId,
        roomId: roomId ?? this.roomId,
        x: x ?? this.x,
        y: y ?? this.y,
        roomExitId: roomExitId.present ? roomExitId.value : this.roomExitId,
        visible: visible ?? this.visible,
        earconId: earconId.present ? earconId.value : this.earconId,
        approachDistance: approachDistance ?? this.approachDistance,
        onApproachCommandCallerId: onApproachCommandCallerId.present
            ? onApproachCommandCallerId.value
            : this.onApproachCommandCallerId,
        onLeaveCommandCallerId: onLeaveCommandCallerId.present
            ? onLeaveCommandCallerId.value
            : this.onLeaveCommandCallerId,
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
      visible: data.visible.present ? data.visible.value : this.visible,
      earconId: data.earconId.present ? data.earconId.value : this.earconId,
      approachDistance: data.approachDistance.present
          ? data.approachDistance.value
          : this.approachDistance,
      onApproachCommandCallerId: data.onApproachCommandCallerId.present
          ? data.onApproachCommandCallerId.value
          : this.onApproachCommandCallerId,
      onLeaveCommandCallerId: data.onLeaveCommandCallerId.present
          ? data.onLeaveCommandCallerId.value
          : this.onLeaveCommandCallerId,
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
          ..write('roomExitId: $roomExitId, ')
          ..write('visible: $visible, ')
          ..write('earconId: $earconId, ')
          ..write('approachDistance: $approachDistance, ')
          ..write('onApproachCommandCallerId: $onApproachCommandCallerId, ')
          ..write('onLeaveCommandCallerId: $onLeaveCommandCallerId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      description,
      ambianceId,
      roomId,
      x,
      y,
      roomExitId,
      visible,
      earconId,
      approachDistance,
      onApproachCommandCallerId,
      onLeaveCommandCallerId);
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
          other.roomExitId == this.roomExitId &&
          other.visible == this.visible &&
          other.earconId == this.earconId &&
          other.approachDistance == this.approachDistance &&
          other.onApproachCommandCallerId == this.onApproachCommandCallerId &&
          other.onLeaveCommandCallerId == this.onLeaveCommandCallerId);
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
  final Value<bool> visible;
  final Value<int?> earconId;
  final Value<int> approachDistance;
  final Value<int?> onApproachCommandCallerId;
  final Value<int?> onLeaveCommandCallerId;
  const RoomObjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.ambianceId = const Value.absent(),
    this.roomId = const Value.absent(),
    this.x = const Value.absent(),
    this.y = const Value.absent(),
    this.roomExitId = const Value.absent(),
    this.visible = const Value.absent(),
    this.earconId = const Value.absent(),
    this.approachDistance = const Value.absent(),
    this.onApproachCommandCallerId = const Value.absent(),
    this.onLeaveCommandCallerId = const Value.absent(),
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
    this.visible = const Value.absent(),
    this.earconId = const Value.absent(),
    this.approachDistance = const Value.absent(),
    this.onApproachCommandCallerId = const Value.absent(),
    this.onLeaveCommandCallerId = const Value.absent(),
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
    Expression<bool>? visible,
    Expression<int>? earconId,
    Expression<int>? approachDistance,
    Expression<int>? onApproachCommandCallerId,
    Expression<int>? onLeaveCommandCallerId,
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
      if (visible != null) 'visible': visible,
      if (earconId != null) 'earcon_id': earconId,
      if (approachDistance != null) 'approach_distance': approachDistance,
      if (onApproachCommandCallerId != null)
        'on_approach_command_caller_id': onApproachCommandCallerId,
      if (onLeaveCommandCallerId != null)
        'on_leave_command_caller_id': onLeaveCommandCallerId,
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
      Value<int?>? roomExitId,
      Value<bool>? visible,
      Value<int?>? earconId,
      Value<int>? approachDistance,
      Value<int?>? onApproachCommandCallerId,
      Value<int?>? onLeaveCommandCallerId}) {
    return RoomObjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      ambianceId: ambianceId ?? this.ambianceId,
      roomId: roomId ?? this.roomId,
      x: x ?? this.x,
      y: y ?? this.y,
      roomExitId: roomExitId ?? this.roomExitId,
      visible: visible ?? this.visible,
      earconId: earconId ?? this.earconId,
      approachDistance: approachDistance ?? this.approachDistance,
      onApproachCommandCallerId:
          onApproachCommandCallerId ?? this.onApproachCommandCallerId,
      onLeaveCommandCallerId:
          onLeaveCommandCallerId ?? this.onLeaveCommandCallerId,
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
    if (visible.present) {
      map['visible'] = Variable<bool>(visible.value);
    }
    if (earconId.present) {
      map['earcon_id'] = Variable<int>(earconId.value);
    }
    if (approachDistance.present) {
      map['approach_distance'] = Variable<int>(approachDistance.value);
    }
    if (onApproachCommandCallerId.present) {
      map['on_approach_command_caller_id'] =
          Variable<int>(onApproachCommandCallerId.value);
    }
    if (onLeaveCommandCallerId.present) {
      map['on_leave_command_caller_id'] =
          Variable<int>(onLeaveCommandCallerId.value);
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
          ..write('roomExitId: $roomExitId, ')
          ..write('visible: $visible, ')
          ..write('earconId: $earconId, ')
          ..write('approachDistance: $approachDistance, ')
          ..write('onApproachCommandCallerId: $onApproachCommandCallerId, ')
          ..write('onLeaveCommandCallerId: $onLeaveCommandCallerId')
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

class $RoomObjectCommandCallersTable extends RoomObjectCommandCallers
    with TableInfo<$RoomObjectCommandCallersTable, RoomObjectCommandCaller> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomObjectCommandCallersTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _roomObjectIdMeta =
      const VerificationMeta('roomObjectId');
  @override
  late final GeneratedColumn<int> roomObjectId = GeneratedColumn<int>(
      'room_object_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES room_objects (id) ON DELETE CASCADE'));
  static const VerificationMeta _commandCallerIdMeta =
      const VerificationMeta('commandCallerId');
  @override
  late final GeneratedColumn<int> commandCallerId = GeneratedColumn<int>(
      'command_caller_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES command_callers (id) ON DELETE CASCADE'));
  static const VerificationMeta _earconIdMeta =
      const VerificationMeta('earconId');
  @override
  late final GeneratedColumn<int> earconId = GeneratedColumn<int>(
      'earcon_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sound_references (id) ON DELETE SET NULL'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, roomObjectId, commandCallerId, earconId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_object_command_callers';
  @override
  VerificationContext validateIntegrity(
      Insertable<RoomObjectCommandCaller> instance,
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
    if (data.containsKey('room_object_id')) {
      context.handle(
          _roomObjectIdMeta,
          roomObjectId.isAcceptableOrUnknown(
              data['room_object_id']!, _roomObjectIdMeta));
    } else if (isInserting) {
      context.missing(_roomObjectIdMeta);
    }
    if (data.containsKey('command_caller_id')) {
      context.handle(
          _commandCallerIdMeta,
          commandCallerId.isAcceptableOrUnknown(
              data['command_caller_id']!, _commandCallerIdMeta));
    } else if (isInserting) {
      context.missing(_commandCallerIdMeta);
    }
    if (data.containsKey('earcon_id')) {
      context.handle(_earconIdMeta,
          earconId.isAcceptableOrUnknown(data['earcon_id']!, _earconIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomObjectCommandCaller map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomObjectCommandCaller(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      roomObjectId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}room_object_id'])!,
      commandCallerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}command_caller_id'])!,
      earconId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}earcon_id']),
    );
  }

  @override
  $RoomObjectCommandCallersTable createAlias(String alias) {
    return $RoomObjectCommandCallersTable(attachedDatabase, alias);
  }
}

class RoomObjectCommandCaller extends DataClass
    implements Insertable<RoomObjectCommandCaller> {
  /// The primary key field.
  final int id;

  /// The name column.
  final String name;

  /// The ID of the room object to bind this command to.
  final int roomObjectId;

  /// The ID of the command caller to call.
  final int commandCallerId;

  /// The ID of the sound label to use for this command.
  final int? earconId;
  const RoomObjectCommandCaller(
      {required this.id,
      required this.name,
      required this.roomObjectId,
      required this.commandCallerId,
      this.earconId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['room_object_id'] = Variable<int>(roomObjectId);
    map['command_caller_id'] = Variable<int>(commandCallerId);
    if (!nullToAbsent || earconId != null) {
      map['earcon_id'] = Variable<int>(earconId);
    }
    return map;
  }

  RoomObjectCommandCallersCompanion toCompanion(bool nullToAbsent) {
    return RoomObjectCommandCallersCompanion(
      id: Value(id),
      name: Value(name),
      roomObjectId: Value(roomObjectId),
      commandCallerId: Value(commandCallerId),
      earconId: earconId == null && nullToAbsent
          ? const Value.absent()
          : Value(earconId),
    );
  }

  factory RoomObjectCommandCaller.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomObjectCommandCaller(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      roomObjectId: serializer.fromJson<int>(json['roomObjectId']),
      commandCallerId: serializer.fromJson<int>(json['commandCallerId']),
      earconId: serializer.fromJson<int?>(json['earconId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'roomObjectId': serializer.toJson<int>(roomObjectId),
      'commandCallerId': serializer.toJson<int>(commandCallerId),
      'earconId': serializer.toJson<int?>(earconId),
    };
  }

  RoomObjectCommandCaller copyWith(
          {int? id,
          String? name,
          int? roomObjectId,
          int? commandCallerId,
          Value<int?> earconId = const Value.absent()}) =>
      RoomObjectCommandCaller(
        id: id ?? this.id,
        name: name ?? this.name,
        roomObjectId: roomObjectId ?? this.roomObjectId,
        commandCallerId: commandCallerId ?? this.commandCallerId,
        earconId: earconId.present ? earconId.value : this.earconId,
      );
  RoomObjectCommandCaller copyWithCompanion(
      RoomObjectCommandCallersCompanion data) {
    return RoomObjectCommandCaller(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      roomObjectId: data.roomObjectId.present
          ? data.roomObjectId.value
          : this.roomObjectId,
      commandCallerId: data.commandCallerId.present
          ? data.commandCallerId.value
          : this.commandCallerId,
      earconId: data.earconId.present ? data.earconId.value : this.earconId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoomObjectCommandCaller(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('roomObjectId: $roomObjectId, ')
          ..write('commandCallerId: $commandCallerId, ')
          ..write('earconId: $earconId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, roomObjectId, commandCallerId, earconId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomObjectCommandCaller &&
          other.id == this.id &&
          other.name == this.name &&
          other.roomObjectId == this.roomObjectId &&
          other.commandCallerId == this.commandCallerId &&
          other.earconId == this.earconId);
}

class RoomObjectCommandCallersCompanion
    extends UpdateCompanion<RoomObjectCommandCaller> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> roomObjectId;
  final Value<int> commandCallerId;
  final Value<int?> earconId;
  const RoomObjectCommandCallersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.roomObjectId = const Value.absent(),
    this.commandCallerId = const Value.absent(),
    this.earconId = const Value.absent(),
  });
  RoomObjectCommandCallersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int roomObjectId,
    required int commandCallerId,
    this.earconId = const Value.absent(),
  })  : name = Value(name),
        roomObjectId = Value(roomObjectId),
        commandCallerId = Value(commandCallerId);
  static Insertable<RoomObjectCommandCaller> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? roomObjectId,
    Expression<int>? commandCallerId,
    Expression<int>? earconId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (roomObjectId != null) 'room_object_id': roomObjectId,
      if (commandCallerId != null) 'command_caller_id': commandCallerId,
      if (earconId != null) 'earcon_id': earconId,
    });
  }

  RoomObjectCommandCallersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? roomObjectId,
      Value<int>? commandCallerId,
      Value<int?>? earconId}) {
    return RoomObjectCommandCallersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      roomObjectId: roomObjectId ?? this.roomObjectId,
      commandCallerId: commandCallerId ?? this.commandCallerId,
      earconId: earconId ?? this.earconId,
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
    if (roomObjectId.present) {
      map['room_object_id'] = Variable<int>(roomObjectId.value);
    }
    if (commandCallerId.present) {
      map['command_caller_id'] = Variable<int>(commandCallerId.value);
    }
    if (earconId.present) {
      map['earcon_id'] = Variable<int>(earconId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomObjectCommandCallersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('roomObjectId: $roomObjectId, ')
          ..write('commandCallerId: $commandCallerId, ')
          ..write('earconId: $earconId')
          ..write(')'))
        .toString();
  }
}

class $RoomObjectMovementsTable extends RoomObjectMovements
    with TableInfo<$RoomObjectMovementsTable, RoomObjectMovement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomObjectMovementsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _minDelayMeta =
      const VerificationMeta('minDelay');
  @override
  late final GeneratedColumn<int> minDelay = GeneratedColumn<int>(
      'min_delay', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(2000));
  static const VerificationMeta _maxDelayMeta =
      const VerificationMeta('maxDelay');
  @override
  late final GeneratedColumn<int> maxDelay = GeneratedColumn<int>(
      'max_delay', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(5000));
  static const VerificationMeta _directionMeta =
      const VerificationMeta('direction');
  @override
  late final GeneratedColumnWithTypeConverter<MovingDirection, int> direction =
      GeneratedColumn<int>('direction', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: Constant(MovingDirection.forwards.index))
          .withConverter<MovingDirection>(
              $RoomObjectMovementsTable.$converterdirection);
  static const VerificationMeta _distanceMeta =
      const VerificationMeta('distance');
  @override
  late final GeneratedColumn<int> distance = GeneratedColumn<int>(
      'distance', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _onMoveCommandCallerIdMeta =
      const VerificationMeta('onMoveCommandCallerId');
  @override
  late final GeneratedColumn<int> onMoveCommandCallerId = GeneratedColumn<int>(
      'on_move_command_caller_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES command_callers (id) ON DELETE SET NULL'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        roomObjectId,
        minDelay,
        maxDelay,
        direction,
        distance,
        onMoveCommandCallerId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'room_object_movements';
  @override
  VerificationContext validateIntegrity(Insertable<RoomObjectMovement> instance,
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
    if (data.containsKey('min_delay')) {
      context.handle(_minDelayMeta,
          minDelay.isAcceptableOrUnknown(data['min_delay']!, _minDelayMeta));
    }
    if (data.containsKey('max_delay')) {
      context.handle(_maxDelayMeta,
          maxDelay.isAcceptableOrUnknown(data['max_delay']!, _maxDelayMeta));
    }
    context.handle(_directionMeta, const VerificationResult.success());
    if (data.containsKey('distance')) {
      context.handle(_distanceMeta,
          distance.isAcceptableOrUnknown(data['distance']!, _distanceMeta));
    }
    if (data.containsKey('on_move_command_caller_id')) {
      context.handle(
          _onMoveCommandCallerIdMeta,
          onMoveCommandCallerId.isAcceptableOrUnknown(
              data['on_move_command_caller_id']!, _onMoveCommandCallerIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoomObjectMovement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoomObjectMovement(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      roomObjectId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}room_object_id'])!,
      minDelay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}min_delay'])!,
      maxDelay: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_delay'])!,
      direction: $RoomObjectMovementsTable.$converterdirection.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}direction'])!),
      distance: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}distance'])!,
      onMoveCommandCallerId: attachedDatabase.typeMapping.read(DriftSqlType.int,
          data['${effectivePrefix}on_move_command_caller_id']),
    );
  }

  @override
  $RoomObjectMovementsTable createAlias(String alias) {
    return $RoomObjectMovementsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MovingDirection, int, int> $converterdirection =
      const EnumIndexConverter<MovingDirection>(MovingDirection.values);
}

class RoomObjectMovement extends DataClass
    implements Insertable<RoomObjectMovement> {
  /// The primary key field.
  final int id;

  /// The ID of a room object for this row.
  final int roomObjectId;

  /// The minimum number of milliseconds to wait before performing this
  /// movement.
  final int minDelay;

  /// The maximum number of milliseconds to wait before performing this
  /// movement.
  final int maxDelay;

  /// The direction to travel.
  final MovingDirection direction;

  /// The distance to travel in [direction].
  final int distance;

  /// The ID of a command to run when this movement is made.
  final int? onMoveCommandCallerId;
  const RoomObjectMovement(
      {required this.id,
      required this.roomObjectId,
      required this.minDelay,
      required this.maxDelay,
      required this.direction,
      required this.distance,
      this.onMoveCommandCallerId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['room_object_id'] = Variable<int>(roomObjectId);
    map['min_delay'] = Variable<int>(minDelay);
    map['max_delay'] = Variable<int>(maxDelay);
    {
      map['direction'] = Variable<int>(
          $RoomObjectMovementsTable.$converterdirection.toSql(direction));
    }
    map['distance'] = Variable<int>(distance);
    if (!nullToAbsent || onMoveCommandCallerId != null) {
      map['on_move_command_caller_id'] = Variable<int>(onMoveCommandCallerId);
    }
    return map;
  }

  RoomObjectMovementsCompanion toCompanion(bool nullToAbsent) {
    return RoomObjectMovementsCompanion(
      id: Value(id),
      roomObjectId: Value(roomObjectId),
      minDelay: Value(minDelay),
      maxDelay: Value(maxDelay),
      direction: Value(direction),
      distance: Value(distance),
      onMoveCommandCallerId: onMoveCommandCallerId == null && nullToAbsent
          ? const Value.absent()
          : Value(onMoveCommandCallerId),
    );
  }

  factory RoomObjectMovement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoomObjectMovement(
      id: serializer.fromJson<int>(json['id']),
      roomObjectId: serializer.fromJson<int>(json['roomObjectId']),
      minDelay: serializer.fromJson<int>(json['minDelay']),
      maxDelay: serializer.fromJson<int>(json['maxDelay']),
      direction: $RoomObjectMovementsTable.$converterdirection
          .fromJson(serializer.fromJson<int>(json['direction'])),
      distance: serializer.fromJson<int>(json['distance']),
      onMoveCommandCallerId:
          serializer.fromJson<int?>(json['onMoveCommandCallerId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'roomObjectId': serializer.toJson<int>(roomObjectId),
      'minDelay': serializer.toJson<int>(minDelay),
      'maxDelay': serializer.toJson<int>(maxDelay),
      'direction': serializer.toJson<int>(
          $RoomObjectMovementsTable.$converterdirection.toJson(direction)),
      'distance': serializer.toJson<int>(distance),
      'onMoveCommandCallerId': serializer.toJson<int?>(onMoveCommandCallerId),
    };
  }

  RoomObjectMovement copyWith(
          {int? id,
          int? roomObjectId,
          int? minDelay,
          int? maxDelay,
          MovingDirection? direction,
          int? distance,
          Value<int?> onMoveCommandCallerId = const Value.absent()}) =>
      RoomObjectMovement(
        id: id ?? this.id,
        roomObjectId: roomObjectId ?? this.roomObjectId,
        minDelay: minDelay ?? this.minDelay,
        maxDelay: maxDelay ?? this.maxDelay,
        direction: direction ?? this.direction,
        distance: distance ?? this.distance,
        onMoveCommandCallerId: onMoveCommandCallerId.present
            ? onMoveCommandCallerId.value
            : this.onMoveCommandCallerId,
      );
  RoomObjectMovement copyWithCompanion(RoomObjectMovementsCompanion data) {
    return RoomObjectMovement(
      id: data.id.present ? data.id.value : this.id,
      roomObjectId: data.roomObjectId.present
          ? data.roomObjectId.value
          : this.roomObjectId,
      minDelay: data.minDelay.present ? data.minDelay.value : this.minDelay,
      maxDelay: data.maxDelay.present ? data.maxDelay.value : this.maxDelay,
      direction: data.direction.present ? data.direction.value : this.direction,
      distance: data.distance.present ? data.distance.value : this.distance,
      onMoveCommandCallerId: data.onMoveCommandCallerId.present
          ? data.onMoveCommandCallerId.value
          : this.onMoveCommandCallerId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoomObjectMovement(')
          ..write('id: $id, ')
          ..write('roomObjectId: $roomObjectId, ')
          ..write('minDelay: $minDelay, ')
          ..write('maxDelay: $maxDelay, ')
          ..write('direction: $direction, ')
          ..write('distance: $distance, ')
          ..write('onMoveCommandCallerId: $onMoveCommandCallerId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, roomObjectId, minDelay, maxDelay,
      direction, distance, onMoveCommandCallerId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoomObjectMovement &&
          other.id == this.id &&
          other.roomObjectId == this.roomObjectId &&
          other.minDelay == this.minDelay &&
          other.maxDelay == this.maxDelay &&
          other.direction == this.direction &&
          other.distance == this.distance &&
          other.onMoveCommandCallerId == this.onMoveCommandCallerId);
}

class RoomObjectMovementsCompanion extends UpdateCompanion<RoomObjectMovement> {
  final Value<int> id;
  final Value<int> roomObjectId;
  final Value<int> minDelay;
  final Value<int> maxDelay;
  final Value<MovingDirection> direction;
  final Value<int> distance;
  final Value<int?> onMoveCommandCallerId;
  const RoomObjectMovementsCompanion({
    this.id = const Value.absent(),
    this.roomObjectId = const Value.absent(),
    this.minDelay = const Value.absent(),
    this.maxDelay = const Value.absent(),
    this.direction = const Value.absent(),
    this.distance = const Value.absent(),
    this.onMoveCommandCallerId = const Value.absent(),
  });
  RoomObjectMovementsCompanion.insert({
    this.id = const Value.absent(),
    required int roomObjectId,
    this.minDelay = const Value.absent(),
    this.maxDelay = const Value.absent(),
    this.direction = const Value.absent(),
    this.distance = const Value.absent(),
    this.onMoveCommandCallerId = const Value.absent(),
  }) : roomObjectId = Value(roomObjectId);
  static Insertable<RoomObjectMovement> custom({
    Expression<int>? id,
    Expression<int>? roomObjectId,
    Expression<int>? minDelay,
    Expression<int>? maxDelay,
    Expression<int>? direction,
    Expression<int>? distance,
    Expression<int>? onMoveCommandCallerId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roomObjectId != null) 'room_object_id': roomObjectId,
      if (minDelay != null) 'min_delay': minDelay,
      if (maxDelay != null) 'max_delay': maxDelay,
      if (direction != null) 'direction': direction,
      if (distance != null) 'distance': distance,
      if (onMoveCommandCallerId != null)
        'on_move_command_caller_id': onMoveCommandCallerId,
    });
  }

  RoomObjectMovementsCompanion copyWith(
      {Value<int>? id,
      Value<int>? roomObjectId,
      Value<int>? minDelay,
      Value<int>? maxDelay,
      Value<MovingDirection>? direction,
      Value<int>? distance,
      Value<int?>? onMoveCommandCallerId}) {
    return RoomObjectMovementsCompanion(
      id: id ?? this.id,
      roomObjectId: roomObjectId ?? this.roomObjectId,
      minDelay: minDelay ?? this.minDelay,
      maxDelay: maxDelay ?? this.maxDelay,
      direction: direction ?? this.direction,
      distance: distance ?? this.distance,
      onMoveCommandCallerId:
          onMoveCommandCallerId ?? this.onMoveCommandCallerId,
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
    if (minDelay.present) {
      map['min_delay'] = Variable<int>(minDelay.value);
    }
    if (maxDelay.present) {
      map['max_delay'] = Variable<int>(maxDelay.value);
    }
    if (direction.present) {
      map['direction'] = Variable<int>(
          $RoomObjectMovementsTable.$converterdirection.toSql(direction.value));
    }
    if (distance.present) {
      map['distance'] = Variable<int>(distance.value);
    }
    if (onMoveCommandCallerId.present) {
      map['on_move_command_caller_id'] =
          Variable<int>(onMoveCommandCallerId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomObjectMovementsCompanion(')
          ..write('id: $id, ')
          ..write('roomObjectId: $roomObjectId, ')
          ..write('minDelay: $minDelay, ')
          ..write('maxDelay: $maxDelay, ')
          ..write('direction: $direction, ')
          ..write('distance: $distance, ')
          ..write('onMoveCommandCallerId: $onMoveCommandCallerId')
          ..write(')'))
        .toString();
  }
}

class $CommandGameStatsTable extends CommandGameStats
    with TableInfo<$CommandGameStatsTable, CommandGameStat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommandGameStatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _gameStatIdMeta =
      const VerificationMeta('gameStatId');
  @override
  late final GeneratedColumn<int> gameStatId = GeneratedColumn<int>(
      'game_stat_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES game_stats (id) ON DELETE CASCADE'));
  static const VerificationMeta _commandIdMeta =
      const VerificationMeta('commandId');
  @override
  late final GeneratedColumn<int> commandId = GeneratedColumn<int>(
      'command_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES commands (id) ON DELETE CASCADE'));
  static const VerificationMeta _mathematicalOperatorMeta =
      const VerificationMeta('mathematicalOperator');
  @override
  late final GeneratedColumnWithTypeConverter<MathematicalOperator, int>
      mathematicalOperator = GeneratedColumn<int>(
              'mathematical_operator', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: Constant(MathematicalOperator.plus.index))
          .withConverter<MathematicalOperator>(
              $CommandGameStatsTable.$convertermathematicalOperator);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  @override
  List<GeneratedColumn> get $columns =>
      [id, gameStatId, commandId, mathematicalOperator, amount];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'command_game_stats';
  @override
  VerificationContext validateIntegrity(Insertable<CommandGameStat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('game_stat_id')) {
      context.handle(
          _gameStatIdMeta,
          gameStatId.isAcceptableOrUnknown(
              data['game_stat_id']!, _gameStatIdMeta));
    } else if (isInserting) {
      context.missing(_gameStatIdMeta);
    }
    if (data.containsKey('command_id')) {
      context.handle(_commandIdMeta,
          commandId.isAcceptableOrUnknown(data['command_id']!, _commandIdMeta));
    } else if (isInserting) {
      context.missing(_commandIdMeta);
    }
    context.handle(
        _mathematicalOperatorMeta, const VerificationResult.success());
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CommandGameStat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CommandGameStat(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      gameStatId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}game_stat_id'])!,
      commandId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}command_id'])!,
      mathematicalOperator: $CommandGameStatsTable
          .$convertermathematicalOperator
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.int,
              data['${effectivePrefix}mathematical_operator'])!),
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
    );
  }

  @override
  $CommandGameStatsTable createAlias(String alias) {
    return $CommandGameStatsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<MathematicalOperator, int, int>
      $convertermathematicalOperator =
      const EnumIndexConverter<MathematicalOperator>(
          MathematicalOperator.values);
}

class CommandGameStat extends DataClass implements Insertable<CommandGameStat> {
  /// The primary key field.
  final int id;

  /// The ID of the game stat to use.
  final int gameStatId;

  /// The ID of a command to attach this row to.
  final int commandId;

  /// The mathematical operator to use.
  final MathematicalOperator mathematicalOperator;

  /// The amount to add according to [mathematicalOperator].
  final int amount;
  const CommandGameStat(
      {required this.id,
      required this.gameStatId,
      required this.commandId,
      required this.mathematicalOperator,
      required this.amount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['game_stat_id'] = Variable<int>(gameStatId);
    map['command_id'] = Variable<int>(commandId);
    {
      map['mathematical_operator'] = Variable<int>($CommandGameStatsTable
          .$convertermathematicalOperator
          .toSql(mathematicalOperator));
    }
    map['amount'] = Variable<int>(amount);
    return map;
  }

  CommandGameStatsCompanion toCompanion(bool nullToAbsent) {
    return CommandGameStatsCompanion(
      id: Value(id),
      gameStatId: Value(gameStatId),
      commandId: Value(commandId),
      mathematicalOperator: Value(mathematicalOperator),
      amount: Value(amount),
    );
  }

  factory CommandGameStat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CommandGameStat(
      id: serializer.fromJson<int>(json['id']),
      gameStatId: serializer.fromJson<int>(json['gameStatId']),
      commandId: serializer.fromJson<int>(json['commandId']),
      mathematicalOperator: $CommandGameStatsTable
          .$convertermathematicalOperator
          .fromJson(serializer.fromJson<int>(json['mathematicalOperator'])),
      amount: serializer.fromJson<int>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameStatId': serializer.toJson<int>(gameStatId),
      'commandId': serializer.toJson<int>(commandId),
      'mathematicalOperator': serializer.toJson<int>($CommandGameStatsTable
          .$convertermathematicalOperator
          .toJson(mathematicalOperator)),
      'amount': serializer.toJson<int>(amount),
    };
  }

  CommandGameStat copyWith(
          {int? id,
          int? gameStatId,
          int? commandId,
          MathematicalOperator? mathematicalOperator,
          int? amount}) =>
      CommandGameStat(
        id: id ?? this.id,
        gameStatId: gameStatId ?? this.gameStatId,
        commandId: commandId ?? this.commandId,
        mathematicalOperator: mathematicalOperator ?? this.mathematicalOperator,
        amount: amount ?? this.amount,
      );
  CommandGameStat copyWithCompanion(CommandGameStatsCompanion data) {
    return CommandGameStat(
      id: data.id.present ? data.id.value : this.id,
      gameStatId:
          data.gameStatId.present ? data.gameStatId.value : this.gameStatId,
      commandId: data.commandId.present ? data.commandId.value : this.commandId,
      mathematicalOperator: data.mathematicalOperator.present
          ? data.mathematicalOperator.value
          : this.mathematicalOperator,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CommandGameStat(')
          ..write('id: $id, ')
          ..write('gameStatId: $gameStatId, ')
          ..write('commandId: $commandId, ')
          ..write('mathematicalOperator: $mathematicalOperator, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, gameStatId, commandId, mathematicalOperator, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommandGameStat &&
          other.id == this.id &&
          other.gameStatId == this.gameStatId &&
          other.commandId == this.commandId &&
          other.mathematicalOperator == this.mathematicalOperator &&
          other.amount == this.amount);
}

class CommandGameStatsCompanion extends UpdateCompanion<CommandGameStat> {
  final Value<int> id;
  final Value<int> gameStatId;
  final Value<int> commandId;
  final Value<MathematicalOperator> mathematicalOperator;
  final Value<int> amount;
  const CommandGameStatsCompanion({
    this.id = const Value.absent(),
    this.gameStatId = const Value.absent(),
    this.commandId = const Value.absent(),
    this.mathematicalOperator = const Value.absent(),
    this.amount = const Value.absent(),
  });
  CommandGameStatsCompanion.insert({
    this.id = const Value.absent(),
    required int gameStatId,
    required int commandId,
    this.mathematicalOperator = const Value.absent(),
    this.amount = const Value.absent(),
  })  : gameStatId = Value(gameStatId),
        commandId = Value(commandId);
  static Insertable<CommandGameStat> custom({
    Expression<int>? id,
    Expression<int>? gameStatId,
    Expression<int>? commandId,
    Expression<int>? mathematicalOperator,
    Expression<int>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameStatId != null) 'game_stat_id': gameStatId,
      if (commandId != null) 'command_id': commandId,
      if (mathematicalOperator != null)
        'mathematical_operator': mathematicalOperator,
      if (amount != null) 'amount': amount,
    });
  }

  CommandGameStatsCompanion copyWith(
      {Value<int>? id,
      Value<int>? gameStatId,
      Value<int>? commandId,
      Value<MathematicalOperator>? mathematicalOperator,
      Value<int>? amount}) {
    return CommandGameStatsCompanion(
      id: id ?? this.id,
      gameStatId: gameStatId ?? this.gameStatId,
      commandId: commandId ?? this.commandId,
      mathematicalOperator: mathematicalOperator ?? this.mathematicalOperator,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gameStatId.present) {
      map['game_stat_id'] = Variable<int>(gameStatId.value);
    }
    if (commandId.present) {
      map['command_id'] = Variable<int>(commandId.value);
    }
    if (mathematicalOperator.present) {
      map['mathematical_operator'] = Variable<int>($CommandGameStatsTable
          .$convertermathematicalOperator
          .toSql(mathematicalOperator.value));
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommandGameStatsCompanion(')
          ..write('id: $id, ')
          ..write('gameStatId: $gameStatId, ')
          ..write('commandId: $commandId, ')
          ..write('mathematicalOperator: $mathematicalOperator, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

class $QuestsTable extends Quests with TableInfo<$QuestsTable, Quest> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestsTable(this.attachedDatabase, [this._alias]);
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
  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quests';
  @override
  VerificationContext validateIntegrity(Insertable<Quest> instance,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Quest map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Quest(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $QuestsTable createAlias(String alias) {
    return $QuestsTable(attachedDatabase, alias);
  }
}

class Quest extends DataClass implements Insertable<Quest> {
  /// The primary key field.
  final int id;

  /// The name column.
  final String name;

  /// The description column.
  final String description;
  const Quest(
      {required this.id, required this.name, required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    return map;
  }

  QuestsCompanion toCompanion(bool nullToAbsent) {
    return QuestsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
    );
  }

  factory Quest.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Quest(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
    };
  }

  Quest copyWith({int? id, String? name, String? description}) => Quest(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
      );
  Quest copyWithCompanion(QuestsCompanion data) {
    return Quest(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Quest(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Quest &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description);
}

class QuestsCompanion extends UpdateCompanion<Quest> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  const QuestsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  QuestsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
  })  : name = Value(name),
        description = Value(description);
  static Insertable<Quest> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  QuestsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? description}) {
    return QuestsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $QuestStagesTable extends QuestStages
    with TableInfo<$QuestStagesTable, QuestStage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestStagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _questIdMeta =
      const VerificationMeta('questId');
  @override
  late final GeneratedColumn<int> questId = GeneratedColumn<int>(
      'quest_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES quests (id) ON DELETE CASCADE'));
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _labelSoundIdMeta =
      const VerificationMeta('labelSoundId');
  @override
  late final GeneratedColumn<int> labelSoundId = GeneratedColumn<int>(
      'label_sound_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES sound_references (id) ON DELETE SET NULL'));
  @override
  List<GeneratedColumn> get $columns => [id, questId, label, labelSoundId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quest_stages';
  @override
  VerificationContext validateIntegrity(Insertable<QuestStage> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('quest_id')) {
      context.handle(_questIdMeta,
          questId.isAcceptableOrUnknown(data['quest_id']!, _questIdMeta));
    } else if (isInserting) {
      context.missing(_questIdMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('label_sound_id')) {
      context.handle(
          _labelSoundIdMeta,
          labelSoundId.isAcceptableOrUnknown(
              data['label_sound_id']!, _labelSoundIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuestStage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestStage(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      questId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quest_id'])!,
      label: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
      labelSoundId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}label_sound_id']),
    );
  }

  @override
  $QuestStagesTable createAlias(String alias) {
    return $QuestStagesTable(attachedDatabase, alias);
  }
}

class QuestStage extends DataClass implements Insertable<QuestStage> {
  /// The primary key field.
  final int id;

  /// The ID of the quest this stage is part of.
  final int questId;

  /// The label of this quest stage.
  final String label;

  /// The ID of the label sound.
  final int? labelSoundId;
  const QuestStage(
      {required this.id,
      required this.questId,
      required this.label,
      this.labelSoundId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['quest_id'] = Variable<int>(questId);
    map['label'] = Variable<String>(label);
    if (!nullToAbsent || labelSoundId != null) {
      map['label_sound_id'] = Variable<int>(labelSoundId);
    }
    return map;
  }

  QuestStagesCompanion toCompanion(bool nullToAbsent) {
    return QuestStagesCompanion(
      id: Value(id),
      questId: Value(questId),
      label: Value(label),
      labelSoundId: labelSoundId == null && nullToAbsent
          ? const Value.absent()
          : Value(labelSoundId),
    );
  }

  factory QuestStage.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestStage(
      id: serializer.fromJson<int>(json['id']),
      questId: serializer.fromJson<int>(json['questId']),
      label: serializer.fromJson<String>(json['label']),
      labelSoundId: serializer.fromJson<int?>(json['labelSoundId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'questId': serializer.toJson<int>(questId),
      'label': serializer.toJson<String>(label),
      'labelSoundId': serializer.toJson<int?>(labelSoundId),
    };
  }

  QuestStage copyWith(
          {int? id,
          int? questId,
          String? label,
          Value<int?> labelSoundId = const Value.absent()}) =>
      QuestStage(
        id: id ?? this.id,
        questId: questId ?? this.questId,
        label: label ?? this.label,
        labelSoundId:
            labelSoundId.present ? labelSoundId.value : this.labelSoundId,
      );
  QuestStage copyWithCompanion(QuestStagesCompanion data) {
    return QuestStage(
      id: data.id.present ? data.id.value : this.id,
      questId: data.questId.present ? data.questId.value : this.questId,
      label: data.label.present ? data.label.value : this.label,
      labelSoundId: data.labelSoundId.present
          ? data.labelSoundId.value
          : this.labelSoundId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuestStage(')
          ..write('id: $id, ')
          ..write('questId: $questId, ')
          ..write('label: $label, ')
          ..write('labelSoundId: $labelSoundId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, questId, label, labelSoundId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestStage &&
          other.id == this.id &&
          other.questId == this.questId &&
          other.label == this.label &&
          other.labelSoundId == this.labelSoundId);
}

class QuestStagesCompanion extends UpdateCompanion<QuestStage> {
  final Value<int> id;
  final Value<int> questId;
  final Value<String> label;
  final Value<int?> labelSoundId;
  const QuestStagesCompanion({
    this.id = const Value.absent(),
    this.questId = const Value.absent(),
    this.label = const Value.absent(),
    this.labelSoundId = const Value.absent(),
  });
  QuestStagesCompanion.insert({
    this.id = const Value.absent(),
    required int questId,
    required String label,
    this.labelSoundId = const Value.absent(),
  })  : questId = Value(questId),
        label = Value(label);
  static Insertable<QuestStage> custom({
    Expression<int>? id,
    Expression<int>? questId,
    Expression<String>? label,
    Expression<int>? labelSoundId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (questId != null) 'quest_id': questId,
      if (label != null) 'label': label,
      if (labelSoundId != null) 'label_sound_id': labelSoundId,
    });
  }

  QuestStagesCompanion copyWith(
      {Value<int>? id,
      Value<int>? questId,
      Value<String>? label,
      Value<int?>? labelSoundId}) {
    return QuestStagesCompanion(
      id: id ?? this.id,
      questId: questId ?? this.questId,
      label: label ?? this.label,
      labelSoundId: labelSoundId ?? this.labelSoundId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (questId.present) {
      map['quest_id'] = Variable<int>(questId.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (labelSoundId.present) {
      map['label_sound_id'] = Variable<int>(labelSoundId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestStagesCompanion(')
          ..write('id: $id, ')
          ..write('questId: $questId, ')
          ..write('label: $label, ')
          ..write('labelSoundId: $labelSoundId')
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
  late final $CommandsTable commands = $CommandsTable(this);
  late final $CommandCallersTable commandCallers = $CommandCallersTable(this);
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
  late final $RoomObjectCommandCallersTable roomObjectCommandCallers =
      $RoomObjectCommandCallersTable(this);
  late final $RoomObjectMovementsTable roomObjectMovements =
      $RoomObjectMovementsTable(this);
  late final $CommandGameStatsTable commandGameStats =
      $CommandGameStatsTable(this);
  late final $QuestsTable quests = $QuestsTable(this);
  late final $QuestStagesTable questStages = $QuestStagesTable(this);
  late final Index roomObjectCoordinatesIndex = Index(
      'room_object_coordinates_index',
      'CREATE INDEX room_object_coordinates_index ON room_objects (x, y)');
  late final Index commandCallersCallingCommandIdIndex = Index(
      'command_callers_calling_command_id_index',
      'CREATE UNIQUE INDEX command_callers_calling_command_id_index ON command_callers (parent_command_id, child_command_id)');
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        soundReferences,
        zones,
        roomSurfaces,
        commands,
        commandCallers,
        rooms,
        roomExits,
        roomObjects,
        playerClasses,
        gameStats,
        roomSurfaceBoosts,
        roomSurfaceCosts,
        playerClassGameStats,
        roomObjectRandomSounds,
        roomObjectCommandCallers,
        roomObjectMovements,
        commandGameStats,
        quests,
        questStages,
        roomObjectCoordinatesIndex,
        commandCallersCallingCommandIdIndex
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('sound_references',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('commands', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('commands',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('command_callers', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('commands',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('command_callers', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('command_callers',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('rooms', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('command_callers',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('rooms', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('command_callers',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('rooms', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('rooms',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_exits', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('sound_references',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_exits', kind: UpdateKind.update),
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
            on: TableUpdateQuery.onTableName('sound_references',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_objects', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('command_callers',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_objects', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('command_callers',
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
          WritePropagation(
            on: TableUpdateQuery.onTableName('room_objects',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_object_command_callers',
                  kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('command_callers',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_object_command_callers',
                  kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('sound_references',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_object_command_callers',
                  kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('room_objects',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_object_movements', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('command_callers',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('room_object_movements', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('game_stats',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('command_game_stats', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('commands',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('command_game_stats', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('quests',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('quest_stages', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('sound_references',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('quest_stages', kind: UpdateKind.update),
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

  static MultiTypedResultKey<$CommandsTable, List<Command>> _commandsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.commands,
          aliasName:
              $_aliasNameGenerator(db.soundReferences.id, db.commands.soundId));

  $$CommandsTableProcessedTableManager get commandsRefs {
    final manager = $$CommandsTableTableManager($_db, $_db.commands)
        .filter((f) => f.soundId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_commandsRefsTable($_db));
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
      _room_exit_use_soundsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.roomExits,
              aliasName: $_aliasNameGenerator(
                  db.soundReferences.id, db.roomExits.useSoundId));

  $$RoomExitsTableProcessedTableManager get room_exit_use_sounds {
    final manager = $$RoomExitsTableTableManager($_db, $_db.roomExits)
        .filter((f) => f.useSoundId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_room_exit_use_soundsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RoomExitsTable, List<RoomExit>>
      _room_exits_earconsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.roomExits,
              aliasName: $_aliasNameGenerator(
                  db.soundReferences.id, db.roomExits.earconId));

  $$RoomExitsTableProcessedTableManager get room_exits_earcons {
    final manager = $$RoomExitsTableTableManager($_db, $_db.roomExits)
        .filter((f) => f.earconId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_room_exits_earconsTable($_db));
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

  static MultiTypedResultKey<$RoomObjectsTable, List<RoomObject>>
      _room_object_earconsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.roomObjects,
              aliasName: $_aliasNameGenerator(
                  db.soundReferences.id, db.roomObjects.earconId));

  $$RoomObjectsTableProcessedTableManager get room_object_earcons {
    final manager = $$RoomObjectsTableTableManager($_db, $_db.roomObjects)
        .filter((f) => f.earconId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_room_object_earconsTable($_db));
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

  static MultiTypedResultKey<$RoomObjectCommandCallersTable,
      List<RoomObjectCommandCaller>> _roomObjectCommandCallersRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.roomObjectCommandCallers,
          aliasName: $_aliasNameGenerator(
              db.soundReferences.id, db.roomObjectCommandCallers.earconId));

  $$RoomObjectCommandCallersTableProcessedTableManager
      get roomObjectCommandCallersRefs {
    final manager = $$RoomObjectCommandCallersTableTableManager(
            $_db, $_db.roomObjectCommandCallers)
        .filter((f) => f.earconId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_roomObjectCommandCallersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$QuestStagesTable, List<QuestStage>>
      _questStagesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.questStages,
              aliasName: $_aliasNameGenerator(
                  db.soundReferences.id, db.questStages.labelSoundId));

  $$QuestStagesTableProcessedTableManager get questStagesRefs {
    final manager = $$QuestStagesTableTableManager($_db, $_db.questStages)
        .filter((f) => f.labelSoundId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_questStagesRefsTable($_db));
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

  Expression<bool> commandsRefs(
      Expression<bool> Function($$CommandsTableFilterComposer f) f) {
    final $$CommandsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.commands,
        getReferencedColumn: (t) => t.soundId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandsTableFilterComposer(
              $db: $db,
              $table: $db.commands,
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

  Expression<bool> room_exit_use_sounds(
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

  Expression<bool> room_exits_earcons(
      Expression<bool> Function($$RoomExitsTableFilterComposer f) f) {
    final $$RoomExitsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomExits,
        getReferencedColumn: (t) => t.earconId,
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

  Expression<bool> room_object_earcons(
      Expression<bool> Function($$RoomObjectsTableFilterComposer f) f) {
    final $$RoomObjectsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomObjects,
        getReferencedColumn: (t) => t.earconId,
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

  Expression<bool> roomObjectCommandCallersRefs(
      Expression<bool> Function($$RoomObjectCommandCallersTableFilterComposer f)
          f) {
    final $$RoomObjectCommandCallersTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.roomObjectCommandCallers,
            getReferencedColumn: (t) => t.earconId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RoomObjectCommandCallersTableFilterComposer(
                  $db: $db,
                  $table: $db.roomObjectCommandCallers,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> questStagesRefs(
      Expression<bool> Function($$QuestStagesTableFilterComposer f) f) {
    final $$QuestStagesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.questStages,
        getReferencedColumn: (t) => t.labelSoundId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestStagesTableFilterComposer(
              $db: $db,
              $table: $db.questStages,
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

  Expression<T> commandsRefs<T extends Object>(
      Expression<T> Function($$CommandsTableAnnotationComposer a) f) {
    final $$CommandsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.commands,
        getReferencedColumn: (t) => t.soundId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandsTableAnnotationComposer(
              $db: $db,
              $table: $db.commands,
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

  Expression<T> room_exit_use_sounds<T extends Object>(
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

  Expression<T> room_exits_earcons<T extends Object>(
      Expression<T> Function($$RoomExitsTableAnnotationComposer a) f) {
    final $$RoomExitsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomExits,
        getReferencedColumn: (t) => t.earconId,
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

  Expression<T> room_object_earcons<T extends Object>(
      Expression<T> Function($$RoomObjectsTableAnnotationComposer a) f) {
    final $$RoomObjectsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomObjects,
        getReferencedColumn: (t) => t.earconId,
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

  Expression<T> roomObjectCommandCallersRefs<T extends Object>(
      Expression<T> Function(
              $$RoomObjectCommandCallersTableAnnotationComposer a)
          f) {
    final $$RoomObjectCommandCallersTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.roomObjectCommandCallers,
            getReferencedColumn: (t) => t.earconId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RoomObjectCommandCallersTableAnnotationComposer(
                  $db: $db,
                  $table: $db.roomObjectCommandCallers,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> questStagesRefs<T extends Object>(
      Expression<T> Function($$QuestStagesTableAnnotationComposer a) f) {
    final $$QuestStagesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.questStages,
        getReferencedColumn: (t) => t.labelSoundId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestStagesTableAnnotationComposer(
              $db: $db,
              $table: $db.questStages,
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
        bool commandsRefs,
        bool roomsRefs,
        bool room_exit_use_sounds,
        bool room_exits_earcons,
        bool roomObjectsRefs,
        bool room_object_earcons,
        bool roomSurfaceBoostBoostSounds,
        bool roomSurfaceBoostMaxedOutSounds,
        bool roomSurfaceCostsRefs,
        bool roomObjectRandomSoundsRefs,
        bool roomObjectCommandCallersRefs,
        bool questStagesRefs})> {
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
              commandsRefs = false,
              roomsRefs = false,
              room_exit_use_sounds = false,
              room_exits_earcons = false,
              roomObjectsRefs = false,
              room_object_earcons = false,
              roomSurfaceBoostBoostSounds = false,
              roomSurfaceBoostMaxedOutSounds = false,
              roomSurfaceCostsRefs = false,
              roomObjectRandomSoundsRefs = false,
              roomObjectCommandCallersRefs = false,
              questStagesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (zonesRefs) db.zones,
                if (footstepsSurfaces) db.roomSurfaces,
                if (wallSoundsSurfaces) db.roomSurfaces,
                if (commandsRefs) db.commands,
                if (roomsRefs) db.rooms,
                if (room_exit_use_sounds) db.roomExits,
                if (room_exits_earcons) db.roomExits,
                if (roomObjectsRefs) db.roomObjects,
                if (room_object_earcons) db.roomObjects,
                if (roomSurfaceBoostBoostSounds) db.roomSurfaceBoosts,
                if (roomSurfaceBoostMaxedOutSounds) db.roomSurfaceBoosts,
                if (roomSurfaceCostsRefs) db.roomSurfaceCosts,
                if (roomObjectRandomSoundsRefs) db.roomObjectRandomSounds,
                if (roomObjectCommandCallersRefs) db.roomObjectCommandCallers,
                if (questStagesRefs) db.questStages
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (zonesRefs)
                    await $_getPrefetchedData<SoundReference,
                            $SoundReferencesTable, Zone>(
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
                    await $_getPrefetchedData<SoundReference,
                            $SoundReferencesTable, RoomSurface>(
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
                    await $_getPrefetchedData<SoundReference,
                            $SoundReferencesTable, RoomSurface>(
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
                  if (commandsRefs)
                    await $_getPrefetchedData<SoundReference,
                            $SoundReferencesTable, Command>(
                        currentTable: table,
                        referencedTable: $$SoundReferencesTableReferences
                            ._commandsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SoundReferencesTableReferences(db, table, p0)
                                .commandsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.soundId == item.id),
                        typedResults: items),
                  if (roomsRefs)
                    await $_getPrefetchedData<SoundReference,
                            $SoundReferencesTable, Room>(
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
                  if (room_exit_use_sounds)
                    await $_getPrefetchedData<SoundReference,
                            $SoundReferencesTable, RoomExit>(
                        currentTable: table,
                        referencedTable: $$SoundReferencesTableReferences
                            ._room_exit_use_soundsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SoundReferencesTableReferences(db, table, p0)
                                .room_exit_use_sounds,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.useSoundId == item.id),
                        typedResults: items),
                  if (room_exits_earcons)
                    await $_getPrefetchedData<SoundReference,
                            $SoundReferencesTable, RoomExit>(
                        currentTable: table,
                        referencedTable: $$SoundReferencesTableReferences
                            ._room_exits_earconsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SoundReferencesTableReferences(db, table, p0)
                                .room_exits_earcons,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.earconId == item.id),
                        typedResults: items),
                  if (roomObjectsRefs)
                    await $_getPrefetchedData<SoundReference, $SoundReferencesTable,
                            RoomObject>(
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
                  if (room_object_earcons)
                    await $_getPrefetchedData<SoundReference, $SoundReferencesTable,
                            RoomObject>(
                        currentTable: table,
                        referencedTable: $$SoundReferencesTableReferences
                            ._room_object_earconsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SoundReferencesTableReferences(db, table, p0)
                                .room_object_earcons,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.earconId == item.id),
                        typedResults: items),
                  if (roomSurfaceBoostBoostSounds)
                    await $_getPrefetchedData<SoundReference,
                            $SoundReferencesTable, RoomSurfaceBoost>(
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
                    await $_getPrefetchedData<SoundReference,
                            $SoundReferencesTable, RoomSurfaceBoost>(
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
                    await $_getPrefetchedData<SoundReference,
                            $SoundReferencesTable, RoomSurfaceCost>(
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
                    await $_getPrefetchedData<SoundReference,
                            $SoundReferencesTable, RoomObjectRandomSound>(
                        currentTable: table,
                        referencedTable: $$SoundReferencesTableReferences
                            ._roomObjectRandomSoundsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SoundReferencesTableReferences(db, table, p0)
                                .roomObjectRandomSoundsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.soundId == item.id),
                        typedResults: items),
                  if (roomObjectCommandCallersRefs)
                    await $_getPrefetchedData<SoundReference,
                            $SoundReferencesTable, RoomObjectCommandCaller>(
                        currentTable: table,
                        referencedTable: $$SoundReferencesTableReferences
                            ._roomObjectCommandCallersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SoundReferencesTableReferences(db, table, p0)
                                .roomObjectCommandCallersRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.earconId == item.id),
                        typedResults: items),
                  if (questStagesRefs)
                    await $_getPrefetchedData<SoundReference, $SoundReferencesTable,
                            QuestStage>(
                        currentTable: table,
                        referencedTable: $$SoundReferencesTableReferences
                            ._questStagesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SoundReferencesTableReferences(db, table, p0)
                                .questStagesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.labelSoundId == item.id),
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
        bool commandsRefs,
        bool roomsRefs,
        bool room_exit_use_sounds,
        bool room_exits_earcons,
        bool roomObjectsRefs,
        bool room_object_earcons,
        bool roomSurfaceBoostBoostSounds,
        bool roomSurfaceBoostMaxedOutSounds,
        bool roomSurfaceCostsRefs,
        bool roomObjectRandomSoundsRefs,
        bool roomObjectCommandCallersRefs,
        bool questStagesRefs})>;
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
                    await $_getPrefetchedData<Zone, $ZonesTable, Room>(
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
                    await $_getPrefetchedData<RoomSurface, $RoomSurfacesTable,
                            Room>(
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
                    await $_getPrefetchedData<RoomSurface, $RoomSurfacesTable, RoomSurfaceBoost>(
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
                    await $_getPrefetchedData<RoomSurface, $RoomSurfacesTable,
                            RoomSurfaceCost>(
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
typedef $$CommandsTableCreateCompanionBuilder = CommandsCompanion Function({
  Value<int> id,
  required String description,
  Value<String?> spokenMessage,
  Value<int?> soundId,
  Value<String?> url,
});
typedef $$CommandsTableUpdateCompanionBuilder = CommandsCompanion Function({
  Value<int> id,
  Value<String> description,
  Value<String?> spokenMessage,
  Value<int?> soundId,
  Value<String?> url,
});

final class $$CommandsTableReferences
    extends BaseReferences<_$AppDatabase, $CommandsTable, Command> {
  $$CommandsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SoundReferencesTable _soundIdTable(_$AppDatabase db) =>
      db.soundReferences.createAlias(
          $_aliasNameGenerator(db.commands.soundId, db.soundReferences.id));

  $$SoundReferencesTableProcessedTableManager? get soundId {
    final $_column = $_itemColumn<int>('sound_id');
    if ($_column == null) return null;
    final manager =
        $$SoundReferencesTableTableManager($_db, $_db.soundReferences)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_soundIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$CommandCallersTable, List<CommandCaller>>
      _commandsToCallTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.commandCallers,
              aliasName: $_aliasNameGenerator(
                  db.commands.id, db.commandCallers.parentCommandId));

  $$CommandCallersTableProcessedTableManager get commandsToCall {
    final manager = $$CommandCallersTableTableManager($_db, $_db.commandCallers)
        .filter(
            (f) => f.parentCommandId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_commandsToCallTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$CommandCallersTable, List<CommandCaller>>
      _commandCallersTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.commandCallers,
              aliasName: $_aliasNameGenerator(
                  db.commands.id, db.commandCallers.childCommandId));

  $$CommandCallersTableProcessedTableManager get commandCallers {
    final manager = $$CommandCallersTableTableManager($_db, $_db.commandCallers)
        .filter((f) => f.childCommandId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_commandCallersTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$CommandGameStatsTable, List<CommandGameStat>>
      _commandGameStatsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.commandGameStats,
              aliasName: $_aliasNameGenerator(
                  db.commands.id, db.commandGameStats.commandId));

  $$CommandGameStatsTableProcessedTableManager get commandGameStatsRefs {
    final manager =
        $$CommandGameStatsTableTableManager($_db, $_db.commandGameStats)
            .filter((f) => f.commandId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_commandGameStatsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CommandsTableFilterComposer
    extends Composer<_$AppDatabase, $CommandsTable> {
  $$CommandsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get spokenMessage => $composableBuilder(
      column: $table.spokenMessage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnFilters(column));

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

  Expression<bool> commandsToCall(
      Expression<bool> Function($$CommandCallersTableFilterComposer f) f) {
    final $$CommandCallersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.parentCommandId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableFilterComposer(
              $db: $db,
              $table: $db.commandCallers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> commandCallers(
      Expression<bool> Function($$CommandCallersTableFilterComposer f) f) {
    final $$CommandCallersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.childCommandId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableFilterComposer(
              $db: $db,
              $table: $db.commandCallers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> commandGameStatsRefs(
      Expression<bool> Function($$CommandGameStatsTableFilterComposer f) f) {
    final $$CommandGameStatsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.commandGameStats,
        getReferencedColumn: (t) => t.commandId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandGameStatsTableFilterComposer(
              $db: $db,
              $table: $db.commandGameStats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CommandsTableOrderingComposer
    extends Composer<_$AppDatabase, $CommandsTable> {
  $$CommandsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get spokenMessage => $composableBuilder(
      column: $table.spokenMessage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnOrderings(column));

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

class $$CommandsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CommandsTable> {
  $$CommandsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get spokenMessage => $composableBuilder(
      column: $table.spokenMessage, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

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

  Expression<T> commandsToCall<T extends Object>(
      Expression<T> Function($$CommandCallersTableAnnotationComposer a) f) {
    final $$CommandCallersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.parentCommandId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableAnnotationComposer(
              $db: $db,
              $table: $db.commandCallers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> commandCallers<T extends Object>(
      Expression<T> Function($$CommandCallersTableAnnotationComposer a) f) {
    final $$CommandCallersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.childCommandId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableAnnotationComposer(
              $db: $db,
              $table: $db.commandCallers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> commandGameStatsRefs<T extends Object>(
      Expression<T> Function($$CommandGameStatsTableAnnotationComposer a) f) {
    final $$CommandGameStatsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.commandGameStats,
        getReferencedColumn: (t) => t.commandId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandGameStatsTableAnnotationComposer(
              $db: $db,
              $table: $db.commandGameStats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CommandsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CommandsTable,
    Command,
    $$CommandsTableFilterComposer,
    $$CommandsTableOrderingComposer,
    $$CommandsTableAnnotationComposer,
    $$CommandsTableCreateCompanionBuilder,
    $$CommandsTableUpdateCompanionBuilder,
    (Command, $$CommandsTableReferences),
    Command,
    PrefetchHooks Function(
        {bool soundId,
        bool commandsToCall,
        bool commandCallers,
        bool commandGameStatsRefs})> {
  $$CommandsTableTableManager(_$AppDatabase db, $CommandsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CommandsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CommandsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CommandsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String?> spokenMessage = const Value.absent(),
            Value<int?> soundId = const Value.absent(),
            Value<String?> url = const Value.absent(),
          }) =>
              CommandsCompanion(
            id: id,
            description: description,
            spokenMessage: spokenMessage,
            soundId: soundId,
            url: url,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String description,
            Value<String?> spokenMessage = const Value.absent(),
            Value<int?> soundId = const Value.absent(),
            Value<String?> url = const Value.absent(),
          }) =>
              CommandsCompanion.insert(
            id: id,
            description: description,
            spokenMessage: spokenMessage,
            soundId: soundId,
            url: url,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$CommandsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {soundId = false,
              commandsToCall = false,
              commandCallers = false,
              commandGameStatsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (commandsToCall) db.commandCallers,
                if (commandCallers) db.commandCallers,
                if (commandGameStatsRefs) db.commandGameStats
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
                if (soundId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.soundId,
                    referencedTable:
                        $$CommandsTableReferences._soundIdTable(db),
                    referencedColumn:
                        $$CommandsTableReferences._soundIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (commandsToCall)
                    await $_getPrefetchedData<Command, $CommandsTable,
                            CommandCaller>(
                        currentTable: table,
                        referencedTable:
                            $$CommandsTableReferences._commandsToCallTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CommandsTableReferences(db, table, p0)
                                .commandsToCall,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.parentCommandId == item.id),
                        typedResults: items),
                  if (commandCallers)
                    await $_getPrefetchedData<Command, $CommandsTable,
                            CommandCaller>(
                        currentTable: table,
                        referencedTable:
                            $$CommandsTableReferences._commandCallersTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CommandsTableReferences(db, table, p0)
                                .commandCallers,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.childCommandId == item.id),
                        typedResults: items),
                  if (commandGameStatsRefs)
                    await $_getPrefetchedData<Command, $CommandsTable,
                            CommandGameStat>(
                        currentTable: table,
                        referencedTable: $$CommandsTableReferences
                            ._commandGameStatsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CommandsTableReferences(db, table, p0)
                                .commandGameStatsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.commandId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CommandsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CommandsTable,
    Command,
    $$CommandsTableFilterComposer,
    $$CommandsTableOrderingComposer,
    $$CommandsTableAnnotationComposer,
    $$CommandsTableCreateCompanionBuilder,
    $$CommandsTableUpdateCompanionBuilder,
    (Command, $$CommandsTableReferences),
    Command,
    PrefetchHooks Function(
        {bool soundId,
        bool commandsToCall,
        bool commandCallers,
        bool commandGameStatsRefs})>;
typedef $$CommandCallersTableCreateCompanionBuilder = CommandCallersCompanion
    Function({
  Value<int> id,
  Value<int?> parentCommandId,
  required int childCommandId,
  Value<int?> callAfter,
});
typedef $$CommandCallersTableUpdateCompanionBuilder = CommandCallersCompanion
    Function({
  Value<int> id,
  Value<int?> parentCommandId,
  Value<int> childCommandId,
  Value<int?> callAfter,
});

final class $$CommandCallersTableReferences
    extends BaseReferences<_$AppDatabase, $CommandCallersTable, CommandCaller> {
  $$CommandCallersTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CommandsTable _parentCommandIdTable(_$AppDatabase db) =>
      db.commands.createAlias($_aliasNameGenerator(
          db.commandCallers.parentCommandId, db.commands.id));

  $$CommandsTableProcessedTableManager? get parentCommandId {
    final $_column = $_itemColumn<int>('parent_command_id');
    if ($_column == null) return null;
    final manager = $$CommandsTableTableManager($_db, $_db.commands)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentCommandIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CommandsTable _childCommandIdTable(_$AppDatabase db) =>
      db.commands.createAlias($_aliasNameGenerator(
          db.commandCallers.childCommandId, db.commands.id));

  $$CommandsTableProcessedTableManager get childCommandId {
    final $_column = $_itemColumn<int>('child_command_id')!;

    final manager = $$CommandsTableTableManager($_db, $_db.commands)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_childCommandIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$RoomsTable, List<Room>>
      _onEnterCommandCallersTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.rooms,
              aliasName: $_aliasNameGenerator(
                  db.commandCallers.id, db.rooms.onEnterCommandCallerId));

  $$RoomsTableProcessedTableManager get onEnterCommandCallers {
    final manager = $$RoomsTableTableManager($_db, $_db.rooms).filter(
        (f) => f.onEnterCommandCallerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_onEnterCommandCallersTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RoomsTable, List<Room>>
      _onExitCommandCallersTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.rooms,
              aliasName: $_aliasNameGenerator(
                  db.commandCallers.id, db.rooms.onExitCommandCallerId));

  $$RoomsTableProcessedTableManager get onExitCommandCallers {
    final manager = $$RoomsTableTableManager($_db, $_db.rooms).filter(
        (f) => f.onExitCommandCallerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_onExitCommandCallersTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RoomsTable, List<Room>>
      _onTeleportCommandCallersTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.rooms,
              aliasName: $_aliasNameGenerator(
                  db.commandCallers.id, db.rooms.onTeleportCommandCallerId));

  $$RoomsTableProcessedTableManager get onTeleportCommandCallers {
    final manager = $$RoomsTableTableManager($_db, $_db.rooms).filter((f) =>
        f.onTeleportCommandCallerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_onTeleportCommandCallersTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RoomObjectsTable, List<RoomObject>>
      _onApproachCommandCallersTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.roomObjects,
              aliasName: $_aliasNameGenerator(db.commandCallers.id,
                  db.roomObjects.onApproachCommandCallerId));

  $$RoomObjectsTableProcessedTableManager get onApproachCommandCallers {
    final manager = $$RoomObjectsTableTableManager($_db, $_db.roomObjects)
        .filter((f) =>
            f.onApproachCommandCallerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_onApproachCommandCallersTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RoomObjectsTable, List<RoomObject>>
      _onLeaveCommandCallersTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.roomObjects,
              aliasName: $_aliasNameGenerator(
                  db.commandCallers.id, db.roomObjects.onLeaveCommandCallerId));

  $$RoomObjectsTableProcessedTableManager get onLeaveCommandCallers {
    final manager = $$RoomObjectsTableTableManager($_db, $_db.roomObjects)
        .filter((f) =>
            f.onLeaveCommandCallerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_onLeaveCommandCallersTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RoomObjectCommandCallersTable,
      List<RoomObjectCommandCaller>> _roomObjectCommandCallersRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.roomObjectCommandCallers,
          aliasName: $_aliasNameGenerator(db.commandCallers.id,
              db.roomObjectCommandCallers.commandCallerId));

  $$RoomObjectCommandCallersTableProcessedTableManager
      get roomObjectCommandCallersRefs {
    final manager = $$RoomObjectCommandCallersTableTableManager(
            $_db, $_db.roomObjectCommandCallers)
        .filter(
            (f) => f.commandCallerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_roomObjectCommandCallersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RoomObjectMovementsTable,
      List<RoomObjectMovement>> _onMoveCommandCallersTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.roomObjectMovements,
          aliasName: $_aliasNameGenerator(db.commandCallers.id,
              db.roomObjectMovements.onMoveCommandCallerId));

  $$RoomObjectMovementsTableProcessedTableManager get onMoveCommandCallers {
    final manager =
        $$RoomObjectMovementsTableTableManager($_db, $_db.roomObjectMovements)
            .filter((f) =>
                f.onMoveCommandCallerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_onMoveCommandCallersTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CommandCallersTableFilterComposer
    extends Composer<_$AppDatabase, $CommandCallersTable> {
  $$CommandCallersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get callAfter => $composableBuilder(
      column: $table.callAfter, builder: (column) => ColumnFilters(column));

  $$CommandsTableFilterComposer get parentCommandId {
    final $$CommandsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentCommandId,
        referencedTable: $db.commands,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandsTableFilterComposer(
              $db: $db,
              $table: $db.commands,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CommandsTableFilterComposer get childCommandId {
    final $$CommandsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.childCommandId,
        referencedTable: $db.commands,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandsTableFilterComposer(
              $db: $db,
              $table: $db.commands,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> onEnterCommandCallers(
      Expression<bool> Function($$RoomsTableFilterComposer f) f) {
    final $$RoomsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.rooms,
        getReferencedColumn: (t) => t.onEnterCommandCallerId,
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

  Expression<bool> onExitCommandCallers(
      Expression<bool> Function($$RoomsTableFilterComposer f) f) {
    final $$RoomsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.rooms,
        getReferencedColumn: (t) => t.onExitCommandCallerId,
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

  Expression<bool> onTeleportCommandCallers(
      Expression<bool> Function($$RoomsTableFilterComposer f) f) {
    final $$RoomsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.rooms,
        getReferencedColumn: (t) => t.onTeleportCommandCallerId,
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

  Expression<bool> onApproachCommandCallers(
      Expression<bool> Function($$RoomObjectsTableFilterComposer f) f) {
    final $$RoomObjectsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomObjects,
        getReferencedColumn: (t) => t.onApproachCommandCallerId,
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

  Expression<bool> onLeaveCommandCallers(
      Expression<bool> Function($$RoomObjectsTableFilterComposer f) f) {
    final $$RoomObjectsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomObjects,
        getReferencedColumn: (t) => t.onLeaveCommandCallerId,
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

  Expression<bool> roomObjectCommandCallersRefs(
      Expression<bool> Function($$RoomObjectCommandCallersTableFilterComposer f)
          f) {
    final $$RoomObjectCommandCallersTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.roomObjectCommandCallers,
            getReferencedColumn: (t) => t.commandCallerId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RoomObjectCommandCallersTableFilterComposer(
                  $db: $db,
                  $table: $db.roomObjectCommandCallers,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> onMoveCommandCallers(
      Expression<bool> Function($$RoomObjectMovementsTableFilterComposer f) f) {
    final $$RoomObjectMovementsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomObjectMovements,
        getReferencedColumn: (t) => t.onMoveCommandCallerId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomObjectMovementsTableFilterComposer(
              $db: $db,
              $table: $db.roomObjectMovements,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CommandCallersTableOrderingComposer
    extends Composer<_$AppDatabase, $CommandCallersTable> {
  $$CommandCallersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get callAfter => $composableBuilder(
      column: $table.callAfter, builder: (column) => ColumnOrderings(column));

  $$CommandsTableOrderingComposer get parentCommandId {
    final $$CommandsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentCommandId,
        referencedTable: $db.commands,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandsTableOrderingComposer(
              $db: $db,
              $table: $db.commands,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CommandsTableOrderingComposer get childCommandId {
    final $$CommandsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.childCommandId,
        referencedTable: $db.commands,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandsTableOrderingComposer(
              $db: $db,
              $table: $db.commands,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CommandCallersTableAnnotationComposer
    extends Composer<_$AppDatabase, $CommandCallersTable> {
  $$CommandCallersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get callAfter =>
      $composableBuilder(column: $table.callAfter, builder: (column) => column);

  $$CommandsTableAnnotationComposer get parentCommandId {
    final $$CommandsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentCommandId,
        referencedTable: $db.commands,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandsTableAnnotationComposer(
              $db: $db,
              $table: $db.commands,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CommandsTableAnnotationComposer get childCommandId {
    final $$CommandsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.childCommandId,
        referencedTable: $db.commands,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandsTableAnnotationComposer(
              $db: $db,
              $table: $db.commands,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> onEnterCommandCallers<T extends Object>(
      Expression<T> Function($$RoomsTableAnnotationComposer a) f) {
    final $$RoomsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.rooms,
        getReferencedColumn: (t) => t.onEnterCommandCallerId,
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

  Expression<T> onExitCommandCallers<T extends Object>(
      Expression<T> Function($$RoomsTableAnnotationComposer a) f) {
    final $$RoomsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.rooms,
        getReferencedColumn: (t) => t.onExitCommandCallerId,
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

  Expression<T> onTeleportCommandCallers<T extends Object>(
      Expression<T> Function($$RoomsTableAnnotationComposer a) f) {
    final $$RoomsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.rooms,
        getReferencedColumn: (t) => t.onTeleportCommandCallerId,
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

  Expression<T> onApproachCommandCallers<T extends Object>(
      Expression<T> Function($$RoomObjectsTableAnnotationComposer a) f) {
    final $$RoomObjectsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomObjects,
        getReferencedColumn: (t) => t.onApproachCommandCallerId,
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

  Expression<T> onLeaveCommandCallers<T extends Object>(
      Expression<T> Function($$RoomObjectsTableAnnotationComposer a) f) {
    final $$RoomObjectsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomObjects,
        getReferencedColumn: (t) => t.onLeaveCommandCallerId,
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

  Expression<T> roomObjectCommandCallersRefs<T extends Object>(
      Expression<T> Function(
              $$RoomObjectCommandCallersTableAnnotationComposer a)
          f) {
    final $$RoomObjectCommandCallersTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.roomObjectCommandCallers,
            getReferencedColumn: (t) => t.commandCallerId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RoomObjectCommandCallersTableAnnotationComposer(
                  $db: $db,
                  $table: $db.roomObjectCommandCallers,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> onMoveCommandCallers<T extends Object>(
      Expression<T> Function($$RoomObjectMovementsTableAnnotationComposer a)
          f) {
    final $$RoomObjectMovementsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.roomObjectMovements,
            getReferencedColumn: (t) => t.onMoveCommandCallerId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RoomObjectMovementsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.roomObjectMovements,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$CommandCallersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CommandCallersTable,
    CommandCaller,
    $$CommandCallersTableFilterComposer,
    $$CommandCallersTableOrderingComposer,
    $$CommandCallersTableAnnotationComposer,
    $$CommandCallersTableCreateCompanionBuilder,
    $$CommandCallersTableUpdateCompanionBuilder,
    (CommandCaller, $$CommandCallersTableReferences),
    CommandCaller,
    PrefetchHooks Function(
        {bool parentCommandId,
        bool childCommandId,
        bool onEnterCommandCallers,
        bool onExitCommandCallers,
        bool onTeleportCommandCallers,
        bool onApproachCommandCallers,
        bool onLeaveCommandCallers,
        bool roomObjectCommandCallersRefs,
        bool onMoveCommandCallers})> {
  $$CommandCallersTableTableManager(
      _$AppDatabase db, $CommandCallersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CommandCallersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CommandCallersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CommandCallersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> parentCommandId = const Value.absent(),
            Value<int> childCommandId = const Value.absent(),
            Value<int?> callAfter = const Value.absent(),
          }) =>
              CommandCallersCompanion(
            id: id,
            parentCommandId: parentCommandId,
            childCommandId: childCommandId,
            callAfter: callAfter,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> parentCommandId = const Value.absent(),
            required int childCommandId,
            Value<int?> callAfter = const Value.absent(),
          }) =>
              CommandCallersCompanion.insert(
            id: id,
            parentCommandId: parentCommandId,
            childCommandId: childCommandId,
            callAfter: callAfter,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CommandCallersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {parentCommandId = false,
              childCommandId = false,
              onEnterCommandCallers = false,
              onExitCommandCallers = false,
              onTeleportCommandCallers = false,
              onApproachCommandCallers = false,
              onLeaveCommandCallers = false,
              roomObjectCommandCallersRefs = false,
              onMoveCommandCallers = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (onEnterCommandCallers) db.rooms,
                if (onExitCommandCallers) db.rooms,
                if (onTeleportCommandCallers) db.rooms,
                if (onApproachCommandCallers) db.roomObjects,
                if (onLeaveCommandCallers) db.roomObjects,
                if (roomObjectCommandCallersRefs) db.roomObjectCommandCallers,
                if (onMoveCommandCallers) db.roomObjectMovements
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
                if (parentCommandId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.parentCommandId,
                    referencedTable: $$CommandCallersTableReferences
                        ._parentCommandIdTable(db),
                    referencedColumn: $$CommandCallersTableReferences
                        ._parentCommandIdTable(db)
                        .id,
                  ) as T;
                }
                if (childCommandId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.childCommandId,
                    referencedTable: $$CommandCallersTableReferences
                        ._childCommandIdTable(db),
                    referencedColumn: $$CommandCallersTableReferences
                        ._childCommandIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (onEnterCommandCallers)
                    await $_getPrefetchedData<CommandCaller,
                            $CommandCallersTable, Room>(
                        currentTable: table,
                        referencedTable: $$CommandCallersTableReferences
                            ._onEnterCommandCallersTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CommandCallersTableReferences(db, table, p0)
                                .onEnterCommandCallers,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.onEnterCommandCallerId == item.id),
                        typedResults: items),
                  if (onExitCommandCallers)
                    await $_getPrefetchedData<CommandCaller,
                            $CommandCallersTable, Room>(
                        currentTable: table,
                        referencedTable: $$CommandCallersTableReferences
                            ._onExitCommandCallersTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CommandCallersTableReferences(db, table, p0)
                                .onExitCommandCallers,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.onExitCommandCallerId == item.id),
                        typedResults: items),
                  if (onTeleportCommandCallers)
                    await $_getPrefetchedData<CommandCaller,
                            $CommandCallersTable, Room>(
                        currentTable: table,
                        referencedTable: $$CommandCallersTableReferences
                            ._onTeleportCommandCallersTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CommandCallersTableReferences(db, table, p0)
                                .onTeleportCommandCallers,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.onTeleportCommandCallerId == item.id),
                        typedResults: items),
                  if (onApproachCommandCallers)
                    await $_getPrefetchedData<CommandCaller,
                            $CommandCallersTable, RoomObject>(
                        currentTable: table,
                        referencedTable: $$CommandCallersTableReferences
                            ._onApproachCommandCallersTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CommandCallersTableReferences(db, table, p0)
                                .onApproachCommandCallers,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.onApproachCommandCallerId == item.id),
                        typedResults: items),
                  if (onLeaveCommandCallers)
                    await $_getPrefetchedData<CommandCaller,
                            $CommandCallersTable, RoomObject>(
                        currentTable: table,
                        referencedTable: $$CommandCallersTableReferences
                            ._onLeaveCommandCallersTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CommandCallersTableReferences(db, table, p0)
                                .onLeaveCommandCallers,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.onLeaveCommandCallerId == item.id),
                        typedResults: items),
                  if (roomObjectCommandCallersRefs)
                    await $_getPrefetchedData<CommandCaller,
                            $CommandCallersTable, RoomObjectCommandCaller>(
                        currentTable: table,
                        referencedTable: $$CommandCallersTableReferences
                            ._roomObjectCommandCallersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CommandCallersTableReferences(db, table, p0)
                                .roomObjectCommandCallersRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.commandCallerId == item.id),
                        typedResults: items),
                  if (onMoveCommandCallers)
                    await $_getPrefetchedData<CommandCaller,
                            $CommandCallersTable, RoomObjectMovement>(
                        currentTable: table,
                        referencedTable: $$CommandCallersTableReferences
                            ._onMoveCommandCallersTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CommandCallersTableReferences(db, table, p0)
                                .onMoveCommandCallers,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems.where(
                                (e) => e.onMoveCommandCallerId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CommandCallersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CommandCallersTable,
    CommandCaller,
    $$CommandCallersTableFilterComposer,
    $$CommandCallersTableOrderingComposer,
    $$CommandCallersTableAnnotationComposer,
    $$CommandCallersTableCreateCompanionBuilder,
    $$CommandCallersTableUpdateCompanionBuilder,
    (CommandCaller, $$CommandCallersTableReferences),
    CommandCaller,
    PrefetchHooks Function(
        {bool parentCommandId,
        bool childCommandId,
        bool onEnterCommandCallers,
        bool onExitCommandCallers,
        bool onTeleportCommandCallers,
        bool onApproachCommandCallers,
        bool onLeaveCommandCallers,
        bool roomObjectCommandCallersRefs,
        bool onMoveCommandCallers})>;
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
  Value<int?> onEnterCommandCallerId,
  Value<int?> onExitCommandCallerId,
  Value<int?> onTeleportCommandCallerId,
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
  Value<int?> onEnterCommandCallerId,
  Value<int?> onExitCommandCallerId,
  Value<int?> onTeleportCommandCallerId,
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

  static $CommandCallersTable _onEnterCommandCallerIdTable(_$AppDatabase db) =>
      db.commandCallers.createAlias($_aliasNameGenerator(
          db.rooms.onEnterCommandCallerId, db.commandCallers.id));

  $$CommandCallersTableProcessedTableManager? get onEnterCommandCallerId {
    final $_column = $_itemColumn<int>('on_enter_command_caller_id');
    if ($_column == null) return null;
    final manager = $$CommandCallersTableTableManager($_db, $_db.commandCallers)
        .filter((f) => f.id.sqlEquals($_column));
    final item =
        $_typedResult.readTableOrNull(_onEnterCommandCallerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CommandCallersTable _onExitCommandCallerIdTable(_$AppDatabase db) =>
      db.commandCallers.createAlias($_aliasNameGenerator(
          db.rooms.onExitCommandCallerId, db.commandCallers.id));

  $$CommandCallersTableProcessedTableManager? get onExitCommandCallerId {
    final $_column = $_itemColumn<int>('on_exit_command_caller_id');
    if ($_column == null) return null;
    final manager = $$CommandCallersTableTableManager($_db, $_db.commandCallers)
        .filter((f) => f.id.sqlEquals($_column));
    final item =
        $_typedResult.readTableOrNull(_onExitCommandCallerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CommandCallersTable _onTeleportCommandCallerIdTable(
          _$AppDatabase db) =>
      db.commandCallers.createAlias($_aliasNameGenerator(
          db.rooms.onTeleportCommandCallerId, db.commandCallers.id));

  $$CommandCallersTableProcessedTableManager? get onTeleportCommandCallerId {
    final $_column = $_itemColumn<int>('on_teleport_command_caller_id');
    if ($_column == null) return null;
    final manager = $$CommandCallersTableTableManager($_db, $_db.commandCallers)
        .filter((f) => f.id.sqlEquals($_column));
    final item =
        $_typedResult.readTableOrNull(_onTeleportCommandCallerIdTable($_db));
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

  $$CommandCallersTableFilterComposer get onEnterCommandCallerId {
    final $$CommandCallersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.onEnterCommandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableFilterComposer(
              $db: $db,
              $table: $db.commandCallers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CommandCallersTableFilterComposer get onExitCommandCallerId {
    final $$CommandCallersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.onExitCommandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableFilterComposer(
              $db: $db,
              $table: $db.commandCallers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CommandCallersTableFilterComposer get onTeleportCommandCallerId {
    final $$CommandCallersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.onTeleportCommandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableFilterComposer(
              $db: $db,
              $table: $db.commandCallers,
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

  $$CommandCallersTableOrderingComposer get onEnterCommandCallerId {
    final $$CommandCallersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.onEnterCommandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableOrderingComposer(
              $db: $db,
              $table: $db.commandCallers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CommandCallersTableOrderingComposer get onExitCommandCallerId {
    final $$CommandCallersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.onExitCommandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableOrderingComposer(
              $db: $db,
              $table: $db.commandCallers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CommandCallersTableOrderingComposer get onTeleportCommandCallerId {
    final $$CommandCallersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.onTeleportCommandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableOrderingComposer(
              $db: $db,
              $table: $db.commandCallers,
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

  $$CommandCallersTableAnnotationComposer get onEnterCommandCallerId {
    final $$CommandCallersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.onEnterCommandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableAnnotationComposer(
              $db: $db,
              $table: $db.commandCallers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CommandCallersTableAnnotationComposer get onExitCommandCallerId {
    final $$CommandCallersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.onExitCommandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableAnnotationComposer(
              $db: $db,
              $table: $db.commandCallers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CommandCallersTableAnnotationComposer get onTeleportCommandCallerId {
    final $$CommandCallersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.onTeleportCommandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableAnnotationComposer(
              $db: $db,
              $table: $db.commandCallers,
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
        bool onEnterCommandCallerId,
        bool onExitCommandCallerId,
        bool onTeleportCommandCallerId,
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
            Value<int?> onEnterCommandCallerId = const Value.absent(),
            Value<int?> onExitCommandCallerId = const Value.absent(),
            Value<int?> onTeleportCommandCallerId = const Value.absent(),
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
            onEnterCommandCallerId: onEnterCommandCallerId,
            onExitCommandCallerId: onExitCommandCallerId,
            onTeleportCommandCallerId: onTeleportCommandCallerId,
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
            Value<int?> onEnterCommandCallerId = const Value.absent(),
            Value<int?> onExitCommandCallerId = const Value.absent(),
            Value<int?> onTeleportCommandCallerId = const Value.absent(),
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
            onEnterCommandCallerId: onEnterCommandCallerId,
            onExitCommandCallerId: onExitCommandCallerId,
            onTeleportCommandCallerId: onTeleportCommandCallerId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$RoomsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {ambianceId = false,
              zoneId = false,
              surfaceId = false,
              onEnterCommandCallerId = false,
              onExitCommandCallerId = false,
              onTeleportCommandCallerId = false,
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
                if (onEnterCommandCallerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.onEnterCommandCallerId,
                    referencedTable:
                        $$RoomsTableReferences._onEnterCommandCallerIdTable(db),
                    referencedColumn: $$RoomsTableReferences
                        ._onEnterCommandCallerIdTable(db)
                        .id,
                  ) as T;
                }
                if (onExitCommandCallerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.onExitCommandCallerId,
                    referencedTable:
                        $$RoomsTableReferences._onExitCommandCallerIdTable(db),
                    referencedColumn: $$RoomsTableReferences
                        ._onExitCommandCallerIdTable(db)
                        .id,
                  ) as T;
                }
                if (onTeleportCommandCallerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.onTeleportCommandCallerId,
                    referencedTable: $$RoomsTableReferences
                        ._onTeleportCommandCallerIdTable(db),
                    referencedColumn: $$RoomsTableReferences
                        ._onTeleportCommandCallerIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (roomExitsRefs)
                    await $_getPrefetchedData<Room, $RoomsTable, RoomExit>(
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
                    await $_getPrefetchedData<Room, $RoomsTable, RoomObject>(
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
                    await $_getPrefetchedData<Room, $RoomsTable, PlayerClass>(
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
        bool onEnterCommandCallerId,
        bool onExitCommandCallerId,
        bool onTeleportCommandCallerId,
        bool roomExitsRefs,
        bool roomObjectsRefs,
        bool playerClassesRefs})>;
typedef $$RoomExitsTableCreateCompanionBuilder = RoomExitsCompanion Function({
  Value<int> id,
  required int roomId,
  Value<int> x,
  Value<int> y,
  Value<int?> useSoundId,
  Value<String> label,
  Value<int?> earconId,
});
typedef $$RoomExitsTableUpdateCompanionBuilder = RoomExitsCompanion Function({
  Value<int> id,
  Value<int> roomId,
  Value<int> x,
  Value<int> y,
  Value<int?> useSoundId,
  Value<String> label,
  Value<int?> earconId,
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

  static $SoundReferencesTable _earconIdTable(_$AppDatabase db) =>
      db.soundReferences.createAlias(
          $_aliasNameGenerator(db.roomExits.earconId, db.soundReferences.id));

  $$SoundReferencesTableProcessedTableManager? get earconId {
    final $_column = $_itemColumn<int>('earcon_id');
    if ($_column == null) return null;
    final manager =
        $$SoundReferencesTableTableManager($_db, $_db.soundReferences)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_earconIdTable($_db));
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

  ColumnFilters<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnFilters(column));

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

  $$SoundReferencesTableFilterComposer get earconId {
    final $$SoundReferencesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.earconId,
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

  ColumnOrderings<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnOrderings(column));

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

  $$SoundReferencesTableOrderingComposer get earconId {
    final $$SoundReferencesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.earconId,
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

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

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

  $$SoundReferencesTableAnnotationComposer get earconId {
    final $$SoundReferencesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.earconId,
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
        {bool roomId, bool useSoundId, bool earconId, bool roomObjectsRefs})> {
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
            Value<String> label = const Value.absent(),
            Value<int?> earconId = const Value.absent(),
          }) =>
              RoomExitsCompanion(
            id: id,
            roomId: roomId,
            x: x,
            y: y,
            useSoundId: useSoundId,
            label: label,
            earconId: earconId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int roomId,
            Value<int> x = const Value.absent(),
            Value<int> y = const Value.absent(),
            Value<int?> useSoundId = const Value.absent(),
            Value<String> label = const Value.absent(),
            Value<int?> earconId = const Value.absent(),
          }) =>
              RoomExitsCompanion.insert(
            id: id,
            roomId: roomId,
            x: x,
            y: y,
            useSoundId: useSoundId,
            label: label,
            earconId: earconId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RoomExitsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {roomId = false,
              useSoundId = false,
              earconId = false,
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
                if (earconId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.earconId,
                    referencedTable:
                        $$RoomExitsTableReferences._earconIdTable(db),
                    referencedColumn:
                        $$RoomExitsTableReferences._earconIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (roomObjectsRefs)
                    await $_getPrefetchedData<RoomExit, $RoomExitsTable,
                            RoomObject>(
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
        {bool roomId, bool useSoundId, bool earconId, bool roomObjectsRefs})>;
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
  Value<bool> visible,
  Value<int?> earconId,
  Value<int> approachDistance,
  Value<int?> onApproachCommandCallerId,
  Value<int?> onLeaveCommandCallerId,
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
  Value<bool> visible,
  Value<int?> earconId,
  Value<int> approachDistance,
  Value<int?> onApproachCommandCallerId,
  Value<int?> onLeaveCommandCallerId,
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

  static $SoundReferencesTable _earconIdTable(_$AppDatabase db) =>
      db.soundReferences.createAlias(
          $_aliasNameGenerator(db.roomObjects.earconId, db.soundReferences.id));

  $$SoundReferencesTableProcessedTableManager? get earconId {
    final $_column = $_itemColumn<int>('earcon_id');
    if ($_column == null) return null;
    final manager =
        $$SoundReferencesTableTableManager($_db, $_db.soundReferences)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_earconIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CommandCallersTable _onApproachCommandCallerIdTable(
          _$AppDatabase db) =>
      db.commandCallers.createAlias($_aliasNameGenerator(
          db.roomObjects.onApproachCommandCallerId, db.commandCallers.id));

  $$CommandCallersTableProcessedTableManager? get onApproachCommandCallerId {
    final $_column = $_itemColumn<int>('on_approach_command_caller_id');
    if ($_column == null) return null;
    final manager = $$CommandCallersTableTableManager($_db, $_db.commandCallers)
        .filter((f) => f.id.sqlEquals($_column));
    final item =
        $_typedResult.readTableOrNull(_onApproachCommandCallerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CommandCallersTable _onLeaveCommandCallerIdTable(_$AppDatabase db) =>
      db.commandCallers.createAlias($_aliasNameGenerator(
          db.roomObjects.onLeaveCommandCallerId, db.commandCallers.id));

  $$CommandCallersTableProcessedTableManager? get onLeaveCommandCallerId {
    final $_column = $_itemColumn<int>('on_leave_command_caller_id');
    if ($_column == null) return null;
    final manager = $$CommandCallersTableTableManager($_db, $_db.commandCallers)
        .filter((f) => f.id.sqlEquals($_column));
    final item =
        $_typedResult.readTableOrNull(_onLeaveCommandCallerIdTable($_db));
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

  static MultiTypedResultKey<$RoomObjectCommandCallersTable,
      List<RoomObjectCommandCaller>> _roomObjectCommandCallersRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.roomObjectCommandCallers,
          aliasName: $_aliasNameGenerator(
              db.roomObjects.id, db.roomObjectCommandCallers.roomObjectId));

  $$RoomObjectCommandCallersTableProcessedTableManager
      get roomObjectCommandCallersRefs {
    final manager = $$RoomObjectCommandCallersTableTableManager(
            $_db, $_db.roomObjectCommandCallers)
        .filter((f) => f.roomObjectId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_roomObjectCommandCallersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RoomObjectMovementsTable,
      List<RoomObjectMovement>> _roomObjectMovementsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.roomObjectMovements,
          aliasName: $_aliasNameGenerator(
              db.roomObjects.id, db.roomObjectMovements.roomObjectId));

  $$RoomObjectMovementsTableProcessedTableManager get roomObjectMovementsRefs {
    final manager = $$RoomObjectMovementsTableTableManager(
            $_db, $_db.roomObjectMovements)
        .filter((f) => f.roomObjectId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_roomObjectMovementsRefsTable($_db));
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

  ColumnFilters<bool> get visible => $composableBuilder(
      column: $table.visible, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get approachDistance => $composableBuilder(
      column: $table.approachDistance,
      builder: (column) => ColumnFilters(column));

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

  $$SoundReferencesTableFilterComposer get earconId {
    final $$SoundReferencesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.earconId,
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

  $$CommandCallersTableFilterComposer get onApproachCommandCallerId {
    final $$CommandCallersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.onApproachCommandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableFilterComposer(
              $db: $db,
              $table: $db.commandCallers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CommandCallersTableFilterComposer get onLeaveCommandCallerId {
    final $$CommandCallersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.onLeaveCommandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableFilterComposer(
              $db: $db,
              $table: $db.commandCallers,
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

  Expression<bool> roomObjectCommandCallersRefs(
      Expression<bool> Function($$RoomObjectCommandCallersTableFilterComposer f)
          f) {
    final $$RoomObjectCommandCallersTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.roomObjectCommandCallers,
            getReferencedColumn: (t) => t.roomObjectId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RoomObjectCommandCallersTableFilterComposer(
                  $db: $db,
                  $table: $db.roomObjectCommandCallers,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> roomObjectMovementsRefs(
      Expression<bool> Function($$RoomObjectMovementsTableFilterComposer f) f) {
    final $$RoomObjectMovementsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.roomObjectMovements,
        getReferencedColumn: (t) => t.roomObjectId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RoomObjectMovementsTableFilterComposer(
              $db: $db,
              $table: $db.roomObjectMovements,
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

  ColumnOrderings<bool> get visible => $composableBuilder(
      column: $table.visible, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get approachDistance => $composableBuilder(
      column: $table.approachDistance,
      builder: (column) => ColumnOrderings(column));

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

  $$SoundReferencesTableOrderingComposer get earconId {
    final $$SoundReferencesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.earconId,
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

  $$CommandCallersTableOrderingComposer get onApproachCommandCallerId {
    final $$CommandCallersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.onApproachCommandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableOrderingComposer(
              $db: $db,
              $table: $db.commandCallers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CommandCallersTableOrderingComposer get onLeaveCommandCallerId {
    final $$CommandCallersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.onLeaveCommandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableOrderingComposer(
              $db: $db,
              $table: $db.commandCallers,
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

  GeneratedColumn<bool> get visible =>
      $composableBuilder(column: $table.visible, builder: (column) => column);

  GeneratedColumn<int> get approachDistance => $composableBuilder(
      column: $table.approachDistance, builder: (column) => column);

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

  $$SoundReferencesTableAnnotationComposer get earconId {
    final $$SoundReferencesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.earconId,
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

  $$CommandCallersTableAnnotationComposer get onApproachCommandCallerId {
    final $$CommandCallersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.onApproachCommandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableAnnotationComposer(
              $db: $db,
              $table: $db.commandCallers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CommandCallersTableAnnotationComposer get onLeaveCommandCallerId {
    final $$CommandCallersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.onLeaveCommandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableAnnotationComposer(
              $db: $db,
              $table: $db.commandCallers,
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

  Expression<T> roomObjectCommandCallersRefs<T extends Object>(
      Expression<T> Function(
              $$RoomObjectCommandCallersTableAnnotationComposer a)
          f) {
    final $$RoomObjectCommandCallersTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.roomObjectCommandCallers,
            getReferencedColumn: (t) => t.roomObjectId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RoomObjectCommandCallersTableAnnotationComposer(
                  $db: $db,
                  $table: $db.roomObjectCommandCallers,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> roomObjectMovementsRefs<T extends Object>(
      Expression<T> Function($$RoomObjectMovementsTableAnnotationComposer a)
          f) {
    final $$RoomObjectMovementsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.roomObjectMovements,
            getReferencedColumn: (t) => t.roomObjectId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RoomObjectMovementsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.roomObjectMovements,
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
        bool earconId,
        bool onApproachCommandCallerId,
        bool onLeaveCommandCallerId,
        bool roomObjectRandomSoundsRefs,
        bool roomObjectCommandCallersRefs,
        bool roomObjectMovementsRefs})> {
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
            Value<bool> visible = const Value.absent(),
            Value<int?> earconId = const Value.absent(),
            Value<int> approachDistance = const Value.absent(),
            Value<int?> onApproachCommandCallerId = const Value.absent(),
            Value<int?> onLeaveCommandCallerId = const Value.absent(),
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
            visible: visible,
            earconId: earconId,
            approachDistance: approachDistance,
            onApproachCommandCallerId: onApproachCommandCallerId,
            onLeaveCommandCallerId: onLeaveCommandCallerId,
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
            Value<bool> visible = const Value.absent(),
            Value<int?> earconId = const Value.absent(),
            Value<int> approachDistance = const Value.absent(),
            Value<int?> onApproachCommandCallerId = const Value.absent(),
            Value<int?> onLeaveCommandCallerId = const Value.absent(),
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
            visible: visible,
            earconId: earconId,
            approachDistance: approachDistance,
            onApproachCommandCallerId: onApproachCommandCallerId,
            onLeaveCommandCallerId: onLeaveCommandCallerId,
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
              earconId = false,
              onApproachCommandCallerId = false,
              onLeaveCommandCallerId = false,
              roomObjectRandomSoundsRefs = false,
              roomObjectCommandCallersRefs = false,
              roomObjectMovementsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (roomObjectRandomSoundsRefs) db.roomObjectRandomSounds,
                if (roomObjectCommandCallersRefs) db.roomObjectCommandCallers,
                if (roomObjectMovementsRefs) db.roomObjectMovements
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
                if (earconId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.earconId,
                    referencedTable:
                        $$RoomObjectsTableReferences._earconIdTable(db),
                    referencedColumn:
                        $$RoomObjectsTableReferences._earconIdTable(db).id,
                  ) as T;
                }
                if (onApproachCommandCallerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.onApproachCommandCallerId,
                    referencedTable: $$RoomObjectsTableReferences
                        ._onApproachCommandCallerIdTable(db),
                    referencedColumn: $$RoomObjectsTableReferences
                        ._onApproachCommandCallerIdTable(db)
                        .id,
                  ) as T;
                }
                if (onLeaveCommandCallerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.onLeaveCommandCallerId,
                    referencedTable: $$RoomObjectsTableReferences
                        ._onLeaveCommandCallerIdTable(db),
                    referencedColumn: $$RoomObjectsTableReferences
                        ._onLeaveCommandCallerIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (roomObjectRandomSoundsRefs)
                    await $_getPrefetchedData<RoomObject, $RoomObjectsTable,
                            RoomObjectRandomSound>(
                        currentTable: table,
                        referencedTable: $$RoomObjectsTableReferences
                            ._roomObjectRandomSoundsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoomObjectsTableReferences(db, table, p0)
                                .roomObjectRandomSoundsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.roomObjectId == item.id),
                        typedResults: items),
                  if (roomObjectCommandCallersRefs)
                    await $_getPrefetchedData<RoomObject, $RoomObjectsTable,
                            RoomObjectCommandCaller>(
                        currentTable: table,
                        referencedTable: $$RoomObjectsTableReferences
                            ._roomObjectCommandCallersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoomObjectsTableReferences(db, table, p0)
                                .roomObjectCommandCallersRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.roomObjectId == item.id),
                        typedResults: items),
                  if (roomObjectMovementsRefs)
                    await $_getPrefetchedData<RoomObject, $RoomObjectsTable, RoomObjectMovement>(
                        currentTable: table,
                        referencedTable: $$RoomObjectsTableReferences
                            ._roomObjectMovementsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RoomObjectsTableReferences(db, table, p0)
                                .roomObjectMovementsRefs,
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
        bool earconId,
        bool onApproachCommandCallerId,
        bool onLeaveCommandCallerId,
        bool roomObjectRandomSoundsRefs,
        bool roomObjectCommandCallersRefs,
        bool roomObjectMovementsRefs})>;
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
                    await $_getPrefetchedData<PlayerClass, $PlayerClassesTable,
                            PlayerClassGameStat>(
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

  static MultiTypedResultKey<$CommandGameStatsTable, List<CommandGameStat>>
      _commandGameStatsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.commandGameStats,
              aliasName: $_aliasNameGenerator(
                  db.gameStats.id, db.commandGameStats.gameStatId));

  $$CommandGameStatsTableProcessedTableManager get commandGameStatsRefs {
    final manager =
        $$CommandGameStatsTableTableManager($_db, $_db.commandGameStats)
            .filter((f) => f.gameStatId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_commandGameStatsRefsTable($_db));
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

  Expression<bool> commandGameStatsRefs(
      Expression<bool> Function($$CommandGameStatsTableFilterComposer f) f) {
    final $$CommandGameStatsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.commandGameStats,
        getReferencedColumn: (t) => t.gameStatId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandGameStatsTableFilterComposer(
              $db: $db,
              $table: $db.commandGameStats,
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

  Expression<T> commandGameStatsRefs<T extends Object>(
      Expression<T> Function($$CommandGameStatsTableAnnotationComposer a) f) {
    final $$CommandGameStatsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.commandGameStats,
        getReferencedColumn: (t) => t.gameStatId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandGameStatsTableAnnotationComposer(
              $db: $db,
              $table: $db.commandGameStats,
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
        bool playerClassGameStatsRefs,
        bool commandGameStatsRefs})> {
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
              playerClassGameStatsRefs = false,
              commandGameStatsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (roomSurfaceBoostsRefs) db.roomSurfaceBoosts,
                if (roomSurfaceCostsRefs) db.roomSurfaceCosts,
                if (playerClassGameStatsRefs) db.playerClassGameStats,
                if (commandGameStatsRefs) db.commandGameStats
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
                    await $_getPrefetchedData<GameStat, $GameStatsTable,
                            RoomSurfaceBoost>(
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
                    await $_getPrefetchedData<GameStat, $GameStatsTable,
                            RoomSurfaceCost>(
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
                    await $_getPrefetchedData<GameStat, $GameStatsTable,
                            PlayerClassGameStat>(
                        currentTable: table,
                        referencedTable: $$GameStatsTableReferences
                            ._playerClassGameStatsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GameStatsTableReferences(db, table, p0)
                                .playerClassGameStatsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.gameStatId == item.id),
                        typedResults: items),
                  if (commandGameStatsRefs)
                    await $_getPrefetchedData<GameStat, $GameStatsTable,
                            CommandGameStat>(
                        currentTable: table,
                        referencedTable: $$GameStatsTableReferences
                            ._commandGameStatsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GameStatsTableReferences(db, table, p0)
                                .commandGameStatsRefs,
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
        bool playerClassGameStatsRefs,
        bool commandGameStatsRefs})>;
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
typedef $$RoomObjectCommandCallersTableCreateCompanionBuilder
    = RoomObjectCommandCallersCompanion Function({
  Value<int> id,
  required String name,
  required int roomObjectId,
  required int commandCallerId,
  Value<int?> earconId,
});
typedef $$RoomObjectCommandCallersTableUpdateCompanionBuilder
    = RoomObjectCommandCallersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> roomObjectId,
  Value<int> commandCallerId,
  Value<int?> earconId,
});

final class $$RoomObjectCommandCallersTableReferences extends BaseReferences<
    _$AppDatabase, $RoomObjectCommandCallersTable, RoomObjectCommandCaller> {
  $$RoomObjectCommandCallersTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $RoomObjectsTable _roomObjectIdTable(_$AppDatabase db) =>
      db.roomObjects.createAlias($_aliasNameGenerator(
          db.roomObjectCommandCallers.roomObjectId, db.roomObjects.id));

  $$RoomObjectsTableProcessedTableManager get roomObjectId {
    final $_column = $_itemColumn<int>('room_object_id')!;

    final manager = $$RoomObjectsTableTableManager($_db, $_db.roomObjects)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roomObjectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CommandCallersTable _commandCallerIdTable(_$AppDatabase db) =>
      db.commandCallers.createAlias($_aliasNameGenerator(
          db.roomObjectCommandCallers.commandCallerId, db.commandCallers.id));

  $$CommandCallersTableProcessedTableManager get commandCallerId {
    final $_column = $_itemColumn<int>('command_caller_id')!;

    final manager = $$CommandCallersTableTableManager($_db, $_db.commandCallers)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_commandCallerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SoundReferencesTable _earconIdTable(_$AppDatabase db) =>
      db.soundReferences.createAlias($_aliasNameGenerator(
          db.roomObjectCommandCallers.earconId, db.soundReferences.id));

  $$SoundReferencesTableProcessedTableManager? get earconId {
    final $_column = $_itemColumn<int>('earcon_id');
    if ($_column == null) return null;
    final manager =
        $$SoundReferencesTableTableManager($_db, $_db.soundReferences)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_earconIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RoomObjectCommandCallersTableFilterComposer
    extends Composer<_$AppDatabase, $RoomObjectCommandCallersTable> {
  $$RoomObjectCommandCallersTableFilterComposer({
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

  $$CommandCallersTableFilterComposer get commandCallerId {
    final $$CommandCallersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.commandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableFilterComposer(
              $db: $db,
              $table: $db.commandCallers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SoundReferencesTableFilterComposer get earconId {
    final $$SoundReferencesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.earconId,
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

class $$RoomObjectCommandCallersTableOrderingComposer
    extends Composer<_$AppDatabase, $RoomObjectCommandCallersTable> {
  $$RoomObjectCommandCallersTableOrderingComposer({
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

  $$CommandCallersTableOrderingComposer get commandCallerId {
    final $$CommandCallersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.commandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableOrderingComposer(
              $db: $db,
              $table: $db.commandCallers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SoundReferencesTableOrderingComposer get earconId {
    final $$SoundReferencesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.earconId,
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

class $$RoomObjectCommandCallersTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoomObjectCommandCallersTable> {
  $$RoomObjectCommandCallersTableAnnotationComposer({
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

  $$CommandCallersTableAnnotationComposer get commandCallerId {
    final $$CommandCallersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.commandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableAnnotationComposer(
              $db: $db,
              $table: $db.commandCallers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SoundReferencesTableAnnotationComposer get earconId {
    final $$SoundReferencesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.earconId,
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

class $$RoomObjectCommandCallersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoomObjectCommandCallersTable,
    RoomObjectCommandCaller,
    $$RoomObjectCommandCallersTableFilterComposer,
    $$RoomObjectCommandCallersTableOrderingComposer,
    $$RoomObjectCommandCallersTableAnnotationComposer,
    $$RoomObjectCommandCallersTableCreateCompanionBuilder,
    $$RoomObjectCommandCallersTableUpdateCompanionBuilder,
    (RoomObjectCommandCaller, $$RoomObjectCommandCallersTableReferences),
    RoomObjectCommandCaller,
    PrefetchHooks Function(
        {bool roomObjectId, bool commandCallerId, bool earconId})> {
  $$RoomObjectCommandCallersTableTableManager(
      _$AppDatabase db, $RoomObjectCommandCallersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomObjectCommandCallersTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomObjectCommandCallersTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomObjectCommandCallersTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> roomObjectId = const Value.absent(),
            Value<int> commandCallerId = const Value.absent(),
            Value<int?> earconId = const Value.absent(),
          }) =>
              RoomObjectCommandCallersCompanion(
            id: id,
            name: name,
            roomObjectId: roomObjectId,
            commandCallerId: commandCallerId,
            earconId: earconId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int roomObjectId,
            required int commandCallerId,
            Value<int?> earconId = const Value.absent(),
          }) =>
              RoomObjectCommandCallersCompanion.insert(
            id: id,
            name: name,
            roomObjectId: roomObjectId,
            commandCallerId: commandCallerId,
            earconId: earconId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RoomObjectCommandCallersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {roomObjectId = false,
              commandCallerId = false,
              earconId = false}) {
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
                    referencedTable: $$RoomObjectCommandCallersTableReferences
                        ._roomObjectIdTable(db),
                    referencedColumn: $$RoomObjectCommandCallersTableReferences
                        ._roomObjectIdTable(db)
                        .id,
                  ) as T;
                }
                if (commandCallerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.commandCallerId,
                    referencedTable: $$RoomObjectCommandCallersTableReferences
                        ._commandCallerIdTable(db),
                    referencedColumn: $$RoomObjectCommandCallersTableReferences
                        ._commandCallerIdTable(db)
                        .id,
                  ) as T;
                }
                if (earconId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.earconId,
                    referencedTable: $$RoomObjectCommandCallersTableReferences
                        ._earconIdTable(db),
                    referencedColumn: $$RoomObjectCommandCallersTableReferences
                        ._earconIdTable(db)
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

typedef $$RoomObjectCommandCallersTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $RoomObjectCommandCallersTable,
        RoomObjectCommandCaller,
        $$RoomObjectCommandCallersTableFilterComposer,
        $$RoomObjectCommandCallersTableOrderingComposer,
        $$RoomObjectCommandCallersTableAnnotationComposer,
        $$RoomObjectCommandCallersTableCreateCompanionBuilder,
        $$RoomObjectCommandCallersTableUpdateCompanionBuilder,
        (RoomObjectCommandCaller, $$RoomObjectCommandCallersTableReferences),
        RoomObjectCommandCaller,
        PrefetchHooks Function(
            {bool roomObjectId, bool commandCallerId, bool earconId})>;
typedef $$RoomObjectMovementsTableCreateCompanionBuilder
    = RoomObjectMovementsCompanion Function({
  Value<int> id,
  required int roomObjectId,
  Value<int> minDelay,
  Value<int> maxDelay,
  Value<MovingDirection> direction,
  Value<int> distance,
  Value<int?> onMoveCommandCallerId,
});
typedef $$RoomObjectMovementsTableUpdateCompanionBuilder
    = RoomObjectMovementsCompanion Function({
  Value<int> id,
  Value<int> roomObjectId,
  Value<int> minDelay,
  Value<int> maxDelay,
  Value<MovingDirection> direction,
  Value<int> distance,
  Value<int?> onMoveCommandCallerId,
});

final class $$RoomObjectMovementsTableReferences extends BaseReferences<
    _$AppDatabase, $RoomObjectMovementsTable, RoomObjectMovement> {
  $$RoomObjectMovementsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $RoomObjectsTable _roomObjectIdTable(_$AppDatabase db) =>
      db.roomObjects.createAlias($_aliasNameGenerator(
          db.roomObjectMovements.roomObjectId, db.roomObjects.id));

  $$RoomObjectsTableProcessedTableManager get roomObjectId {
    final $_column = $_itemColumn<int>('room_object_id')!;

    final manager = $$RoomObjectsTableTableManager($_db, $_db.roomObjects)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roomObjectIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CommandCallersTable _onMoveCommandCallerIdTable(_$AppDatabase db) =>
      db.commandCallers.createAlias($_aliasNameGenerator(
          db.roomObjectMovements.onMoveCommandCallerId, db.commandCallers.id));

  $$CommandCallersTableProcessedTableManager? get onMoveCommandCallerId {
    final $_column = $_itemColumn<int>('on_move_command_caller_id');
    if ($_column == null) return null;
    final manager = $$CommandCallersTableTableManager($_db, $_db.commandCallers)
        .filter((f) => f.id.sqlEquals($_column));
    final item =
        $_typedResult.readTableOrNull(_onMoveCommandCallerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RoomObjectMovementsTableFilterComposer
    extends Composer<_$AppDatabase, $RoomObjectMovementsTable> {
  $$RoomObjectMovementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minDelay => $composableBuilder(
      column: $table.minDelay, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxDelay => $composableBuilder(
      column: $table.maxDelay, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<MovingDirection, MovingDirection, int>
      get direction => $composableBuilder(
          column: $table.direction,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get distance => $composableBuilder(
      column: $table.distance, builder: (column) => ColumnFilters(column));

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

  $$CommandCallersTableFilterComposer get onMoveCommandCallerId {
    final $$CommandCallersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.onMoveCommandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableFilterComposer(
              $db: $db,
              $table: $db.commandCallers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RoomObjectMovementsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoomObjectMovementsTable> {
  $$RoomObjectMovementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minDelay => $composableBuilder(
      column: $table.minDelay, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxDelay => $composableBuilder(
      column: $table.maxDelay, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get direction => $composableBuilder(
      column: $table.direction, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get distance => $composableBuilder(
      column: $table.distance, builder: (column) => ColumnOrderings(column));

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

  $$CommandCallersTableOrderingComposer get onMoveCommandCallerId {
    final $$CommandCallersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.onMoveCommandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableOrderingComposer(
              $db: $db,
              $table: $db.commandCallers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RoomObjectMovementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoomObjectMovementsTable> {
  $$RoomObjectMovementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get minDelay =>
      $composableBuilder(column: $table.minDelay, builder: (column) => column);

  GeneratedColumn<int> get maxDelay =>
      $composableBuilder(column: $table.maxDelay, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MovingDirection, int> get direction =>
      $composableBuilder(column: $table.direction, builder: (column) => column);

  GeneratedColumn<int> get distance =>
      $composableBuilder(column: $table.distance, builder: (column) => column);

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

  $$CommandCallersTableAnnotationComposer get onMoveCommandCallerId {
    final $$CommandCallersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.onMoveCommandCallerId,
        referencedTable: $db.commandCallers,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandCallersTableAnnotationComposer(
              $db: $db,
              $table: $db.commandCallers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RoomObjectMovementsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RoomObjectMovementsTable,
    RoomObjectMovement,
    $$RoomObjectMovementsTableFilterComposer,
    $$RoomObjectMovementsTableOrderingComposer,
    $$RoomObjectMovementsTableAnnotationComposer,
    $$RoomObjectMovementsTableCreateCompanionBuilder,
    $$RoomObjectMovementsTableUpdateCompanionBuilder,
    (RoomObjectMovement, $$RoomObjectMovementsTableReferences),
    RoomObjectMovement,
    PrefetchHooks Function({bool roomObjectId, bool onMoveCommandCallerId})> {
  $$RoomObjectMovementsTableTableManager(
      _$AppDatabase db, $RoomObjectMovementsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoomObjectMovementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoomObjectMovementsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoomObjectMovementsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> roomObjectId = const Value.absent(),
            Value<int> minDelay = const Value.absent(),
            Value<int> maxDelay = const Value.absent(),
            Value<MovingDirection> direction = const Value.absent(),
            Value<int> distance = const Value.absent(),
            Value<int?> onMoveCommandCallerId = const Value.absent(),
          }) =>
              RoomObjectMovementsCompanion(
            id: id,
            roomObjectId: roomObjectId,
            minDelay: minDelay,
            maxDelay: maxDelay,
            direction: direction,
            distance: distance,
            onMoveCommandCallerId: onMoveCommandCallerId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int roomObjectId,
            Value<int> minDelay = const Value.absent(),
            Value<int> maxDelay = const Value.absent(),
            Value<MovingDirection> direction = const Value.absent(),
            Value<int> distance = const Value.absent(),
            Value<int?> onMoveCommandCallerId = const Value.absent(),
          }) =>
              RoomObjectMovementsCompanion.insert(
            id: id,
            roomObjectId: roomObjectId,
            minDelay: minDelay,
            maxDelay: maxDelay,
            direction: direction,
            distance: distance,
            onMoveCommandCallerId: onMoveCommandCallerId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RoomObjectMovementsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {roomObjectId = false, onMoveCommandCallerId = false}) {
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
                    referencedTable: $$RoomObjectMovementsTableReferences
                        ._roomObjectIdTable(db),
                    referencedColumn: $$RoomObjectMovementsTableReferences
                        ._roomObjectIdTable(db)
                        .id,
                  ) as T;
                }
                if (onMoveCommandCallerId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.onMoveCommandCallerId,
                    referencedTable: $$RoomObjectMovementsTableReferences
                        ._onMoveCommandCallerIdTable(db),
                    referencedColumn: $$RoomObjectMovementsTableReferences
                        ._onMoveCommandCallerIdTable(db)
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

typedef $$RoomObjectMovementsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RoomObjectMovementsTable,
    RoomObjectMovement,
    $$RoomObjectMovementsTableFilterComposer,
    $$RoomObjectMovementsTableOrderingComposer,
    $$RoomObjectMovementsTableAnnotationComposer,
    $$RoomObjectMovementsTableCreateCompanionBuilder,
    $$RoomObjectMovementsTableUpdateCompanionBuilder,
    (RoomObjectMovement, $$RoomObjectMovementsTableReferences),
    RoomObjectMovement,
    PrefetchHooks Function({bool roomObjectId, bool onMoveCommandCallerId})>;
typedef $$CommandGameStatsTableCreateCompanionBuilder
    = CommandGameStatsCompanion Function({
  Value<int> id,
  required int gameStatId,
  required int commandId,
  Value<MathematicalOperator> mathematicalOperator,
  Value<int> amount,
});
typedef $$CommandGameStatsTableUpdateCompanionBuilder
    = CommandGameStatsCompanion Function({
  Value<int> id,
  Value<int> gameStatId,
  Value<int> commandId,
  Value<MathematicalOperator> mathematicalOperator,
  Value<int> amount,
});

final class $$CommandGameStatsTableReferences extends BaseReferences<
    _$AppDatabase, $CommandGameStatsTable, CommandGameStat> {
  $$CommandGameStatsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $GameStatsTable _gameStatIdTable(_$AppDatabase db) =>
      db.gameStats.createAlias($_aliasNameGenerator(
          db.commandGameStats.gameStatId, db.gameStats.id));

  $$GameStatsTableProcessedTableManager get gameStatId {
    final $_column = $_itemColumn<int>('game_stat_id')!;

    final manager = $$GameStatsTableTableManager($_db, $_db.gameStats)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_gameStatIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CommandsTable _commandIdTable(_$AppDatabase db) =>
      db.commands.createAlias(
          $_aliasNameGenerator(db.commandGameStats.commandId, db.commands.id));

  $$CommandsTableProcessedTableManager get commandId {
    final $_column = $_itemColumn<int>('command_id')!;

    final manager = $$CommandsTableTableManager($_db, $_db.commands)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_commandIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$CommandGameStatsTableFilterComposer
    extends Composer<_$AppDatabase, $CommandGameStatsTable> {
  $$CommandGameStatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<MathematicalOperator, MathematicalOperator,
          int>
      get mathematicalOperator => $composableBuilder(
          column: $table.mathematicalOperator,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

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

  $$CommandsTableFilterComposer get commandId {
    final $$CommandsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.commandId,
        referencedTable: $db.commands,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandsTableFilterComposer(
              $db: $db,
              $table: $db.commands,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CommandGameStatsTableOrderingComposer
    extends Composer<_$AppDatabase, $CommandGameStatsTable> {
  $$CommandGameStatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get mathematicalOperator => $composableBuilder(
      column: $table.mathematicalOperator,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

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

  $$CommandsTableOrderingComposer get commandId {
    final $$CommandsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.commandId,
        referencedTable: $db.commands,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandsTableOrderingComposer(
              $db: $db,
              $table: $db.commands,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CommandGameStatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CommandGameStatsTable> {
  $$CommandGameStatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<MathematicalOperator, int>
      get mathematicalOperator => $composableBuilder(
          column: $table.mathematicalOperator, builder: (column) => column);

  GeneratedColumn<int> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

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

  $$CommandsTableAnnotationComposer get commandId {
    final $$CommandsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.commandId,
        referencedTable: $db.commands,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CommandsTableAnnotationComposer(
              $db: $db,
              $table: $db.commands,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CommandGameStatsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CommandGameStatsTable,
    CommandGameStat,
    $$CommandGameStatsTableFilterComposer,
    $$CommandGameStatsTableOrderingComposer,
    $$CommandGameStatsTableAnnotationComposer,
    $$CommandGameStatsTableCreateCompanionBuilder,
    $$CommandGameStatsTableUpdateCompanionBuilder,
    (CommandGameStat, $$CommandGameStatsTableReferences),
    CommandGameStat,
    PrefetchHooks Function({bool gameStatId, bool commandId})> {
  $$CommandGameStatsTableTableManager(
      _$AppDatabase db, $CommandGameStatsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CommandGameStatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CommandGameStatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CommandGameStatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> gameStatId = const Value.absent(),
            Value<int> commandId = const Value.absent(),
            Value<MathematicalOperator> mathematicalOperator =
                const Value.absent(),
            Value<int> amount = const Value.absent(),
          }) =>
              CommandGameStatsCompanion(
            id: id,
            gameStatId: gameStatId,
            commandId: commandId,
            mathematicalOperator: mathematicalOperator,
            amount: amount,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int gameStatId,
            required int commandId,
            Value<MathematicalOperator> mathematicalOperator =
                const Value.absent(),
            Value<int> amount = const Value.absent(),
          }) =>
              CommandGameStatsCompanion.insert(
            id: id,
            gameStatId: gameStatId,
            commandId: commandId,
            mathematicalOperator: mathematicalOperator,
            amount: amount,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CommandGameStatsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({gameStatId = false, commandId = false}) {
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
                if (gameStatId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.gameStatId,
                    referencedTable:
                        $$CommandGameStatsTableReferences._gameStatIdTable(db),
                    referencedColumn: $$CommandGameStatsTableReferences
                        ._gameStatIdTable(db)
                        .id,
                  ) as T;
                }
                if (commandId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.commandId,
                    referencedTable:
                        $$CommandGameStatsTableReferences._commandIdTable(db),
                    referencedColumn: $$CommandGameStatsTableReferences
                        ._commandIdTable(db)
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

typedef $$CommandGameStatsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CommandGameStatsTable,
    CommandGameStat,
    $$CommandGameStatsTableFilterComposer,
    $$CommandGameStatsTableOrderingComposer,
    $$CommandGameStatsTableAnnotationComposer,
    $$CommandGameStatsTableCreateCompanionBuilder,
    $$CommandGameStatsTableUpdateCompanionBuilder,
    (CommandGameStat, $$CommandGameStatsTableReferences),
    CommandGameStat,
    PrefetchHooks Function({bool gameStatId, bool commandId})>;
typedef $$QuestsTableCreateCompanionBuilder = QuestsCompanion Function({
  Value<int> id,
  required String name,
  required String description,
});
typedef $$QuestsTableUpdateCompanionBuilder = QuestsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> description,
});

final class $$QuestsTableReferences
    extends BaseReferences<_$AppDatabase, $QuestsTable, Quest> {
  $$QuestsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$QuestStagesTable, List<QuestStage>>
      _questStagesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.questStages,
              aliasName:
                  $_aliasNameGenerator(db.quests.id, db.questStages.questId));

  $$QuestStagesTableProcessedTableManager get questStagesRefs {
    final manager = $$QuestStagesTableTableManager($_db, $_db.questStages)
        .filter((f) => f.questId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_questStagesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$QuestsTableFilterComposer
    extends Composer<_$AppDatabase, $QuestsTable> {
  $$QuestsTableFilterComposer({
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

  Expression<bool> questStagesRefs(
      Expression<bool> Function($$QuestStagesTableFilterComposer f) f) {
    final $$QuestStagesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.questStages,
        getReferencedColumn: (t) => t.questId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestStagesTableFilterComposer(
              $db: $db,
              $table: $db.questStages,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$QuestsTableOrderingComposer
    extends Composer<_$AppDatabase, $QuestsTable> {
  $$QuestsTableOrderingComposer({
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
}

class $$QuestsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuestsTable> {
  $$QuestsTableAnnotationComposer({
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

  Expression<T> questStagesRefs<T extends Object>(
      Expression<T> Function($$QuestStagesTableAnnotationComposer a) f) {
    final $$QuestStagesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.questStages,
        getReferencedColumn: (t) => t.questId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestStagesTableAnnotationComposer(
              $db: $db,
              $table: $db.questStages,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$QuestsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $QuestsTable,
    Quest,
    $$QuestsTableFilterComposer,
    $$QuestsTableOrderingComposer,
    $$QuestsTableAnnotationComposer,
    $$QuestsTableCreateCompanionBuilder,
    $$QuestsTableUpdateCompanionBuilder,
    (Quest, $$QuestsTableReferences),
    Quest,
    PrefetchHooks Function({bool questStagesRefs})> {
  $$QuestsTableTableManager(_$AppDatabase db, $QuestsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
          }) =>
              QuestsCompanion(
            id: id,
            name: name,
            description: description,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String description,
          }) =>
              QuestsCompanion.insert(
            id: id,
            name: name,
            description: description,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$QuestsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({questStagesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (questStagesRefs) db.questStages],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (questStagesRefs)
                    await $_getPrefetchedData<Quest, $QuestsTable, QuestStage>(
                        currentTable: table,
                        referencedTable:
                            $$QuestsTableReferences._questStagesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$QuestsTableReferences(db, table, p0)
                                .questStagesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.questId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$QuestsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $QuestsTable,
    Quest,
    $$QuestsTableFilterComposer,
    $$QuestsTableOrderingComposer,
    $$QuestsTableAnnotationComposer,
    $$QuestsTableCreateCompanionBuilder,
    $$QuestsTableUpdateCompanionBuilder,
    (Quest, $$QuestsTableReferences),
    Quest,
    PrefetchHooks Function({bool questStagesRefs})>;
typedef $$QuestStagesTableCreateCompanionBuilder = QuestStagesCompanion
    Function({
  Value<int> id,
  required int questId,
  required String label,
  Value<int?> labelSoundId,
});
typedef $$QuestStagesTableUpdateCompanionBuilder = QuestStagesCompanion
    Function({
  Value<int> id,
  Value<int> questId,
  Value<String> label,
  Value<int?> labelSoundId,
});

final class $$QuestStagesTableReferences
    extends BaseReferences<_$AppDatabase, $QuestStagesTable, QuestStage> {
  $$QuestStagesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $QuestsTable _questIdTable(_$AppDatabase db) => db.quests
      .createAlias($_aliasNameGenerator(db.questStages.questId, db.quests.id));

  $$QuestsTableProcessedTableManager get questId {
    final $_column = $_itemColumn<int>('quest_id')!;

    final manager = $$QuestsTableTableManager($_db, $_db.quests)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_questIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SoundReferencesTable _labelSoundIdTable(_$AppDatabase db) =>
      db.soundReferences.createAlias($_aliasNameGenerator(
          db.questStages.labelSoundId, db.soundReferences.id));

  $$SoundReferencesTableProcessedTableManager? get labelSoundId {
    final $_column = $_itemColumn<int>('label_sound_id');
    if ($_column == null) return null;
    final manager =
        $$SoundReferencesTableTableManager($_db, $_db.soundReferences)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_labelSoundIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$QuestStagesTableFilterComposer
    extends Composer<_$AppDatabase, $QuestStagesTable> {
  $$QuestStagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnFilters(column));

  $$QuestsTableFilterComposer get questId {
    final $$QuestsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questId,
        referencedTable: $db.quests,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestsTableFilterComposer(
              $db: $db,
              $table: $db.quests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SoundReferencesTableFilterComposer get labelSoundId {
    final $$SoundReferencesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.labelSoundId,
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

class $$QuestStagesTableOrderingComposer
    extends Composer<_$AppDatabase, $QuestStagesTable> {
  $$QuestStagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnOrderings(column));

  $$QuestsTableOrderingComposer get questId {
    final $$QuestsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questId,
        referencedTable: $db.quests,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestsTableOrderingComposer(
              $db: $db,
              $table: $db.quests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SoundReferencesTableOrderingComposer get labelSoundId {
    final $$SoundReferencesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.labelSoundId,
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

class $$QuestStagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuestStagesTable> {
  $$QuestStagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  $$QuestsTableAnnotationComposer get questId {
    final $$QuestsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.questId,
        referencedTable: $db.quests,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$QuestsTableAnnotationComposer(
              $db: $db,
              $table: $db.quests,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SoundReferencesTableAnnotationComposer get labelSoundId {
    final $$SoundReferencesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.labelSoundId,
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

class $$QuestStagesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $QuestStagesTable,
    QuestStage,
    $$QuestStagesTableFilterComposer,
    $$QuestStagesTableOrderingComposer,
    $$QuestStagesTableAnnotationComposer,
    $$QuestStagesTableCreateCompanionBuilder,
    $$QuestStagesTableUpdateCompanionBuilder,
    (QuestStage, $$QuestStagesTableReferences),
    QuestStage,
    PrefetchHooks Function({bool questId, bool labelSoundId})> {
  $$QuestStagesTableTableManager(_$AppDatabase db, $QuestStagesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestStagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestStagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestStagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> questId = const Value.absent(),
            Value<String> label = const Value.absent(),
            Value<int?> labelSoundId = const Value.absent(),
          }) =>
              QuestStagesCompanion(
            id: id,
            questId: questId,
            label: label,
            labelSoundId: labelSoundId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int questId,
            required String label,
            Value<int?> labelSoundId = const Value.absent(),
          }) =>
              QuestStagesCompanion.insert(
            id: id,
            questId: questId,
            label: label,
            labelSoundId: labelSoundId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$QuestStagesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({questId = false, labelSoundId = false}) {
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
                if (questId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.questId,
                    referencedTable:
                        $$QuestStagesTableReferences._questIdTable(db),
                    referencedColumn:
                        $$QuestStagesTableReferences._questIdTable(db).id,
                  ) as T;
                }
                if (labelSoundId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.labelSoundId,
                    referencedTable:
                        $$QuestStagesTableReferences._labelSoundIdTable(db),
                    referencedColumn:
                        $$QuestStagesTableReferences._labelSoundIdTable(db).id,
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

typedef $$QuestStagesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $QuestStagesTable,
    QuestStage,
    $$QuestStagesTableFilterComposer,
    $$QuestStagesTableOrderingComposer,
    $$QuestStagesTableAnnotationComposer,
    $$QuestStagesTableCreateCompanionBuilder,
    $$QuestStagesTableUpdateCompanionBuilder,
    (QuestStage, $$QuestStagesTableReferences),
    QuestStage,
    PrefetchHooks Function({bool questId, bool labelSoundId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SoundReferencesTableTableManager get soundReferences =>
      $$SoundReferencesTableTableManager(_db, _db.soundReferences);
  $$ZonesTableTableManager get zones =>
      $$ZonesTableTableManager(_db, _db.zones);
  $$RoomSurfacesTableTableManager get roomSurfaces =>
      $$RoomSurfacesTableTableManager(_db, _db.roomSurfaces);
  $$CommandsTableTableManager get commands =>
      $$CommandsTableTableManager(_db, _db.commands);
  $$CommandCallersTableTableManager get commandCallers =>
      $$CommandCallersTableTableManager(_db, _db.commandCallers);
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
  $$RoomObjectCommandCallersTableTableManager get roomObjectCommandCallers =>
      $$RoomObjectCommandCallersTableTableManager(
          _db, _db.roomObjectCommandCallers);
  $$RoomObjectMovementsTableTableManager get roomObjectMovements =>
      $$RoomObjectMovementsTableTableManager(_db, _db.roomObjectMovements);
  $$CommandGameStatsTableTableManager get commandGameStats =>
      $$CommandGameStatsTableTableManager(_db, _db.commandGameStats);
  $$QuestsTableTableManager get quests =>
      $$QuestsTableTableManager(_db, _db.quests);
  $$QuestStagesTableTableManager get questStages =>
      $$QuestStagesTableTableManager(_db, _db.questStages);
}
