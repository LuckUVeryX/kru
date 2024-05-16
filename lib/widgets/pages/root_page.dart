import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kru/widgets/widgets.dart';

class RootPage extends HookConsumerWidget {
  const RootPage({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(),
          SliverToBoxAdapter(child: KruTableCalendar()),
          KruRecordsListView(),
          sp48Sliver,
        ],
      ),
      floatingActionButton: KruRecordAddFloatingActionButton(),
    );
  }
}
