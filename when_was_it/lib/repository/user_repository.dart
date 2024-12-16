import 'package:app/domain/user.dart';
import 'package:app/repository/database_provider.dart';
import 'package:app/repository/tables/user_table.dart';

class UserRepository {
  Future<int> createUser(User user) async {
    final db = await DatabaseProvider().database;
    return await db.insert(
      UserTable.tableName,
      user.toMap(),
    );
  }

  Future<User?> getUserById(int id) async {
    final db = await DatabaseProvider().database;
    final List<Map<String, dynamic>> maps = await db.query(UserTable.tableName,
        where: '${UserTable.columnId} = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  Future<User?> getUserByUsername(String username) async {
    final db = await DatabaseProvider().database;
    final List<Map<String, dynamic>> maps = await db.query(
      UserTable.tableName,
      where: '${UserTable.columnUsername} ?',
      whereArgs: [username],
    );
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  Future<User?> getUserByEmail(String email) async {
    final db = await DatabaseProvider().database;
    final List<Map<String, dynamic>> maps = await db.query(
      UserTable.tableName,
      where: '${UserTable.columnEmail} = ?',
      whereArgs: [email],
    );
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }

  Future<int> updateUser(User user) async {
    final db = await DatabaseProvider().database;
    return await db.update(
      UserTable.tableName,
      user.toMap(),
      where: '${UserTable.columnId} = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await DatabaseProvider().database;
    return await db.delete(
      UserTable.tableName,
      where: '${UserTable.columnId} = ?',
      whereArgs: [id],
    );
  }

}
