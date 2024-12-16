import 'package:when_was_it/repository/tables/tag_table.dart';

class Tag {
  final int? id;
  final String name;
  final int? userId;

  Tag({
    this.id,
    required this.name,
    this.userId,
  });

  // Factory constructor to create a Tag from a database map
  factory Tag.fromMap(Map<String, dynamic> map) {
    return Tag(
      id: map[TagTable.columnId] as int?,
      name: map[TagTable.columnName] as String,
      userId: map[TagTable.columnUserId] as int?,
    );
  }

  // Method to convert a Tag to a map for database operations
  Map<String, dynamic> toMap() {
    return {
      TagTable.columnId: id,
      TagTable.columnName: name,
      TagTable.columnUserId: userId,
    };
  }
}
