import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/constants.dart';
import 'package:todo/resources/todo_data.dart';

TextEditingController taskContoller = TextEditingController();

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
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
            Form(
              key: formKey,
              child: TextFormField(
                autofocus: true,
                controller: taskContoller,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(hintText: 'Todo Title'),
                validator: ((value) {
                  if (value == null || value.isEmpty) {
                    return 'you must enter the task title';
                  }
                  if (value.length < 3) {
                    return 'task characters must be at least 3';
                  }
                  return null;
                }),
              ),
            ),
            MaterialButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Provider.of<TodoData>(context, listen: false)
                      .addNewTodo(taskContoller.text);
                  taskContoller.text = '';
                  Navigator.pop(context);
                }
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
