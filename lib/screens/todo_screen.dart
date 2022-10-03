import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:todo/constants.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _screens = [
    placeholderList(),
    placeholderList(),
    placeholderList(),
  ];
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
        body: _screens[_selectedIndex]);
  }
}

Widget placeholderList() {
  return ListView.separated(
      itemBuilder: (((context, index) {
        return ListTile(
          leading: IconButton(
              onPressed: () {
                //TODO: change task state method
              },
              icon: const Icon(Icons.circle_outlined)),
          title: const Text('Task one'),
          trailing: IconButton(
              onPressed: () {
                //TODO: delete a task method
              },
              icon: const Icon(Icons.cancel_outlined)),
        );
      })),
      separatorBuilder: ((context, index) {
        return const Divider();
      }),
      itemCount: 15);
}
