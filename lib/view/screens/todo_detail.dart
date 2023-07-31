// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_provider/Model/todo_provider.dart';
import '../../Model/todo.dart';

class TodoDetailScreen extends StatefulWidget {
  final Todo? todo;
  const TodoDetailScreen({
    Key? key,
    this.todo,
  }) : super(key: key);

  @override
  _TodoDetailScreenState createState() => _TodoDetailScreenState();
}

class _TodoDetailScreenState extends State<TodoDetailScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late bool _isCompleted;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.todo?.title);
    _descriptionController =
        TextEditingController(text: widget.todo?.description);
    _isCompleted = widget.todo?.isCompleted ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                  labelText: 'Title', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _descriptionController,
              maxLines: 5, // Set the maximum lines to 5
              decoration: const InputDecoration(
                  labelText: 'Description', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16.0),
            CheckboxListTile(
              title: const Text('Is Completed'),
              value: _isCompleted,
              onChanged: (value) {
                setState(() {
                  _isCompleted = value ?? false;
                });
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                (widget.todo == null)
                    ? Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Todo todo = Todo(
                                title: _titleController.text,
                                description: _descriptionController.text,
                                isCompleted: _isCompleted,
                                timeStamp: DateTime.timestamp());

                            Provider.of<TodoProvider>(context, listen: false)
                                .addTodo(todo);

                            ScaffoldMessenger.of(context)
                                .removeCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("TODO ADDED")));
                            Navigator.pop(context);
                          },
                          child: const Text('Save'),
                        ),
                      )
                    : Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Todo todo = Todo(
                                title: _titleController.text,
                                description: _descriptionController.text,
                                isCompleted: _isCompleted,
                                timeStamp: widget.todo?.timeStamp ??
                                    DateTime.timestamp());
                            Provider.of<TodoProvider>(context, listen: false)
                                .updateTodo(todo);
                            ScaffoldMessenger.of(context)
                                .removeCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("TODO UPDATED")));
                            Navigator.pop(context);
                          },
                          child: const Text('Update'),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
