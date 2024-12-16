import 'package:when_was_it/repository/tables/user_table.dart';

class User {
  final int? id;
  final String email;
  final String password;
  final String? username;

  User({
    this.id,
    required this.email,
    required this.password,
    this.username,
  });

  // Factory constructor to create a User from a database map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map[UserTable.columnId] as int?,
      email: map[UserTable.columnEmail] as String,
      password: map[UserTable.columnPassword] as String,
      username: map[UserTable.columnUsername] as String?,
    );
  }

  // Method to convert a User to a map for database operations
  Map<String, dynamic> toMap() {
    return {
      UserTable.columnId: id,
      UserTable.columnEmail: email,
      UserTable.columnPassword: password,
      UserTable.columnUsername: username,
    };
  }
}
