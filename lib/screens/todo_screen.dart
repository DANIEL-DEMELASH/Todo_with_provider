import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:todo/constants.dart';
import 'package:todo/widgets/add_todo.dart';
import 'package:todo/widgets/custom_todo_list.dart';

import '../resources/todo_data.dart';

class TodoScreen extends StatefulWidget {
  static final List<Widget> _screens = [
    Consumer<TodoData>(builder: ((context, data, child) {
      return TodoList(data: data, todos: data.todos);
    })),
    Consumer<TodoData>(builder: ((context, data, child) {
      return TodoList(
        data: data,
        todos: data.inCompletedTodos,
      );
    })),
    Consumer<TodoData>(builder: ((context, data, child) {
      return TodoList(
        data: data,
        todos: data.completedTodos,
      );
    })),
  ];

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) => const AddTaskScreen());
          },
          backgroundColor: kBgColor,
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: kBgColor,
          title: const Text(
            'To Do List',
            style: kTitleStyle,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(blurRadius: 20.0, color: Colors.black.withOpacity(.1))
          ]),
          child: SafeArea(
            child: GNav(
              tabs: const [
                GButton(
                  icon: Icons.note_outlined,
                  text: 'All Todos',
                  gap: 5.0,
                ),
                GButton(
                  icon: Icons.check,
                  text: 'Incomplete',
                  gap: 5.0,
                ),
                GButton(
                  icon: Icons.done_all,
                  text: 'Completed',
                  gap: 5.0,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: ((index) {
                setState(() {
                  _selectedIndex = index;
                });
              }),
            ),
          ),
        ),
        body: TodoScreen._screens[_selectedIndex]);
  }
}
