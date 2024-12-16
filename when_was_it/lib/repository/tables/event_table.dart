import 'package:app/repository/tables/user_table.dart';

class EventTable {
  static const String tableName = 'events';
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnDate = 'date';
  static const String columnDescription = 'description';
  static const String columnUserId = 'userId';

  static const String createTableSQL = '''
    CREATE TABLE $tableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnName TEXT NOT NULL,
      $columnDate TEXT DEFAULT CURRENT_TIMESTAMP,
      $columnDescription TEXT,
      $columnUserId INTEGER,
      FOREIGN KEY ($columnUserId) REFERENCES ${UserTable.tableName}(${UserTable.columnId}) ON DELETE CASCADE
    )
  ''';
}
