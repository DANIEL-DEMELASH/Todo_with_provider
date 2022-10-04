import 'package:flutter/material.dart';
import 'package:todo/constants.dart';
import 'package:todo/models/todo_model.dart';

import '../resources/todo_data.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
    required this.data,
    required this.todos,
  }) : super(key: key);
  final TodoData data;
  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: ((context, index) {
          return ListTile(
            leading: IconButton(
                onPressed: () {
                  data.updateTodo(todos[index]);
                },
                icon: Icon(
                  todos[index].isCompleted
                      ? Icons.circle
                      : Icons.circle_outlined,
                  color: kBgColor,
                )),
            title: Text(
              todos[index].task,
              style: TextStyle(
                  decoration: todos[index].isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            trailing: IconButton(
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Warning'),
                      content: const Text('Are you sure ?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            data.deleteTodo(todos[index]);
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: Colors.black,
                )),
          );
        }),
        separatorBuilder: ((context, index) {
          return const Divider();
        }),
        itemCount: todos.length);
  }
}
