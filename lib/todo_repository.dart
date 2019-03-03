class TodoRepository {
  List<String> _todoList = [
    "Get some Milk",
    "Buy Bread",
    "Hire a Plumber",
    "Something else ..."
  ];

  List<String> getTodoList() {
    return _todoList;
  }

  void addTodo(String todo) {
    _todoList.add(todo);
  }
}
