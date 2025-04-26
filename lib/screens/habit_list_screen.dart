import 'package:flutter/material.dart';
import '../widgets/habit_list_item.dart';
import '../models/habit.dart';
import '../widgets/add_habit_dialog.dart'; // Importa el diálogo

class HabitListScreen extends StatefulWidget {
  const HabitListScreen({Key? key}) : super(key: key);

  @override
  _HabitListScreenState createState() => _HabitListScreenState();
}

class _HabitListScreenState extends State<HabitListScreen> {
  List<Habit> habits = [
    Habit(title: 'Tomar medicina', reminderTime: DateTime.now().add(const Duration(hours: 8, minutes: 0))),
    Habit(title: 'Medir glucosa'),
    Habit(title: 'Caminar 30 minutos', isCompleted: true),
  ];

  int completedHabitsCount = 0;

  @override
  void initState() {
    super.initState();
    _updateCompletedHabitsCount();
  }

  void _updateCompletedHabitsCount() {
    setState(() {
      completedHabitsCount = habits.where((habit) => habit.isCompleted).length;
    });
  }

  void _addHabit(Habit newHabit) {
    setState(() {
      habits.add(newHabit);
      _updateCompletedHabitsCount();
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showDialog<Habit>(
            context: context,
            builder: (BuildContext context) {
              return const AddHabitDialog();
            },
          );
          if (result != null) {
            _addHabit(result);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
