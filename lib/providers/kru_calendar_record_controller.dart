import 'dart:collection';
import 'dart:isolate';

import 'package:kru/daos/daos.dart';
import 'package:kru/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:table_calendar/table_calendar.dart';

part 'kru_calendar_record_controller.g.dart';

@riverpod
class KruCalendarRecordController extends _$KruCalendarRecordController {
  final _cached = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: (key) => key.day * 1000000 + key.month * 10000 + key.year,
  );

  @override
  LinkedHashMap<DateTime, Set<KruRecord>> build() {
    _cached.clear();
    return LinkedHashMap(
      equals: isSameDay,
      hashCode: (key) => key.day * 1000000 + key.month * 10000 + key.year,
    );
  }

  Future<void> loadEvent(DateTime dt) async {
    if (_cached.contains(dt)) return;
    _cached.add(dt);

    final dao = ref.read(kruRecordDaoProvider);
    final records = await dao.recordsByDateRange(
      start: DateTime(dt.year, dt.month)
          .subtract(const Duration(days: DateTime.daysPerWeek)),
      end: DateTime(dt.year, dt.month + 1)
          .add(const Duration(days: DateTime.daysPerWeek)),
    );
    if (records.isEmpty) return;

    await Isolate.run(() {
      final copy = state.toMap();

      for (final record in records) {
        copy[record.date] = (copy[record.date] ?? {})..add(record);
      }
      state = copy;
    });
  }
}

extension on LinkedHashMap<DateTime, Set<KruRecord>> {
  LinkedHashMap<DateTime, Set<KruRecord>> toMap() {
    return LinkedHashMap(
      equals: isSameDay,
      hashCode: (key) => key.day * 1000000 + key.month * 10000 + key.year,
    )..addAll(this);
  }
}
