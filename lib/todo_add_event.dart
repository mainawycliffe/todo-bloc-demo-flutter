import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  TodoEvent([List props = const []]) : super(props);
}

class TodoAdd extends TodoEvent {
  final String todo;

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
