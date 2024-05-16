import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kru_record_date_range_controller.g.dart';

typedef DateRange = (DateTime? start, DateTime? end);
typedef SelectedDate = (DateTime? date, DateRange);

@riverpod
class KruRecordDateRangeController extends _$KruRecordDateRangeController {
  @override
  SelectedDate build() {
    return (DateTime.now(), (null, null));
  }

  void onDateChanged(DateTime value) {
    state = (value, (null, null));
  }

  void onRangeChanged(DateRange value) {
    state = (null, value);
  }
}
