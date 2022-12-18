import 'package:flutter/material.dart';

import 'package:tasks/models/task.dart';
import 'package:tasks/widgets/task_list_item.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getChildrenTasks(),
    );
  }

  List<Widget> getChildrenTasks() {
    return tasks.map((task) => TaskListItem(task: task)).toList();
  }
}
