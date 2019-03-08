import 'package:todo_bloc_demo_flutter/_todo.dart';

class TodoRepository {
  List<TodoItem> _todoList = [];

  List<TodoItem> getTodoList() {
    return _todoList;
  }

  void addTodo(TodoItem todo) {
    _todoList.add(todo);
  }
}
