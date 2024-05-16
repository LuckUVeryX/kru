import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kru/providers/providers.dart';
import 'package:kru/widgets/widgets.dart';

class KruRecordsListView extends HookConsumerWidget {
  const KruRecordsListView({
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

    final value = switch (provider) {
      final p? => ref.watch(p),
      _ => null,
    };

    return SliverList.builder(
      itemCount: value?.valueOrNull?.length,
      itemBuilder: (context, index) {
        return value?.when(
          skipLoadingOnReload: true,
          data: (records) {
            final record = records[index];
            return KruRecordsListItem(
              record: record,
              onDismissed: (direction) async {
                switch (dateSelection) {
                  case (final date?, (null, null)):
                    final notifier = ref.read(
                      kruRecordDateProvider(date: date).notifier,
                    );
                    await notifier.delete(record);

                  case (null, (final start?, final end?)):
                    final notifier = ref.read(
                      kruRecordDateRangeProvider(start: start, end: end)
                          .notifier,
                    );
                    await notifier.delete(record);
                }

                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Deleted'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () async {
                        final notifier =
                            ref.read(kruRecordControllerProvider.notifier);
                        await notifier.add(record.toCompanion(false));
                      },
                    ),
                  ),
                );
              },
              onTap: () async {
                final entry = await KruRecordPage.push(context, record: record);
                if (entry == null) return;

                switch (dateSelection) {
                  case (final date?, (null, null)):
                    final notifier = ref.read(
                      kruRecordDateProvider(date: date).notifier,
                    );
                    await notifier.edit(entry);

                  case (null, (final start?, final end?)):
                    final notifier = ref.read(
                      kruRecordDateRangeProvider(start: start, end: end)
                          .notifier,
                    );
                    await notifier.edit(entry);
                }
              },
            );
          },
          error: (error, stackTrace) {
            return index == 0 ? Center(child: Text(error.toString())) : null;
          },
          loading: () => null,
        );
      },
    );
  }
}
