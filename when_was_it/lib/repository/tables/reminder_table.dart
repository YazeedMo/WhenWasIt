import 'package:when_was_it/repository/tables/event_table.dart';

class ReminderTable {
  static const String tableName = 'reminders';
  static const String columnId = 'id';
  static const String columnEventId = 'eventId';
  static const String columnReminderDate = 'reminderDate'; // For one-time reminders
  static const String columnRecurringInterval = 'recurringInterval'; // Integer: number of days
  static const String columnIsRecurring = 'isRecurring'; // Boolean-like: 0 or 1

  static const String createTableSQL = '''
    CREATE TABLE $tableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnEventId INTEGER NOT NULL,
      $columnReminderDate TEXT,
      $columnRecurringInterval INTEGER CHECK ($columnRecurringInterval >= 0),
      $columnIsRecurring INTEGER NOT NULL CHECK ($columnIsRecurring IN (0, 1)),
      FOREIGN KEY ($columnEventId) REFERENCES ${EventTable.tableName}(${EventTable.columnId}) ON DELETE CASCADE
    )
  ''';
}
