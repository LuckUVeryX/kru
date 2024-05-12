// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $KruRecordsTable extends KruRecords
    with TableInfo<$KruRecordsTable, KruRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KruRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDate);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDate);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumnWithTypeConverter<KruLocation, String> location =
      GeneratedColumn<String>('location', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<KruLocation>($KruRecordsTable.$converterlocation);
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
      'start', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endMeta = const VerificationMeta('end');
  @override
  late final GeneratedColumn<DateTime> end = GeneratedColumn<DateTime>(
      'end', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, updatedAt, location, start, end];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'kru_records';
  @override
  VerificationContext validateIntegrity(Insertable<KruRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    context.handle(_locationMeta, const VerificationResult.success());
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    } else if (isInserting) {
      context.missing(_startMeta);
    }
    if (data.containsKey('end')) {
      context.handle(
          _endMeta, end.isAcceptableOrUnknown(data['end']!, _endMeta));
    } else if (isInserting) {
      context.missing(_endMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KruRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KruRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      location: $KruRecordsTable.$converterlocation.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])!),
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start'])!,
      end: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end'])!,
    );
  }

  @override
  $KruRecordsTable createAlias(String alias) {
    return $KruRecordsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<KruLocation, String, String> $converterlocation =
      const EnumNameConverter<KruLocation>(KruLocation.values);
}

class KruRecord extends DataClass implements Insertable<KruRecord> {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final KruLocation location;
  final DateTime start;
  final DateTime end;
  const KruRecord(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.location,
      required this.start,
      required this.end});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    {
      map['location'] =
          Variable<String>($KruRecordsTable.$converterlocation.toSql(location));
    }
    map['start'] = Variable<DateTime>(start);
    map['end'] = Variable<DateTime>(end);
    return map;
  }

  KruRecordsCompanion toCompanion(bool nullToAbsent) {
    return KruRecordsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      location: Value(location),
      start: Value(start),
      end: Value(end),
    );
  }

  factory KruRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KruRecord(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      location: $KruRecordsTable.$converterlocation
          .fromJson(serializer.fromJson<String>(json['location'])),
      start: serializer.fromJson<DateTime>(json['start']),
      end: serializer.fromJson<DateTime>(json['end']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'location': serializer
          .toJson<String>($KruRecordsTable.$converterlocation.toJson(location)),
      'start': serializer.toJson<DateTime>(start),
      'end': serializer.toJson<DateTime>(end),
    };
  }

  KruRecord copyWith(
          {int? id,
          DateTime? createdAt,
          DateTime? updatedAt,
          KruLocation? location,
          DateTime? start,
          DateTime? end}) =>
      KruRecord(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        location: location ?? this.location,
        start: start ?? this.start,
        end: end ?? this.end,
      );
  @override
  String toString() {
    return (StringBuffer('KruRecord(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('location: $location, ')
          ..write('start: $start, ')
          ..write('end: $end')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, createdAt, updatedAt, location, start, end);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KruRecord &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.location == this.location &&
          other.start == this.start &&
          other.end == this.end);
}

class KruRecordsCompanion extends UpdateCompanion<KruRecord> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<KruLocation> location;
  final Value<DateTime> start;
  final Value<DateTime> end;
  const KruRecordsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.location = const Value.absent(),
    this.start = const Value.absent(),
    this.end = const Value.absent(),
  });
  KruRecordsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    required KruLocation location,
    required DateTime start,
    required DateTime end,
  })  : location = Value(location),
        start = Value(start),
        end = Value(end);
  static Insertable<KruRecord> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? location,
    Expression<DateTime>? start,
    Expression<DateTime>? end,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (location != null) 'location': location,
      if (start != null) 'start': start,
      if (end != null) 'end': end,
    });
  }

  KruRecordsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<KruLocation>? location,
      Value<DateTime>? start,
      Value<DateTime>? end}) {
    return KruRecordsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      location: location ?? this.location,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(
          $KruRecordsTable.$converterlocation.toSql(location.value));
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (end.present) {
      map['end'] = Variable<DateTime>(end.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KruRecordsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('location: $location, ')
          ..write('start: $start, ')
          ..write('end: $end')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $KruRecordsTable kruRecords = $KruRecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [kruRecords];
}

typedef $$KruRecordsTableInsertCompanionBuilder = KruRecordsCompanion Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  required KruLocation location,
  required DateTime start,
  required DateTime end,
});
typedef $$KruRecordsTableUpdateCompanionBuilder = KruRecordsCompanion Function({
  Value<int> id,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<KruLocation> location,
  Value<DateTime> start,
  Value<DateTime> end,
});

class $$KruRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $KruRecordsTable,
    KruRecord,
    $$KruRecordsTableFilterComposer,
    $$KruRecordsTableOrderingComposer,
    $$KruRecordsTableProcessedTableManager,
    $$KruRecordsTableInsertCompanionBuilder,
    $$KruRecordsTableUpdateCompanionBuilder> {
  $$KruRecordsTableTableManager(_$AppDatabase db, $KruRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$KruRecordsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$KruRecordsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$KruRecordsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<KruLocation> location = const Value.absent(),
            Value<DateTime> start = const Value.absent(),
            Value<DateTime> end = const Value.absent(),
          }) =>
              KruRecordsCompanion(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            location: location,
            start: start,
            end: end,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            required KruLocation location,
            required DateTime start,
            required DateTime end,
          }) =>
              KruRecordsCompanion.insert(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
            location: location,
            start: start,
            end: end,
          ),
        ));
}

class $$KruRecordsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $KruRecordsTable,
    KruRecord,
    $$KruRecordsTableFilterComposer,
    $$KruRecordsTableOrderingComposer,
    $$KruRecordsTableProcessedTableManager,
    $$KruRecordsTableInsertCompanionBuilder,
    $$KruRecordsTableUpdateCompanionBuilder> {
  $$KruRecordsTableProcessedTableManager(super.$state);
}

class $$KruRecordsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $KruRecordsTable> {
  $$KruRecordsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<KruLocation, KruLocation, String>
      get location => $state.composableBuilder(
          column: $state.table.location,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get end => $state.composableBuilder(
      column: $state.table.end,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$KruRecordsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $KruRecordsTable> {
  $$KruRecordsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get location => $state.composableBuilder(
      column: $state.table.location,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get end => $state.composableBuilder(
      column: $state.table.end,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$KruRecordsTableTableManager get kruRecords =>
      $$KruRecordsTableTableManager(_db, _db.kruRecords);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$databaseHash() => r'397e5c893a29d7b17310deb6724df71242a8ab08';

/// See also [database].
@ProviderFor(database)
final databaseProvider = Provider<AppDatabase>.internal(
  database,
  name: r'databaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$databaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DatabaseRef = ProviderRef<AppDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
