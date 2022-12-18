import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:tasks/models/task.dart';

class TasksModel extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(title: 'Finish the app'),
    Task(title: 'Write a blog post'),
    Task(title: 'Share with community'),
  ];

  UnmodifiableListView<Task> get allTasks => UnmodifiableListView(_tasks);
  UnmodifiableListView<Task> get incompleteTasks =>
      UnmodifiableListView(_tasks.where((task) => !task.completed));
  UnmodifiableListView<Task> get completedTasks =>
      UnmodifiableListView(_tasks.where((task) => task.completed));

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTask(Task task) {
    final taskIndex = _tasks.indexOf(task);
    _tasks[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
