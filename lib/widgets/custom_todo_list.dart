import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
    required this.data,
    required this.todos,
  }) : super(key: key);
  final data;
  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: ((context, index) {
          return ListTile(
            leading: IconButton(
                onPressed: () {
                  data.updateTodo(todos[index]);
                },
                icon: Icon(todos[index].isCompleted
                    ? Icons.circle
                    : Icons.circle_outlined)),
            title: Text(
              todos[index].task,
              style: TextStyle(
                  decoration: todos[index].isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            trailing: IconButton(
                onPressed: () {
                  data.deleteTodo(todos[index]);
                },
                icon: const Icon(Icons.cancel_outlined)),
          );
        }),
        separatorBuilder: ((context, index) {
          return const Divider();
        }),
        itemCount: todos.length);
  }
}
