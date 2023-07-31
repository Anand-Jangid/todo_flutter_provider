import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_provider/Model/todo_provider.dart';
import 'package:todo_flutter_provider/view/screens/todo_detail.dart';

import '../../Model/todo.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;
  const TodoTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Dismissible(
        key: Key(todo.title),
        direction: DismissDirection.horizontal,
        onDismissed: (direction) {
          Provider.of<TodoProvider>(context, listen: false).deleteTodo(todo);
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Todo removed")));
        },
        child: Card(
          child: ListTile(
            leading: const Icon(Icons.task),
            title: Text(todo.title),
            subtitle: Text(todo.description),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TodoDetailScreen(
                        todo: todo,
                      )));
            },
            trailing: IconButton(
              icon: (todo.isCompleted)
                  ? const Icon(Icons.check_box)
                  : const Icon(Icons.check_box_outline_blank),
              onPressed: () {
                Provider.of<TodoProvider>(context, listen: false).updateTodo(
                    Todo(
                        title: todo.title,
                        description: todo.description,
                        isCompleted: !todo.isCompleted,
                        timeStamp: todo.timeStamp));
              },
            ),
          ),
        ),
      ),
    );
  }
}
