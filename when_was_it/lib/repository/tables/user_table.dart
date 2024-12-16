class UserTable {
  // Define table name and column names
  static const String tableName = 'users';
  static const String columnId = 'id';
  static const String columnEmail = 'email';
  static const String columnPassword = 'password';
  static const String columnUsername = 'username';

  // SQL statement to create the 'users' table
  static const String createTableSQL = '''
    CREATE TABLE $tableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnEmail TEXT NOT NULL UNIQUE,
      $columnPassword TEXT NOT NULL,
      $columnUsername TEXT
    )
  ''';
}