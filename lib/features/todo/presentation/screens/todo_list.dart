import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/scroll_listener.dart';
import '../../bloc/bloc/todo_bloc.dart';
import '../../models/todo_model.dart';
import '../widgets/todo_card.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final ScrollController _scrollController = ScrollController();
  int limit = 10;
  int skip = 0;
  int totalItems = 0;
  List<Todos> allTodos = [];

  @override
  void initState() {
    _scrollController.addListener(() {
      scrollListener(
          controller: _scrollController,
          onEnd: () {
            if (_scrollController.position.pixels ==
                    _scrollController.position.maxScrollExtent &&
                allTodos.length < totalItems &&
                context.read<TodoBloc>().state is! TodoLoadingMoreState) {
              skip += limit;
              context
                  .read<TodoBloc>()
                  .add(GetMoreTodos(limit: limit, skip: skip));
            }
          });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TodoBloc>().add(GetTodos());
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is TodoDeletedState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text(
                'Todo deleted successfully!',
              )),
            );
            context.read<TodoBloc>().add(GetTodos());
          }
        },
        builder: (context, state) {
          if (state is TodoLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoLoadedState) {
            limit = state.limit;
            skip = state.skip;
            totalItems = state.total;
            final todos = state.todos;
            allTodos.addAll(todos.todos!);
            return ListView.builder(
              controller: _scrollController,
              itemCount: allTodos.length,
              itemBuilder: (context, index) {
                final todo = allTodos[index];
                return TodoCard(
                  todo: todo,
                  isLastItem: index == allTodos.length - 1,
                );
              },
            );
          } else if (state is TodoErrorState) {
            return Center(child: Text(state.message));
          } else if (state is TodoLoadingMoreState) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: allTodos.length,
              itemBuilder: (context, index) {
                final todo = allTodos[index];
                return TodoCard(
                  todo: todo,
                  isLastItem: index == allTodos.length - 1,
                );
              },
            );
          } else {
            return const Center(child: Text('No todos available'));
          }
        },
      ),
    );
  }
}
