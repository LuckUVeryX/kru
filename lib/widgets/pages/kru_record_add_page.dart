import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kru/database/database.dart';
import 'package:kru/utils/utils.dart';
import 'package:kru/widgets/widgets.dart';

class KruRecordAddPage extends HookConsumerWidget {
  const KruRecordAddPage._();

  static Future<KruRecordsCompanion?> push(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const KruRecordAddPage._()),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newRecord = useState(
      KruRecordsCompanion.insert(
        duration: 2 * 60,
        date: DateTime.now(),
        location: KruLocation.cq,
      ),
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(
            title: Text('Record'),
          ),
          SliverList.list(
            children: [
              Padding(
                padding: h16,
                child: Text(
                  'Location',
                  style: context.textTheme.titleLarge,
                ),
              ),
              sp4,
              ...KruLocation.values.map(
                (e) => RadioListTile<KruLocation>(
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  value: e,
                  groupValue: newRecord.value.location.value,
                  title: Text(e.name.toUpperCase()),
                  onChanged: (value) {
                    if (value == null) return;
                    newRecord.value = newRecord.value.copyWith(
                      location: drift.Value(value),
                    );
                  },
                ),
              ),
              sp16,
              Padding(
                padding: h16,
                child: Text(
                  'Date',
                  style: context.textTheme.titleLarge,
                ),
              ),
              Padding(
                padding: h16,
                child: TextButton(
                  onPressed: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: newRecord.value.date.value,
                      firstDate: DateTime(DateTime.now().year - 1),
                      lastDate: DateTime(DateTime.now().year + 1),
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                    );
                    if (date == null) return;
                    newRecord.value = newRecord.value.copyWith(
                      date: drift.Value(date),
                    );
                  },
                  child: Text(
                    DateFormat.yMMMEd().format(newRecord.value.date.value),
                  ),
                ),
              ),
              Padding(
                padding: h16,
                child: Text('Duration', style: context.textTheme.titleLarge),
              ),
              Padding(
                padding: h8,
                child: Slider.adaptive(
                  min: 45,
                  max: 60 * 8,
                  // 8 Hours to 15 min intervals
                  divisions: (8 * 60 - 45) ~/ 15,
                  value: newRecord.value.duration.value.toDouble(),
                  onChanged: (value) {
                    newRecord.value = newRecord.value.copyWith(
                      duration: drift.Value(value.toInt()),
                    );
                  },
                ),
              ),
              Text(
                Duration(minutes: newRecord.value.duration.value).inHoursMins,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: OutlinedButton(
          onPressed: () => context.pop(newRecord.value),
          child: const Text('Save'),
        ),
      ),
    );
  }
}
