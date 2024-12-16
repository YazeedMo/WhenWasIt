class Notification {
  final int id;
  final int reminderId;
  final DateTime? notificationTime; // Time when the notification is triggered
  final bool seen; // Whether the notification has been seen by the user
  final String status; // Status of the notification (e.g., "shown", "missed", etc.)

  Notification({
    required this.id,
    required this.reminderId,
    this.notificationTime,
    required this.seen,
    required this.status,
  });

  // Convert a Map object into a Notification object
  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      id: map['id'],
      reminderId: map['reminderId'],
      notificationTime: map['notificationTime'] != null
          ? DateTime.parse(map['notificationTime'])
          : null,
      seen: map['seen'] == 1,
      status: map['status'] ?? '',
    );
  }

  // Convert a Notification object into a Map object for database insertion
  Map<String, dynamic> toMap() {
    return {
      'reminderId': reminderId,
      'notificationTime': notificationTime?.toIso8601String(),
      'seen': seen ? 1 : 0,
      'status': status,
    };
  }
}
