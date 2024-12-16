import 'package:app/domain/reminder.dart';
import 'package:app/repository/database_provider.dart';
import 'package:app/repository/tables/reminder_table.dart';

class ReminderRepository {
  Future<int> createReminder(Reminder reminder) async {
    final db = await DatabaseProvider().database;
    return await db.insert(
      ReminderTable.tableName,
      reminder.toMap(),
    );
  }

  Future<Reminder?> getReminderById(int id) async {
    final db = await DatabaseProvider().database;
    final List<Map<String, dynamic>> maps = await db.query(
      ReminderTable.tableName,
      where: '${ReminderTable.columnId} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Reminder.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Reminder>> getRemindersByEventId(int eventId) async {
    final db = await DatabaseProvider().database;
    final List<Map<String, dynamic>> maps = await db.query(
      ReminderTable.tableName,
      where: '${ReminderTable.columnEventId} = ?',
      whereArgs: [eventId],
    );

    // If no reminders found, return an empty list
    if (maps.isEmpty) {
      return [];
    }

    // Return all reminders by converting each map into a Reminder object
    return maps.map((map) => Reminder.fromMap(map)).toList();
  }

  Future<int> updateReminder(Reminder reminder) async {
    final db = await DatabaseProvider().database;
    return await db.update(
      ReminderTable.tableName,
      reminder.toMap(),
      where: '${ReminderTable.columnId} = ?',
      whereArgs: [reminder.id],
    );
  }

  Future<int> deleteReminder(int id) async {
    final db = await DatabaseProvider().database;
    return await db.delete(
      ReminderTable.tableName,
      where: '${ReminderTable.columnId} = ?',
      whereArgs: [id],
    );
  }
}
