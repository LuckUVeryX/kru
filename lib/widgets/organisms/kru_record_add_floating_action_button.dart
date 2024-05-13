import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kru/providers/kru_record_controller_provider.dart';
import 'package:kru/widgets/widgets.dart';

class KruRecordAddFloatingActionButton extends HookConsumerWidget {
  const KruRecordAddFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () async {
        final notifier = ref.read(kruRecordContollerProvider().notifier);
        final record = await KruRecordAddPage.push(context);
        if (record == null) return;
        await notifier.addRecord(record);
      },
    );
  }
}
