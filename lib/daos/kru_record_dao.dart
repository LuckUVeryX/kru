import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:kru/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kru_record_dao.g.dart';

@riverpod
KruRecordDao kruRecordDao(KruRecordDaoRef ref) {
  return KruRecordDao(ref.watch(databaseProvider));
}

@DriftAccessor(tables: [KruRecords])
class KruRecordDao extends DatabaseAccessor<AppDatabase>
    with _$KruRecordDaoMixin {
  KruRecordDao(super.db);

  Future<List<KruRecord>> records({
    required int limit,
    required int offset,
    DateTimeRange? range,
  }) {
    final tbl = select(kruRecords)
      ..orderBy([(tbl) => OrderingTerm.desc(tbl.date)])
      ..limit(limit, offset: offset);

    if (range != null) {
      tbl.where((tbl) => tbl.date.isBetweenValues(range.start, range.end));
    }

    return tbl.get();
  }

  Future<int> addRecord(KruRecordsCompanion entry) {
    return into(kruRecords).insert(entry);
  }

  Future<void> addRecords(List<KruRecordsCompanion> entries) {
    return batch((batch) => batch.insertAll(kruRecords, entries));
  }

  Future<void> updateRecord(KruRecordsCompanion entry) {
    return (update(kruRecords)..whereSamePrimaryKey(entry)).write(entry);
  }

  Future<void> deleteRecord(KruRecord entry) {
    return delete(kruRecords).delete(entry);
  }
}
