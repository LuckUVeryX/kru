import 'package:kru/daos/daos.dart';
import 'package:kru/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kru_record_controller_provider.g.dart';

@riverpod
class KruRecordContoller extends _$KruRecordContoller {
  KruRecordDao get _dao => ref.read(kruRecordDaoProvider);

  @override
  FutureOr<List<KruRecord>> build({
    int limit = 10,
    int offset = 0,
  }) {
    return _dao.records(limit: limit, offset: offset);
  }

  Future<void> addRecord(KruRecordsCompanion entry) async {
    state = const AsyncLoading();
    try {
      await _dao.addRecord(entry);
      ref.invalidateSelf();
      await future;
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> updateRecord(KruRecord entry) async {
    state = const AsyncLoading();
    try {
      await _dao.updateRecord(entry);
      ref.invalidateSelf();
      await future;
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> deleteRecord(KruRecord entry) async {
    final prev = state.requireValue;
    state = AsyncData(prev.toList()..removeWhere((e) => entry.id == e.id));
    try {
      await _dao.deleteRecord(entry);
      ref.invalidateSelf();
      await future;
    } catch (e, st) {
      state = AsyncData(prev);
      state = AsyncError(e, st);
    }
  }
}