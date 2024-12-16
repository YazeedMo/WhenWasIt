import 'package:when_was_it/repository/tables/event_table.dart';

class Event {
  final int? id;
  final String name;
  final DateTime date;
  final String? description;
  final int userId;

  Event({
    this.id,
    required this.name,
    required this.date,
    this.description,
    required this.userId,
  });

  // Factory constructor to create an Event from a database map
  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map[EventTable.columnId] as int?,
      name: map[EventTable.columnName] as String,
      date: DateTime.parse(map[EventTable.columnDate] as String), // Parse ISO 8601 string
      description: map[EventTable.columnDescription] as String?,
      userId: map[EventTable.columnUserId] as int,
    );
  }

  // Method to convert an Event to a map for database operations
  Map<String, dynamic> toMap() {
    return {
      EventTable.columnId: id,
      EventTable.columnName: name,
      EventTable.columnDate: date.toIso8601String(), // Store as ISO 8601 string
      EventTable.columnDescription: description,
      EventTable.columnUserId: userId,
    };
  }
}
