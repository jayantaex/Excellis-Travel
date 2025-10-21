part of 'todo_bloc.dart';

sealed class TodoBlocEvent extends Equatable {
  const TodoBlocEvent();

  @override
  List<Object> get props => [];
}

class GetTodos extends TodoBlocEvent {}

class GetMoreTodos extends TodoBlocEvent {
  final int limit;
  final int skip;
  const GetMoreTodos({required this.limit, required this.skip});
}

class AddTodos extends TodoBlocEvent {
  final String title;
  final bool status;
  final int userId;
  const AddTodos(
      {required this.userId, required this.title, required this.status});
}

class DeleteTodos extends TodoBlocEvent {
  final int id;
  const DeleteTodos({required this.id});
}
