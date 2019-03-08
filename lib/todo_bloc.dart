import 'package:bloc/bloc.dart';
import 'package:todo_bloc_demo_flutter/_todo.dart';
import 'package:todo_bloc_demo_flutter/todo_add_event.dart';
import 'package:todo_bloc_demo_flutter/todo_repository.dart';
import 'package:todo_bloc_demo_flutter/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository = TodoRepository();

  @override
  TodoState get initialState {
    final _todoList = todoRepository.getTodoList();

    // if there are no todo, show empty todos
    if (_todoList.length == 0) {
      return TodoEmpty();
    }

    // show list of todos
    return TodoLoaded(todos: _todoList);
  }

  @override
  Stream<TodoState> mapEventToState(
    TodoState currentState,
    TodoEvent event,
  ) async* {
    if (event is TodoFetch) {
      final _todoList = todoRepository.getTodoList();

      // if there are no todo, show empty todos
      if (_todoList.length == 0)
        yield TodoEmpty();
      else
        yield TodoLoaded(todos: _todoList);
    } else if (event is TodoAdd) {
      final List<TodoItem> _todoList = List.from(todoRepository.getTodoList())
        ..add(event.todo);
      yield TodoLoaded(todos: _todoList);
      todoRepository.addTodo(event.todo);
    } else {
      yield TodoEmpty();
    }
  }
}
