import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kru/providers/providers.dart';
import 'package:kru/utils/duration_extensions.dart';

class KruStatsAppBar extends HookConsumerWidget {
  const KruStatsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateSelection = ref.watch(kruRecordDateRangeControllerProvider);

    final provider = switch (dateSelection) {
      (final date?, (null, null)) => kruRecordDateProvider(date: date),
      (null, (final start?, final end?)) =>
        kruRecordDateRangeProvider(start: start, end: end),
      _ => null,
    };

    final duration = switch (provider) {
      final p? => ref.watch(
          p.select(
            (value) {
              return value.valueOrNull
                      ?.fold(0, (prev, e) => prev + e.duration) ??
                  0;
            },
          ),
        ),
      _ => 0,
    };

    var text = 'Kru';
    if (duration != 0) {
      text =
          '${Duration(minutes: duration).inHoursMins} ~ ${NumberFormat.simpleCurrency(locale: 'en_SG').format(duration / 60 * 22)}';
    }

    return SliverAppBar.large(
      title: Text(text),
    );
  }
}
