import 'package:kru/daos/daos.dart';
import 'package:kru/database/database.dart';
import 'package:kru/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kru_record_controller_provider.g.dart';

@riverpod
class KruRecordContoller extends _$KruRecordContoller {
  KruRecordDao get _dao => ref.read(kruRecordDaoProvider);

  @override
  FutureOr<void> build() {}

  Future<void> addRecord({
    required KruLocation location,
    required DateTime date,
    required Duration duration,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      final entry = KruRecordsCompanion.insert(
        location: location,
        date: date,
        duration: duration.inMinutes,
      );
      return _dao.addRecord(entry);
    });
    ref.invalidate(kruRecordsProvider);
  }

  Future<void> updateRecord(KruRecord entry) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      return _dao.updateRecord(entry);
    });
    ref.invalidate(kruRecordsProvider);
  }

  Future<void> deleteRecord(KruRecord entry) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      return _dao.deleteRecord(entry);
    });
    ref.invalidate(kruRecordsProvider);
  }
}
