import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kru/providers/kru_record_date_range_controller.dart';

class KruRecordDateRangeIconButton extends HookConsumerWidget {
  const KruRecordDateRangeIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        final notifier =
            ref.read(kruRecordDateRangeControllerProvider.notifier);

        final range = await showDateRangePicker(
          context: context,
          currentDate: DateTime.now(),
          firstDate: DateTime(0),
          lastDate: DateTime.now(),
          initialEntryMode: DatePickerEntryMode.calendarOnly,
        );
        if (range == null) return;
        notifier.onChanged(range);
      },
      icon: const Icon(Icons.date_range),
    );
  }
}

class KruRecordDateRangeResetButton extends HookConsumerWidget {
  const KruRecordDateRangeResetButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: ref.read(kruRecordDateRangeControllerProvider.notifier).reset,
      child: const Text('Reset'),
    );
  }
}
