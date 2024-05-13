import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kru/database/app_database.dart';
import 'package:kru/utils/utils.dart';

class KruRecordsListItem extends StatelessWidget {
  const KruRecordsListItem({
    required this.record,
    this.onTap,
    super.key,
  });

  final KruRecord record;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        child: Text(
          Duration(minutes: record.duration).inHoursFrac,
          style: context.textTheme.labelSmall,
          textAlign: TextAlign.center,
        ),
      ),
      title: Text(record.location.name),
      subtitle: Text(DateFormat.yMMMEd().format(record.date)),
    );
  }
}
