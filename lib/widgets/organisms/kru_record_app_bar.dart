import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kru/providers/providers.dart';
import 'package:kru/utils/duration_extensions.dart';
import 'package:kru/widgets/widgets.dart';

class KruRecordAppBar extends HookConsumerWidget {
  const KruRecordAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasRange = ref.watch(
      kruRecordDateRangeControllerProvider.select((value) => value != null),
    );

    return hasRange ? const _KruRecordStatsAppBar() : const _KruRecordAppBar();
  }
}

class _KruRecordStatsAppBar extends HookConsumerWidget {
  const _KruRecordStatsAppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateRange = ref.watch(kruRecordDateRangeControllerProvider);
    if (dateRange == null) return const Offstage();

    final duration = ref.watch(
      kruRecordSumProvider(dateRange).select((value) => value.valueOrNull),
    );

    return SliverAppBar.large(
      actions: const [KruRecordDateRangeResetButton()],
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          () {
            final formatter = DateFormat('MM/dd');
            return [
              if (duration != null)
                '${Duration(minutes: duration).inHoursMins} - ${NumberFormat.compactSimpleCurrency(locale: 'en_SG').format(duration / 60 * 22)}',
              '${formatter.format(dateRange.start)} - ${formatter.format(dateRange.end)}',
            ].join('\n');
          }.call(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _KruRecordAppBar extends HookConsumerWidget {
  const _KruRecordAppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SliverAppBar.large(
      title: Text('Kru Laiyan'),
      actions: [KruRecordDateRangeIconButton()],
    );
  }
}
