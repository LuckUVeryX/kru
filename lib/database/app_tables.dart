import 'package:drift/drift.dart';

class KruRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDate)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDate)();
  TextColumn get location => textEnum<KruLocation>()();
  DateTimeColumn get date => dateTime()();
  IntColumn get duration => integer()();
}

enum KruLocation { fes, oc, kinex, sv, cq }
