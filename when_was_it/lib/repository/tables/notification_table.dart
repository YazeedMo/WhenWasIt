import 'package:app/repository/tables/reminder_table.dart';

class NotificationTable {
  static const String tableName = 'notifications';
  static const String columnId = 'id';
  static const String columnReminderId = 'reminderId';
  static const String columnNotificationTime = 'notificationTime';
  static const String columnSeen = 'seen'; // Boolean: Whether the notification was seen
  static const String columnNotificationStatus = 'status'; // Notification status (shown, missed, etc.)

  static const String createTableSQL = '''
    CREATE TABLE $tableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnReminderId INTEGER NOT NULL,
      $columnNotificationTime TEXT,
      $columnSeen INTEGER NOT NULL CHECK ($columnSeen IN (0, 1)),
      $columnNotificationStatus TEXT,
      FOREIGN KEY ($columnReminderId) REFERENCES ${ReminderTable.tableName}(${ReminderTable.columnId}) ON DELETE CASCADE
    )
  ''';
}
