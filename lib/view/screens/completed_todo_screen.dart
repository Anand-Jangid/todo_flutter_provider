import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Model/todo_provider.dart';
import '../widgets/todo_tile.dart';

class CompletedTodoScreen extends StatefulWidget {
  const CompletedTodoScreen({super.key});

  @override
  State<CompletedTodoScreen> createState() => _CompletedTodoScreenState();
}

class _CompletedTodoScreenState extends State<CompletedTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(builder: (context, todoProvider, child) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: (todoProvider.getCount() == 0)
                ? const Center(
                    child: Text(
                    "No Todos",
                    style: TextStyle(fontSize: 30),
                  ))
                : ListView.builder(
                    itemCount: todoProvider.getCompletedTodoList().length,
                    itemBuilder: (context, index) {
                      return TodoTile(todo: todoProvider.getCompletedTodoList()[index]);
                    }));
      });
  }
}