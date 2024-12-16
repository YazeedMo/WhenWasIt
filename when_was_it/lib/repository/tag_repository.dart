import 'package:when_was_it/domain/tag.dart';
import 'package:when_was_it/repository/database_provider.dart';
import 'package:when_was_it/repository/tables/tag_table.dart';

class TagRepository {
  Future<int> createTag(Tag tag) async {
    final db = await DatabaseProvider().database;
    return await db.insert(
      TagTable.tableName,
      tag.toMap(),
    );
  }

  Future<Tag?> getTagById(int id) async {
    final db = await DatabaseProvider().database;
    final List<Map<String, dynamic>> maps = await db.query(
      TagTable.tableName,
      where: '${TagTable.columnId} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Tag.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Tag>> getAllTags({int? userId}) async {
    final db = await DatabaseProvider().database;
    String? whereClause;
    List<Object?>? whereArgs;

    if (userId != null) {
      whereClause = '${TagTable.columnUserId} IS NULL OR ${TagTable.columnUserId} = ?';
      whereArgs = [userId];
    }

    final List<Map<String, dynamic>> maps = await db.query(
      TagTable.tableName,
      where: whereClause,
      whereArgs: whereArgs,
    );

    return maps.map((map) => Tag.fromMap(map)).toList();
  }

  Future<int> updateTag(Tag tag) async {
    final db = await DatabaseProvider().database;
    return await db.update(
      TagTable.tableName,
      tag.toMap(),
      where: '${TagTable.columnId} = ?',
      whereArgs: [tag.id],
    );
  }

  Future<int> deleteTag(int id) async {
    final db = await DatabaseProvider().database;
    return await db.delete(
      TagTable.tableName,
      where: '${TagTable.columnId} = ?',
      whereArgs: [id],
    );
  }
}
