import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc_demo_flutter/_todo.dart';

abstract class TodoEvent extends Equatable {
  TodoEvent([List props = const []]) : super(props);
}

class TodoAdd extends TodoEvent {
  final TodoItem todo;
  // final String description;

  TodoAdd({@required this.todo})
      : assert(todo != null),
        super([todo]);
}

class TodoFetch extends TodoEvent {
  TodoFetch() : super();
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  onTransition(Transition transition) {
    print(transition);
  }
}
