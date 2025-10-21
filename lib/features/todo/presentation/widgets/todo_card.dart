import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/alert_dialouge.dart';
import '../../bloc/bloc/todo_bloc.dart';
import '../../models/todo_model.dart';

class TodoCard extends StatelessWidget {
  final Todos todo;
  final bool isLastItem;
  const TodoCard({super.key, required this.todo, required this.isLastItem});

  @override
  Widget build(BuildContext context) {
    return isLastItem
        ? Column(
            children: [
              TodoCardWidget(todo: todo),
              const SizedBox(height: 10),
              const SizedBox(
                height: 40,
                child: Center(child: CircularProgressIndicator.adaptive()),
              )
            ],
          )
        : TodoCardWidget(todo: todo);
  }
}

class TodoCardWidget extends StatelessWidget {
  final Todos todo;
  const TodoCardWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.transparent,
      selectedTileColor: Colors.transparent,
      leading: Text(todo.id.toString()),
      title: Text(todo.todo ?? 'No Title'),
      subtitle: Text(
        todo.completed ?? false ? 'Completed' : 'Not Completed',
        style: TextStyle(
            color: todo.completed ?? false ? Colors.green : Colors.grey,
            fontWeight: FontWeight.w300),
      ),
      trailing: IconButton(
          onPressed: () {
            showAlertDialog(
                context: context,
                message: 'Are you sure you want to delete this todo?',
                title: 'Confirm Delete',
                onOk: () {
                  context.read<TodoBloc>().add(DeleteTodos(id: todo.id ?? 0));
                  Navigator.of(context).pop();
                });
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          )),
    );
  }
}
