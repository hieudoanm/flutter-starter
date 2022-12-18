import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/providers/tasks_model.dart';
import 'package:tasks/widgets/task_list.dart';

class AllTasksTab extends StatelessWidget {
  const AllTasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<TasksModel>(
        builder: (context, tasks, child) => TaskList(
          tasks: tasks.allTasks,
        ),
      ),
    );
  }
}
