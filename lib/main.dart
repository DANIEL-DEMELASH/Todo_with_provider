import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/resources/todo_data.dart';
import 'package:todo/screens/todo_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Quicksand'),
      home: ChangeNotifierProvider(
          create: ((context) => TodoData()), child: TodoScreen()),
    );
  }
}
