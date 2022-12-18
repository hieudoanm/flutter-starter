import 'package:flutter/material.dart';

import 'package:tasks/tabs/all_tasks.dart';
import 'package:tasks/tabs/completed_tasks.dart';
import 'package:tasks/tabs/incompleted_tasks.dart';

import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddTaskScreen(),
                ),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: controller,
          tabs: const <Widget>[
            Tab(text: 'All'),
            Tab(text: 'Incomplete'),
            Tab(text: 'Complete'),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          const AllTasksTab(),
          IncompleteTasksTab(),
          const CompletedTasksTab(),
        ],
      ),
    );
  }
}
