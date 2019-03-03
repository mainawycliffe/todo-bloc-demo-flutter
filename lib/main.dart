import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_bloc_demo_flutter/todo.dart';
import 'package:todo_bloc_demo_flutter/todo_add_event.dart';
import 'package:todo_bloc_demo_flutter/todo_repository.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Todo(),
    );
  }
}
