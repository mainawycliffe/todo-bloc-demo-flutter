import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc_demo_flutter/_todo.dart';

abstract class TodoState extends Equatable {
  TodoState([List props = const []]) : super(props);
}

class TodoEmpty extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoItem> todos;

  TodoLoaded({@required this.todos})
      : assert(todos != null),
        super([todos]);
}
