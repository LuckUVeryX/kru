import 'package:drift/drift.dart';
import 'package:kru/database/database.dart';

part 'kru_record_dao.g.dart';

@DriftAccessor(tables: [KruRecords])
class KruRecordDao extends DatabaseAccessor<AppDatabase>
    with _$KruRecordDaoMixin {
  KruRecordDao(super.db);

  Future<List<KruRecord>> records({
    int limit = 10,
    int offset = 0,
  }) {
    return (select(kruRecords)..limit(limit, offset: offset)).get();
  }

  Future<int> addRecord(KruRecordsCompanion entry) {
    return into(kruRecords).insert(entry);
  }

  Future<void> addRecords(List<KruRecordsCompanion> entries) {
    return batch((batch) => batch.insertAll(kruRecords, entries));
  }

  Future<void> updateRecord(KruRecord entry) {
    return update(kruRecords).replace(entry);
  }

  Future<void> deleteRecord(KruRecord entry) {
    return delete(kruRecords).delete(entry);
  }
}
