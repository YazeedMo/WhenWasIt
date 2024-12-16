import 'package:app/repository/tables/event_table.dart';
import 'package:app/repository/tables/tag_table.dart';

class EventTagTable {
  // Define table name and column names
  static const String tableName = 'event_tags';
  static const String columnId = 'id';
  static const String columnEventId = 'eventId';
  static const String columnTagId = 'tagId';

  // SQL statement to create the 'event_tags' table
  static const String createTableSQL = '''
    CREATE TABLE $tableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnEventId INTEGER NOT NULL,
      $columnTagId INTEGER NOT NULL,
      FOREIGN KEY ($columnEventId) REFERENCES ${EventTable.tableName}(${EventTable.columnId}) ON DELETE CASCADE,
      FOREIGN KEY ($columnTagId) REFERENCES ${TagTable.tableName}(${TagTable.columnId}) ON DELETE CASCADE
    )
  ''';
}
