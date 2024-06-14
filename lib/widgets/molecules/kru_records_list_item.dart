import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kru/database/app_database.dart';
import 'package:kru/utils/utils.dart';
import 'package:kru/widgets/widgets.dart';

class KruRecordsListItem extends StatelessWidget {
  const KruRecordsListItem({
    required this.record,
    this.onTap,
    this.onDismissed,
    super.key,
  });

  final KruRecord record;
  final VoidCallback? onTap;
  final DismissDirectionCallback? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(record),
      onDismissed: onDismissed,
      background: Container(
        padding: h24,
        alignment: Alignment.centerLeft,
        color: context.colorScheme.destructive,
        child: Icon(
          Icons.delete,
          color: context.colorScheme.destructiveForeground,
        ),
      ),
      secondaryBackground: Container(
        padding: h24,
        alignment: Alignment.centerRight,
        color: context.colorScheme.destructive,
        child: Icon(
          Icons.delete,
          color: context.colorScheme.destructiveForeground,
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          child: Text(
            Duration(minutes: record.duration).inHoursFrac,
            style: context.textTheme.small.copyWith(
              color: context.colorScheme.background,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        title: Text(record.location.name.toUpperCase()),
        subtitle: Text(DateFormat.yMMMEd().format(record.date)),
      ),
    );
  }
}
