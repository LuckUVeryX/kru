import 'package:flutter/material.dart';
import 'package:kru/daos/daos.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kru_record_sum_provider.g.dart';

@riverpod
FutureOr<int> kruRecordSum(KruRecordSumRef ref, DateTimeRange range) {
  final dao = ref.watch(kruRecordDaoProvider);
  return dao.totalDuration(range);
}
