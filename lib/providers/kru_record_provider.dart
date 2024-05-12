import 'package:kru/daos/daos.dart';
import 'package:kru/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kru_record_provider.g.dart';

@riverpod
FutureOr<List<KruRecord>> kruRecords(
  KruRecordsRef ref, {
  int limit = 10,
  int offset = 0,
}) {
  final dao = ref.watch(kruRecordDaoProvider);
  return dao.records(limit: limit, offset: offset);
}
