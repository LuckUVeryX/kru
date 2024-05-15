import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kru/providers/providers.dart';
import 'package:kru/widgets/widgets.dart';

class RootPage extends HookConsumerWidget {
  const RootPage({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: RefreshIndicator.adaptive(
        // Top app bar (large) container height + kToolbarHeight
        edgeOffset: 152 + kToolbarHeight,
        onRefresh: () async {
          ref.invalidate(kruRecordContollerProvider);
          return ref.refresh(
            kruRecordContollerProvider(
              range: ref.read(kruRecordDateRangeControllerProvider),
            ).future,
          );
        },
        child: const CustomScrollView(
          slivers: [
            SliverAppBar.large(
              title: Text('Kru Laiyan'),
              actions: [KruRecordDateRangeIconButton()],
            ),
            KruRecordsListView(),
            sp48Sliver,
          ],
        ),
      ),
      floatingActionButton: const KruRecordAddFloatingActionButton(),
    );
  }
}
