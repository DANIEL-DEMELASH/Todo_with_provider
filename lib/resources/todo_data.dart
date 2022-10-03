import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';

class TodoData extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(task: 'Task one'),
    Todo(task: 'Task two'),
    Todo(task: 'Task three')
  ];

  int get count {
    return _todos.length;
  }

  UnmodifiableListView<Todo> get todos {
    return UnmodifiableListView(_todos);
  }

  UnmodifiableListView<Todo> get completedTodos {
    List<Todo> x = [];
    for (var i in _todos) {
      if (i.isCompleted) {
        x.add(i);
      }
    }
    return UnmodifiableListView(x);
  }

  UnmodifiableListView<Todo> get inCompletedTodos {
    List<Todo> x = [];
    for (var i in _todos) {
      if (!i.isCompleted) {
        x.add(i);
      }
    }
    return UnmodifiableListView(x);
  }

  addNewTodo(String taskTitle) {
    _todos.add(Todo(task: taskTitle));
    notifyListeners();
  }

  updateTodo(Todo todo) {
    todo.taskCompleted();
    notifyListeners();
  }

  deleteTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}
