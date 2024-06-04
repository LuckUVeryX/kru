import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kru/database/database.dart';
import 'package:kru/providers/providers.dart';
import 'package:kru/utils/utils.dart';
import 'package:kru/widgets/molecules/kru_table_marker.dart';
import 'package:table_calendar/table_calendar.dart';

class KruTableCalendar extends HookConsumerWidget {
  const KruTableCalendar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusedDay = useState(
      // Initially focused on first day of month
      ((DateTime now) => DateTime(now.year, now.month)).call(DateTime.now()),
    );

    final dateSelection = ref.watch(kruRecordDateRangeControllerProvider);
    final (selectedDay, (rangeStartDay, rangeEndDay)) = dateSelection;
    final rangeSelectionMode = switch (dateSelection) {
      (final _?, (null, null)) => RangeSelectionMode.toggledOff,
      (null, (_, _)) => RangeSelectionMode.toggledOn,
      _ => throw UnsupportedError('Invalid date range state'),
    };

    final events = ref.watch(kruCalendarRecordControllerProvider);

    ref.listen(kruCalendarRecordControllerProvider, (previous, next) async {
      final notifier = ref.read(kruCalendarRecordControllerProvider.notifier);
      await notifier.loadEvent(focusedDay.value);
    });

    useEffect(
      () {
        Future<void> loadInitialEvent() async {
          final notifier =
              ref.read(kruCalendarRecordControllerProvider.notifier);
          await notifier.loadEvent(focusedDay.value);
        }

        loadInitialEvent.call();
        return null;
      },
      [],
    );

    return TableCalendar<KruRecord>(
      locale: 'en_SG',
      firstDay: DateTime(0),
      focusedDay: focusedDay.value,
      startingDayOfWeek: StartingDayOfWeek.monday,
      lastDay: DateTime.now().add(const Duration(days: 30)),
      rangeStartDay: rangeStartDay,
      rangeEndDay: rangeEndDay,
      rangeSelectionMode: rangeSelectionMode,
      selectedDayPredicate: (day) => isSameDay(selectedDay, day),
      availableCalendarFormats: const {CalendarFormat.month: 'Month'},
      onPageChanged: (day) async {
        focusedDay.value = day;
        final notifier = ref.read(kruCalendarRecordControllerProvider.notifier);
        await notifier.loadEvent(focusedDay.value);
      },
      onDaySelected: (selectDay, focusDay) {
        if (isSameDay(selectedDay, selectDay)) return;
        focusedDay.value = focusDay;
        ref
            .read(kruRecordDateRangeControllerProvider.notifier)
            .onDateChanged(selectDay);
      },
      onRangeSelected: (start, end, focusDay) {
        focusedDay.value = focusDay;
        ref
            .read(kruRecordDateRangeControllerProvider.notifier)
            .onRangeChanged((start, end));
      },
      onHeaderLongPressed: (_) {
        // Return back to current day
        focusedDay.value = DateTime.now();
      },
      calendarBuilders: CalendarBuilders(
        markerBuilder: (_, __, events) => KruTableMarker(events: events),
      ),
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: context.colorScheme.onSurface,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: context.colorScheme.onSurface.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        rangeHighlightColor: context.colorScheme.onSurface.withOpacity(0.2),
        rangeStartDecoration: BoxDecoration(
          color: context.colorScheme.onSurface.withOpacity(0.8),
          shape: BoxShape.circle,
        ),
        rangeEndDecoration: BoxDecoration(
          color: context.colorScheme.onSurface.withOpacity(0.8),
          shape: BoxShape.circle,
        ),
      ),
      eventLoader: (day) {
        return (events[day] ?? {}).toList();
      },
    );
  }
}
