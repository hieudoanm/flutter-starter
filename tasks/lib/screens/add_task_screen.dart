import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/providers/tasks_model.dart';
import 'package:tasks/models/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final taskTitleController = TextEditingController();
  bool completedStatus = false;

  @override
  void dispose() {
    taskTitleController.dispose();
    super.dispose();
  }

  void onAdd() {
    final String textVal = taskTitleController.text;
    final bool completed = completedStatus;
    if (textVal.isNotEmpty) {
      final Task task = Task(
        title: textVal,
        completed: completed,
      );
      Provider.of<TasksModel>(context, listen: false).addTask(task);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(controller: taskTitleController),
                  CheckboxListTile(
                    value: completedStatus,
                    onChanged: (checked) => setState(() {
                      completedStatus = checked!;
                    }),
                    title: const Text('Complete?'),
                  ),
                  ElevatedButton(
                    onPressed: onAdd,
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
