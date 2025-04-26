// lib/models/habit.dart
class Habit {
  String title;
  DateTime? reminderTime; // Puede ser nulo si no hay recordatorio
  bool isCompleted;

  Habit({
    required this.title,
    this.reminderTime,
    this.isCompleted = false,
  });
}
