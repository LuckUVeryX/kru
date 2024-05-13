import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kru/providers/kru_record_provider.dart';
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
          ref.invalidate(kruRecordsProvider);
          return ref.refresh(kruRecordsProvider().future);
        },
        child: const CustomScrollView(
          slivers: [
            SliverAppBar.large(
              title: Text('Kru'),
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
