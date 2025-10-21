part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

//initial state
final class TodoBlocInitial extends TodoState {}

//todo listing states
final class TodoLoadingState extends TodoState {}

final class TodoLoadingMoreState extends TodoState {}

final class TodoLoadedState extends TodoState {
  final TodoDataModel todos;
  final int total;
  final int limit;
  final int skip;
  const TodoLoadedState(this.todos, this.total, this.limit, this.skip);
}

final class TodoErrorState extends TodoState {
  final String message;
  const TodoErrorState(this.message);
}

//add states
final class TodoAddingState extends TodoState {}

final class TodoAddedState extends TodoState {}

final class TodoAddErrorState extends TodoState {
  final String message;
  const TodoAddErrorState(this.message);
}

//delete states
final class TodoDeletingState extends TodoState {}

final class TodoDeletedState extends TodoState {}

final class TodoDeleteErrorState extends TodoState {
  final String message;
  const TodoDeleteErrorState(this.message);
}
