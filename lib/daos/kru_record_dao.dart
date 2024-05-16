import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:kru/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:table_calendar/table_calendar.dart';

part 'kru_record_dao.g.dart';

@riverpod
KruRecordDao kruRecordDao(KruRecordDaoRef ref) {
  return KruRecordDao(ref.watch(databaseProvider));
}

@DriftAccessor(tables: [KruRecords])
class KruRecordDao extends DatabaseAccessor<AppDatabase>
    with _$KruRecordDaoMixin {
  KruRecordDao(super.db);

  Future<List<KruRecord>> recordsByDate(DateTime dt) {
    return (select(kruRecords)
          ..where((tbl) => tbl.date.isValue(normalizeDate(dt))))
        .get();
  }

  Future<List<KruRecord>> recordsByDateRange({
    required DateTime start,
    required DateTime end,
  }) {
    return (select(kruRecords)
          ..where(
            (tbl) => tbl.date
                .isBetweenValues(normalizeDate(start), normalizeDate(end)),
          ))
        .get();
  }

  Future<int> totalDuration(DateTimeRange range) async {
    final query = selectOnly(kruRecords)
      ..addColumns([kruRecords.duration.sum()])
      ..where(kruRecords.date.isBetweenValues(range.start, range.end));
    final result = await query
        .map((row) => row.read(kruRecords.duration.sum()))
        .getSingle();
    return result ?? 0;
  }

  Future<int> addRecord(KruRecordsCompanion entry) {
    return into(kruRecords).insert(entry);
  }

  Future<void> updateRecord(KruRecordsCompanion entry) {
    return (update(kruRecords)..whereSamePrimaryKey(entry)).write(entry);
  }

  Future<void> deleteRecord(KruRecord entry) {
    return delete(kruRecords).delete(entry);
  }
}
