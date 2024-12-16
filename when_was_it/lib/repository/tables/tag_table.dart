import 'package:app/repository/tables/user_table.dart';

class TagTable {
  static const String tableName = 'tags';
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnUserId = 'userId';

  static const String createTableSQL = '''
    CREATE TABLE $tableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnName TEXT NOT NULL UNIQUE,
      $columnUserId INTEGER NULL,
      FOREIGN KEY ($columnUserId) REFERENCES ${UserTable.tableName}(${UserTable.columnId}) ON DELETE CASCADE
    )
  ''';
}
