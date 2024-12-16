import 'package:when_was_it/domain/event.dart';
import 'package:when_was_it/repository/database_provider.dart';
import 'package:when_was_it/repository/tables/event_table.dart';

class EventRepository {

  Future<int> createUser(Event event) async {
    final db = await DatabaseProvider().database;
    return await db.insert(
      EventTable.tableName,
      event.toMap(),
    );
  }

  Future<Event?> getByEventId(int id) async {
    final db = await DatabaseProvider().database;
    final List<Map<String, dynamic>> maps = await db.query(EventTable.tableName,
      where: '${EventTable.columnId} = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Event.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Event>> getAllEvents(int userId) async {
    final db = await DatabaseProvider().database;
    final List<Map<String, dynamic>> maps = await db.query(
      EventTable.tableName,
      where: '${EventTable.columnUserId} = ?',
      whereArgs: [userId],
    );

    // If no events found, return an empty list
    if (maps.isEmpty) {
      return [];
    }

    // Return all events by converting each map into an Event object
    return maps.map((map) => Event.fromMap(map)).toList();
  }

  Future<int> updateEvent(Event event) async {
    final db = await DatabaseProvider().database;
    return await db.update(
      EventTable.tableName,
      event.toMap(),
      where: '${EventTable.columnId} = ?',
      whereArgs: [event.id],
    );
  }

  Future<int> deleteEvent(int id) async {
    final db = await DatabaseProvider().database;
    return await db.delete(
      EventTable.tableName,
      where: '${EventTable.columnId} = ?',
      whereArgs: [id],
    );
  }
}