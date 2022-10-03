import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:todo/constants.dart';
import 'package:todo/resources/todo_data.dart';

class TodoScreen extends StatefulWidget {
  static final List<Widget> _screens = [
    placeholderList(),
    placeholderList3(),
    placeholderList2(),
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
            //TODO: add new task method
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
          actions: [
            IconButton(
                onPressed: () {
                  //TODO: change theme method
                },
                icon: const Icon(Icons.sunny))
          ],
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

Widget placeholderList() {
  return Consumer<TodoData>(builder: ((context, data, child) {
    return ListView.separated(
        itemBuilder: ((context, index) {
          return ListTile(
            leading: IconButton(
                onPressed: () {
                  data.updateTodo(data.todos[index]);
                },
                icon: Icon(data.todos[index].isCompleted
                    ? Icons.circle
                    : Icons.circle_outlined)),
            title: Text(
              data.todos[index].task,
              style: TextStyle(
                  decoration: data.todos[index].isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            trailing: IconButton(
                onPressed: () {
                  data.deleteTodo(data.todos[index]);
                },
                icon: const Icon(Icons.cancel_outlined)),
          );
        }),
        separatorBuilder: ((context, index) {
          return const Divider();
        }),
        itemCount: data.count);
  }));
}

Widget placeholderList2() {
  return Consumer<TodoData>(builder: ((context, data, child) {
    return ListView.separated(
        itemBuilder: ((context, index) {
          return ListTile(
            leading: IconButton(
                onPressed: () {
                  data.updateTodo(data.completedTodos[index]);
                },
                icon: Icon(data.completedTodos[index].isCompleted
                    ? Icons.circle
                    : Icons.circle_outlined)),
            title: Text(
              data.completedTodos[index].task,
              style: TextStyle(
                  decoration: data.completedTodos[index].isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            trailing: IconButton(
                onPressed: () {
                  data.deleteTodo(data.completedTodos[index]);
                },
                icon: const Icon(Icons.cancel_outlined)),
          );
        }),
        separatorBuilder: ((context, index) {
          return const Divider();
        }),
        itemCount: data.completedTodos.length);
  }));
}

Widget placeholderList3() {
  return Consumer<TodoData>(builder: ((context, data, child) {
    return ListView.separated(
        itemBuilder: ((context, index) {
          return ListTile(
            leading: IconButton(
                onPressed: () {
                  data.updateTodo(data.inCompletedTodos[index]);
                },
                icon: Icon(data.inCompletedTodos[index].isCompleted
                    ? Icons.circle
                    : Icons.circle_outlined)),
            title: Text(
              data.inCompletedTodos[index].task,
              style: TextStyle(
                  decoration: data.inCompletedTodos[index].isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            trailing: IconButton(
                onPressed: () {
                  data.deleteTodo(data.inCompletedTodos[index]);
                },
                icon: const Icon(Icons.cancel_outlined)),
          );
        }),
        separatorBuilder: ((context, index) {
          return const Divider();
        }),
        itemCount: data.inCompletedTodos.length);
  }));
}
