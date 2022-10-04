import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/constants.dart';
import 'package:todo/resources/todo_data.dart';

TextEditingController taskContoller = TextEditingController();

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: ((context) => TodoData()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            const Text(
              'Add Todo',
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: kBgColor, fontSize: 24.0),
            ),
            TextField(
              autofocus: true,
              controller: taskContoller,
              decoration: const InputDecoration(hintText: 'Todo Title'),
            ),
            MaterialButton(
              onPressed: () {
                Provider.of<TodoData>(context, listen: false)
                    .addNewTodo(taskContoller.text);
                taskContoller.text = '';
                Navigator.pop(context);
              },
              child: const Text(
                'Add Todo',
                // style: TextStyle(backgroundColor: kBgColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
