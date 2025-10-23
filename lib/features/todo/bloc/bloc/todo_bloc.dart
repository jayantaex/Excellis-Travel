import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/todo_repository.dart';
import '../../models/todo_model.dart';

part 'todo_bloc_event.dart';
part 'todo_bloc_state.dart';

class TodoBloc extends Bloc<TodoBlocEvent, TodoState> {
  final TodoRepository repository;
  TodoBloc(this.repository) : super(TodoBlocInitial()) {
    on<TodoBlocEvent>((event, emit) async {
      switch (event) {
        case GetTodos():
          {
            try {
              emit(TodoLoadingState());
              //fetch todos from repository
              final res = await repository.fetchTodos(limit: 10);
              if (res.statusCode == 200) {
                emit(TodoLoadedState(res.data!, res.data!.total ?? 0,
                    res.data!.limit ?? 0, res.data!.skip ?? 0));
              } else {
                emit(const TodoErrorState("Failed to load todos"));
              }
            } catch (e) {
              emit(TodoErrorState(e.toString()));
            }
          }

          break;

        case AddTodos():
          {
            try {
              emit(TodoAddingState());
              Map<String, dynamic> eventData = {
                "todo": event.title,
                "completed": event.status,
                "userId": event.userId,
              };

              final res = await repository.addTodo(eventData);
              log(res.statusCode.toString());
              log(res.data.toString());
              if (res.statusCode == 201) {
                emit(TodoAddedState());
              } else {
                emit(const TodoAddErrorState("Failed to add todo"));
              }
            } catch (e) {
              emit(TodoAddErrorState(e.toString()));
            }
          }

        case DeleteTodos():
          {
            try {
              // emit(TodoDeletingState());
              // // final res = await repository.deleteTodo(event.id);
              // log(res.statusCode.toString());
              // if (res.statusCode == 200) {
              //   emit(TodoDeletedState());
              // } else {
              //   emit(const TodoDeleteErrorState("Failed to delete todo"));
              // }
            } catch (e) {
              emit(TodoDeleteErrorState(e.toString()));
            }
          }
          break;
        case GetMoreTodos():
          {
            try {
              emit(TodoLoadingMoreState());
              //fetch todos from repository
              final res = await repository.fetchTodos(
                  limit: event.limit, skip: event.skip);
              if (res.statusCode == 200) {
                emit(TodoLoadedState(res.data!, res.data!.total ?? 0,
                    res.data!.limit ?? 0, res.data!.skip ?? 0));
              } else {
                emit(const TodoErrorState("Failed to load todos"));
              }
            } catch (e) {
              emit(TodoErrorState(e.toString()));
            }
          }
        default:
      }
    });
  }
}
