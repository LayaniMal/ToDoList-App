import 'package:flutter/material.dart';
import 'package:to_do_list/UI/todo.dart';

void main() => runApp(ToDo());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do',
      home: ToDo()
    );
  }
}
