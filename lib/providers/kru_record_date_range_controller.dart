import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kru_record_date_range_controller.g.dart';

@riverpod
class KruRecordDateRangeController extends _$KruRecordDateRangeController {
  @override
  DateTimeRange? build() {
    return null;
  }

  void onChanged(DateTimeRange value) {
    state = value;
    return;
  }

  void reset() {
    state = null;
  }
}
