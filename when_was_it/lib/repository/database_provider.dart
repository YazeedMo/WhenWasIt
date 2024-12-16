import 'package:when_was_it/repository/tables/event_table.dart';
import 'package:when_was_it/repository/tables/event_tag_table.dart';
import 'package:when_was_it/repository/tables/tag_table.dart';
import 'package:when_was_it/repository/tables/user_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider {

  // Singleton pattern to ensure only one instance of DatabaseProvider
  static final DatabaseProvider _instance = DatabaseProvider._internal();
  factory DatabaseProvider() => _instance;
  DatabaseProvider._internal();

  static Database? _database;

  // Get or initialize the database instance
  Future<Database> get database async {
    if (_database != null) return _database!; // Return existing instance if available
    _database = await _initDatabase();        // Initialize if it's null
    return _database!;
  }

  // Initialize the database and set up the tables
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(UserTable.createTableSQL);
        await db.execute(TagTable.createTableSQL);
        await db.execute(EventTable.createTableSQL);
        await db.execute(EventTagTable.createTableSQL);
      },
    );
  }

  // Close the database connection
  Future<void> close() async {
    _database?.close();
  }

}