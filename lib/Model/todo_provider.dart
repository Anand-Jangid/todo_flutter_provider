import 'package:flutter/material.dart';
import 'package:todo_flutter_provider/Model/todo.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
        title: "Hello",
        description: "world",
        isCompleted: true,
        timeStamp: DateTime.timestamp()),
    Todo(
        title: "ANand",
        description: "Jangid",
        isCompleted: true,
        timeStamp: DateTime.timestamp()),
    Todo(
        title: "Aman",
        description: "Kansal",
        isCompleted: true,
        timeStamp: DateTime.timestamp()),
    Todo(
        title: "Amit",
        description: "Chauhan",
        isCompleted: true,
        timeStamp: DateTime.timestamp()),
    Todo(
        title: "Rahul",
        description: "Singh",
        isCompleted: true,
        timeStamp: DateTime.timestamp()),
  ];

  List<Todo> get todos => _todos;

  //add new todo in the list
  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  //update todo
  void updateTodo(Todo todo) {
    int i = _indexOfTodo(todo);
    if (i == -1) {
      //TODO :throw exception not found todo in _todos
    }
    _todos[i] = todo;
    notifyListeners();
  }

  //delete todo
  void deleteTodo(Todo todo) {
    int i = _indexOfTodo(todo);
    if (i == -1) {
      //TODO :throw exception not found todo in _todos
    }
    _todos.removeAt(i);
    notifyListeners();
  }

  int _indexOfTodo(Todo todo) {
    for (var i = 0; i < _todos.length; i++) {
      if (todo.timeStamp.isAtSameMomentAs(_todos[i].timeStamp)) return i;
    }
    return -1;
  }

  //get count of todos
  int getCount() => _todos.length;

  List<Todo> getCompletedTodoList () {
    return _todos.where((element) => element.isCompleted).toList();
  }
}
