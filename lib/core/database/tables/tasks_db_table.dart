import 'package:drift/drift.dart';

class TasksdbTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get description => text().nullable()();

  BoolColumn get isDone => boolean().withDefault(const Constant(false))();

  IntColumn get priority => integer().withDefault(const Constant(1))();
  // 1 = low, 2 = medium, 3 = high

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get dueDate => dateTime().nullable()();
}
