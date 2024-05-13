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
    return SliverList.builder(
      itemBuilder: (context, index) {
        final provider =
            kruRecordContollerProvider(offset: (index ~/ _limit) * _limit);
        final indexInPage = index % _limit;
        final recordsList = ref.watch(provider);

        return recordsList.when(
          data: (records) {
            if (indexInPage >= records.length) return null;
            final record = records[indexInPage];
            return KruRecordsListItem(
              record: record,
              onDismissed: (direction) async {
                final notifier = ref.read(provider.notifier);
                return notifier.deleteRecord(record);
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
