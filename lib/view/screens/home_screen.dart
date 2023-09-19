import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_provider/Model/todo_provider.dart';
import 'package:todo_flutter_provider/view/screens/all_todo_screen.dart';
import 'package:todo_flutter_provider/view/screens/completed_todo_screen.dart';
import 'package:todo_flutter_provider/view/screens/todo_detail.dart';
import 'package:todo_flutter_provider/view/widgets/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    AllTodoScreen(),
    CompletedTodoScreen(),
    Text('Profile Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO"),
        actions: [
          Consumer<TodoProvider>(builder: (context, todoProvider, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                todoProvider.getCount().toString(),
                style: const TextStyle(fontSize: 25),
              ),
            );
          }),
        ],
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline),
            label: 'Completed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const TodoDetailScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
