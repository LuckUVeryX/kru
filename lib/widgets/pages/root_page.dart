import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kru/widgets/widgets.dart';

class RootPage extends HookConsumerWidget {
  const RootPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          KruRecordAddPage.push(context);
        },
      ),
    );
  }
}
