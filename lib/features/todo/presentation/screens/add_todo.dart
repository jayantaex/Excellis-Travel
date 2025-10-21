import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/todo_bloc.dart';

class AddTodo extends StatefulWidget {
  final int userId;
  const AddTodo({super.key, required this.userId});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  String _selectedStatus = 'pending';
  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  Radio.adaptive(
                      value: 'completed',
                      groupValue: _selectedStatus,
                      onChanged: (value) {
                        setState(() {
                          _selectedStatus = value!;
                        });
                      }),
                  const Text('Completed'),
                  const SizedBox(width: 20),
                  Radio.adaptive(
                      value: 'pending',
                      groupValue: _selectedStatus,
                      onChanged: (value) {
                        setState(() {
                          _selectedStatus = value!;
                        });
                      }),
                  const Text('Pending'),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
        child: BlocConsumer<TodoBloc, TodoState>(
          listener: (context, state) {
            log('TodoState changed: $state');
            if (state is TodoAddErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is TodoAddedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Todo added successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pop(context, true);
            }
          },
          builder: (context, state) {
            return ElevatedButton(
              onPressed: state is TodoAddingState
                  ? null
                  : () {
                      if (_titleController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Title cannot be empty'),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }
                      // Handle save action
                      context.read<TodoBloc>().add(AddTodos(
                            status:
                                _selectedStatus == 'completed' ? true : false,
                            title: _titleController.text,
                            userId: widget.userId,
                          ));
                    },
              child: state is TodoAddingState
                  ? const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : const Text('Save'),
            );
          },
        ),
      ),
    );
  }
}
