import 'package:flutter/material.dart';
import 'screens/habit_list_screen.dart'; // Importa la HabitListScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Diabetic App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HabitListScreen(), // Usa la HabitListScreen como home
    );
  }
}
