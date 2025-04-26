// lib/widgets/habit_list_item.dart
import 'package:flutter/material.dart';
import '../models/habit.dart'; // Importa la clase Habit
import 'package:intl/intl.dart'; // Importa el paquete intl para formatear la hora

class HabitListItem extends StatelessWidget {
  final Habit habit;
  final Function(bool?)? onCheckboxChanged; // Callback para el checkbox

  const HabitListItem({
    Key? key,
    required this.habit,
    this.onCheckboxChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Checkbox(
              value: habit.isCompleted,
              onChanged: onCheckboxChanged,
            ),
            Expanded(
              child: Text(
                habit.title,
                style: TextStyle(
                  fontSize: 18.0,
                  decoration: habit.isCompleted ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
            if (habit.reminderTime != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(Icons.alarm),
              ),
            if (habit.reminderTime != null)
              Text(
                DateFormat('hh:mm a').format(habit.reminderTime!), // Formatea la hora
              ),
          ],
        ),
      ),
    );
  }
}
