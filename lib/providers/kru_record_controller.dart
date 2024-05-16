import 'package:kru/daos/daos.dart';
import 'package:kru/database/database.dart';
import 'package:kru/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kru_record_controller.g.dart';

@riverpod
class KruRecordController extends _$KruRecordController {
  KruRecordDao get _dao => ref.read(kruRecordDaoProvider);

  @override
  FutureOr<void> build() {}

  Future<void> add(KruRecordsCompanion entry) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _dao.addRecord(entry));

    ref
      ..invalidate(kruCalendarRecordControllerProvider)
      ..invalidate(kruRecordDateProvider)
      ..invalidate(kruRecordDateRangeProvider);
  }
}
