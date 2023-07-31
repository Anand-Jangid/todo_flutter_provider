// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime timeStamp;
  
  const Todo({
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.timeStamp,
  });
}
