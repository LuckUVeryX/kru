import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kru/providers/providers.dart';
import 'package:kru/utils/utils.dart';
import 'package:kru/widgets/widgets.dart';

class KruRecordsListView extends HookConsumerWidget {
  const KruRecordsListView({
    super.key,
  });

  static const _limit = 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDateRange = ref.watch(kruRecordDateRangeControllerProvider);

    return SliverList.builder(
      itemBuilder: (context, index) {
        final provider = kruRecordContollerProvider(
          offset: (index ~/ _limit) * _limit,
          range: selectedDateRange,
        );
        final indexInPage = index % _limit;
        final recordsList = ref.watch(provider);

        return recordsList.when(
          skipLoadingOnReload: true,
          data: (records) {
            if (indexInPage >= records.length) return null;
            final record = records[indexInPage];
            return KruRecordsListItem(
              record: record,
              onDismissed: (direction) async {
                final notifier = ref.read(provider.notifier);
                await notifier.deleteRecord(record);
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Deleted'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        notifier.addRecord(record.toCompanion(false));
                      },
                    ),
                  ),
                );
              },
              onTap: () async {
                final notifier = ref.read(provider.notifier);
                final entry = await KruRecordPage.push(context, record: record);
                if (entry == null) return;
                return notifier.updateRecord(entry);
              },
            );
          },
          error: (error, stackTrace) {
            return indexInPage == 0
                ? Center(child: Text(error.toString()))
                : const Offstage();
          },
          loading: () {
            return ShimmerWidget(
              child: ListTile(
                leading: const CircleAvatar(),
                title: ShimmerText(
                  textStyle: context.textTheme.bodyLarge,
                  spacerFlex: 2,
                ),
                subtitle: ShimmerText(
                  textStyle: context.textTheme.bodyLarge,
                  flex: 2,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
