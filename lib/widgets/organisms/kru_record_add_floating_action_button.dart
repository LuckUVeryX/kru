import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kru/providers/providers.dart';
import 'package:kru/utils/utils.dart';
import 'package:kru/widgets/widgets.dart';

class KruRecordAddFloatingActionButton extends HookConsumerWidget {
  const KruRecordAddFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listenError(kruRecordControllerProvider);

    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        final notifier = ref.read(kruRecordControllerProvider.notifier);
        final record = await KruRecordPage.push(context);
        if (record == null) return;
        await notifier.add(record);
      },
    );
  }
}
