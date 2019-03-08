import 'package:meta/meta.dart';

class TodoItem {
  final String todo;
  final String description;
  final bool done;

  TodoItem({@required this.todo, @required this.description, this.done = false})
      : assert(todo != null),
        super();

  @override
  String toString() {
    return todo;
  }
}
