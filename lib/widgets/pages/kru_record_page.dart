import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kru/database/database.dart';
import 'package:kru/utils/utils.dart';
import 'package:kru/widgets/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class KruRecordPage extends HookConsumerWidget {
  const KruRecordPage._({
    required this.record,
  });

  static Future<KruRecordsCompanion?> push(
    BuildContext context, {
    KruRecord? record,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => KruRecordPage._(record: record),
      ),
    );
  }

  final KruRecord? record;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordState = useState(
      record?.toCompanion(true) ??
          KruRecordsCompanion.insert(
            duration: 2 * 60,
            date: normalizeDate(DateTime.now()),
            location: KruLocation.cq,
          ),
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text('${record == null ? 'New' : 'Edit'} Record'),
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
                  groupValue: recordState.value.location.value,
                  title: Text(e.name.toUpperCase()),
                  onChanged: (value) {
                    if (value == null) return;
                    recordState.value = recordState.value.copyWith(
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
                      initialDate: recordState.value.date.value,
                      firstDate: DateTime(DateTime.now().year - 1),
                      lastDate: DateTime(DateTime.now().year + 1),
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                    );
                    if (date == null) return;
                    recordState.value = recordState.value.copyWith(
                      date: drift.Value(normalizeDate(date)),
                    );
                  },
                  child: Text(
                    DateFormat.yMMMEd().format(recordState.value.date.value),
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
                  value: recordState.value.duration.value.toDouble(),
                  onChanged: (value) {
                    recordState.value = recordState.value.copyWith(
                      duration: drift.Value(value.round()),
                    );
                  },
                ),
              ),
              Text(
                Duration(minutes: recordState.value.duration.value).inHoursMins,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: OutlinedButton(
          onPressed: record?.toCompanion(true) == recordState.value
              ? null
              : () => context.pop(
                    recordState.value.copyWith(
                      date: drift.Value(
                        normalizeDate(recordState.value.date.value),
                      ),
                    ),
                  ),
          child: const Text('Save'),
        ),
      ),
    );
  }
}
