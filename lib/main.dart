import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_bloc_demo_flutter/add_todo.dart';
import 'package:todo_bloc_demo_flutter/todo.dart';
import 'package:todo_bloc_demo_flutter/todo_add_event.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _routes(),
      theme: myCustomTheme(),
      home: Todo(),
    );
  }

  Map<String, WidgetBuilder> _routes() {
    return {'/add': (context) => AddTodo()};
  }

  ThemeData myCustomTheme() {
    final ThemeData _appTheme = ThemeData.light();

    return _appTheme.copyWith(
      primaryColor: Colors.orange,
      accentColor: Colors.blue,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(
            const Radius.circular(15),
          ),
        ),
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
