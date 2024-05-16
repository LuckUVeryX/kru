import 'package:kru/daos/kru_record_dao.dart';
import 'package:kru/database/database.dart';
import 'package:kru/providers/providers.dart';
import 'package:kru/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kru_record_provider.g.dart';

@riverpod
class KruRecordDate extends _$KruRecordDate {
  @override
  FutureOr<List<KruRecord>> build({required DateTime date}) {
    final dao = ref.watch(kruRecordDaoProvider);
    ref.cache();
    return dao.recordsByDate(date);
  }

  Future<void> delete(KruRecord entry) async {
    final prev = state;
    state = AsyncData(
      [...state.requireValue]..removeWhere((e) => e.id == entry.id),
    );

    try {
      await ref.read(kruRecordDaoProvider).deleteRecord(entry);
      ref
        ..invalidateSelf()
        ..invalidate(kruRecordDateRangeProvider)
        ..invalidate(kruCalendarRecordControllerProvider);
      await future;
    } catch (e, st) {
      state = prev;
      state = AsyncError(e, st);
    }
  }

  Future<void> edit(KruRecordsCompanion entry) async {
    try {
      await ref.read(kruRecordDaoProvider).updateRecord(entry);
      ref
        ..invalidateSelf()
        ..invalidate(kruRecordDateRangeProvider)
        ..invalidate(kruCalendarRecordControllerProvider);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

@riverpod
class KruRecordDateRange extends _$KruRecordDateRange {
  @override
  FutureOr<List<KruRecord>> build({
    required DateTime start,
    required DateTime end,
  }) {
    final dao = ref.watch(kruRecordDaoProvider);
    ref.cache();
    return dao.recordsByDateRange(start: start, end: end);
  }

  Future<void> delete(KruRecord entry) async {
    final prev = state;
    state = AsyncData(
      [...state.requireValue]..removeWhere((e) => e.id == entry.id),
    );

    try {
      await ref.read(kruRecordDaoProvider).deleteRecord(entry);
      ref
        ..invalidateSelf()
        ..invalidate(kruRecordDateProvider)
        ..invalidate(kruCalendarRecordControllerProvider);
      await future;
    } catch (e, st) {
      state = prev;
      state = AsyncError(e, st);
    }
  }

  Future<void> edit(KruRecordsCompanion entry) async {
    try {
      await ref.read(kruRecordDaoProvider).updateRecord(entry);
      ref
        ..invalidateSelf()
        ..invalidate(kruRecordDateProvider)
        ..invalidate(kruCalendarRecordControllerProvider);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
