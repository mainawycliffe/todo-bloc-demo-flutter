import 'package:bloc/bloc.dart';
import 'package:todo_bloc_demo_flutter/todo_add_event.dart';
import 'package:todo_bloc_demo_flutter/todo_repository.dart';
import 'package:todo_bloc_demo_flutter/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository = TodoRepository();

  @override
  TodoState get initialState {
    final List<String> _todoList = todoRepository.getTodoList();
    return TodoLoaded(todos: _todoList);
  }

  @override
  Stream<TodoState> mapEventToState(
    TodoState currentState,
    TodoEvent event,
  ) async* {
    if (event is TodoFetch) {
      // add todo
      // yield TodoAdd(todo: event.todo);
      final List<String> _todoList = todoRepository.getTodoList();
      yield TodoLoaded(todos: _todoList);
    } else if (event is TodoAdd) {
      todoRepository.addTodo(event.todo);
      final List<String> _todoList = todoRepository.getTodoList();
      yield TodoEmpty();
      yield TodoLoaded(todos: _todoList);
    } else {
      yield TodoEmpty();
    }
  }
}
