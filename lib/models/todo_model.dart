class Todo {
  String task;
  bool isCompleted;

  Todo({required this.task, this.isCompleted = false});

  void taskCompleted() {
    isCompleted = !isCompleted;
  }
}
