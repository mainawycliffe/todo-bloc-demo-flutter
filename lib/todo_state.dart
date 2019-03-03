import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class TodoState extends Equatable {
  TodoState([List props = const []]) : super(props);
}

class TodoEmpty extends TodoState {}

class TodoLoaded extends TodoState {
  final List<String> todos;

  TodoLoaded({@required this.todos})
      : assert(todos != null),
        super([todos]);
}
