import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_provider/Model/todo_provider.dart';
import 'package:todo_flutter_provider/view/screens/todo_detail.dart';
import 'package:todo_flutter_provider/view/widgets/todo_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TODO"),
        ),
        body: Consumer<TodoProvider>(
          builder: (context, todoProvider, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: todoProvider.todos.length,
                itemBuilder: (context, index) {
                  return TodoTile(todo: todoProvider.todos[index]);
                }));
          }),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const TodoDetailScreen()));
            },
            child: const Icon(Icons.add),
          ),
        );
  }
}
