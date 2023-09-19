import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/todo_provider.dart';
import '../widgets/todo_tile.dart';

class AllTodoScreen extends StatefulWidget {
  const AllTodoScreen({super.key});

  @override
  State<AllTodoScreen> createState() => AllTodoScreenState();
}

class AllTodoScreenState extends State<AllTodoScreen> {
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
                    itemCount: todoProvider.getCount(),
                    itemBuilder: (context, index) {
                      return TodoTile(todo: todoProvider.todos[index]);
                    }));
      });
  }
}