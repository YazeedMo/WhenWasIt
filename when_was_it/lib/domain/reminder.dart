import 'package:ap/repository/tables/reminder_table.dart';

class Reminder {
  final int? id;
  final int eventId;
  final DateTime? reminderDate; // Nullable for recurring reminders
  final int? recurringInterval; // Nullable for one-time reminders
  final bool isRecurring; // True for recurring, false for one-time

  Reminder({
    this.id,
    required this.eventId,
    this.reminderDate,
    this.recurringInterval,
    required this.isRecurring,
  });

  // Factory constructor to create a Reminder from a database map
  factory Reminder.fromMap(Map<String, dynamic> map) {
    return Reminder(
      id: map[ReminderTable.columnId] as int?,
      eventId: map[ReminderTable.columnEventId] as int,
      reminderDate: map[ReminderTable.columnReminderDate] != null
          ? DateTime.parse(map[ReminderTable.columnReminderDate] as String)
          : null,
      recurringInterval: map[ReminderTable.columnRecurringInterval] as int?,
      isRecurring: (map[ReminderTable.columnIsRecurring] as int) == 1,
    );
  }

  // Method to convert a Reminder to a map for database operations
  Map<String, dynamic> toMap() {
    return {
      ReminderTable.columnId: id,
      ReminderTable.columnEventId: eventId,
      ReminderTable.columnReminderDate: reminderDate?.toIso8601String(),
      ReminderTable.columnRecurringInterval: recurringInterval,
      ReminderTable.columnIsRecurring: isRecurring ? 1 : 0,
    };
  }
}
