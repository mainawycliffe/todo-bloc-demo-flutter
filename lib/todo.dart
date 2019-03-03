import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_demo_flutter/todo_add_event.dart';
import 'package:todo_bloc_demo_flutter/todo_bloc.dart';
import 'package:todo_bloc_demo_flutter/todo_state.dart';

class Todo extends StatefulWidget {
  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  TodoBloc _todoBloc;

  @override
  void initState() {
    super.initState();
    _todoBloc = TodoBloc();
  }

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bloc Todo Demo',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _todoBloc.dispatch(TodoAdd(todo: DateTime.now().toString()));
              // _todoBloc.dispatch(TodoFetch());
            },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder(
            bloc: _todoBloc,
            builder: (BuildContext c, TodoState todoState) {
              if (todoState is TodoEmpty) {
                return Text(
                  "You have no Todo!",
                );
              }

              if (todoState is TodoLoaded) {
                List<String> todos = todoState.todos;

                List<Widget> widgets = todos
                    .map(
                      (name) => new ListTile(
                            title: Text(name),
                          ),
                    )
                    .toList();

                return ListView(
                  children: widgets,
                );
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _todoBloc.dispose();
    super.dispose();
  }
}
