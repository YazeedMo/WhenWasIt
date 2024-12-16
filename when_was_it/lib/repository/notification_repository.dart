import 'package:when_was_it/domain/notification.dart';
import 'package:when_was_it/repository/database_provider.dart';
import 'package:when_was_it/repository/tables/notification_table.dart';

class NotificationRepository {
  Future<int> createNotification(Notification notification) async {
    final db = await DatabaseProvider().database;
    return await db.insert(
      NotificationTable.tableName,
      notification.toMap(),
    );
  }

  Future<Notification?> getNotificationById(int id) async {
    final db = await DatabaseProvider().database;
    final List<Map<String, dynamic>> maps = await db.query(
      NotificationTable.tableName,
      where: '${NotificationTable.columnId} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Notification.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Notification>> getNotificationsByReminderId(int reminderId) async {
    final db = await DatabaseProvider().database;
    final List<Map<String, dynamic>> maps = await db.query(
      NotificationTable.tableName,
      where: '${NotificationTable.columnReminderId} = ?',
      whereArgs: [reminderId],
    );

    return maps.map((map) => Notification.fromMap(map)).toList();
  }

  Future<int> updateNotification(Notification notification) async {
    final db = await DatabaseProvider().database;
    return await db.update(
      NotificationTable.tableName,
      notification.toMap(),
      where: '${NotificationTable.columnId} = ?',
      whereArgs: [notification.id],
    );
  }

  Future<int> deleteNotification(int id) async {
    final db = await DatabaseProvider().database;
    return await db.delete(
      NotificationTable.tableName,
      where: '${NotificationTable.columnId} = ?',
      whereArgs: [id],
    );
  }
}
