class Task {
  String title;
  String description = '';
  bool completed = false;

  Task({required this.title, this.description = '', this.completed = false});

  void toggleCompleted() {
    completed = !completed;
  }
}
