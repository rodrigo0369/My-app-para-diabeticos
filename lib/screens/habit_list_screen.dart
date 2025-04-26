// lib/screens/habit_list_screen.dart
import 'package:flutter/material.dart';
import '../widgets/habit_list_item.dart';
import '../models/habit.dart';

class HabitListScreen extends StatefulWidget {
  const HabitListScreen({Key? key}) : super(key: key);

  @override
  _HabitListScreenState createState() => _HabitListScreenState();
}

class _HabitListScreenState extends State<HabitListScreen> {
  // Lista de hábitos (esto eventualmente vendrá de una fuente de datos)
  List<Habit> habits = [
    Habit(title: 'Tomar medicina', reminderTime: DateTime.now().add(const Duration(hours: 8, minutes: 0))),
    Habit(title: 'Medir glucosa'),
    Habit(title: 'Caminar 30 minutos', isCompleted: true),
  ];

  // Contador de hábitos completados hoy
  int completedHabitsCount = 0;

  @override
  void initState() {
    super.initState();
    _updateCompletedHabitsCount();
  }

  // Función para actualizar el contador de hábitos completados
  void _updateCompletedHabitsCount() {
    setState(() {
      completedHabitsCount = habits.where((habit) => habit.isCompleted).length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Hábitos Diarios'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Completados: $completedHabitsCount',
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          return HabitListItem(
            habit: habits[index],
            onCheckboxChanged: (bool? value) {
              setState(() {
                habits[index].isCompleted = value ?? false;
              });
              _updateCompletedHabitsCount();
            },
          );
        },
      ),
    );
  }
}
