import 'package:flutter/material.dart';

class AddHabitDialog extends StatefulWidget {
  const AddHabitDialog({Key? key}) : super(key: key);

  @override
  _AddHabitDialogState createState() => _AddHabitDialogState();
}

class _AddHabitDialogState extends State<AddHabitDialog> {
  final _titleController = TextEditingController();
  DateTime? _reminderTime;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Agregar Nuevo Hábito'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(hintText: 'Título del Hábito'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  setState(() {
                    _reminderTime = DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                      pickedTime.hour,
                      pickedTime.minute,
                    );
                  });
                }
              },
              child: Text(_reminderTime == null
                  ? 'Seleccionar Hora (Opcional)'
                  : 'Hora Seleccionada: ${TimeOfDay.fromDateTime(_reminderTime!).format(context)}'),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text('Guardar'),
          onPressed: () {
            if (_titleController.text.isNotEmpty) {
              Navigator.of(context).pop(Habit(
                title: _titleController.text,
                reminderTime: _reminderTime,
              ));
            }
          },
        ),
      ],
    );
  }
}
