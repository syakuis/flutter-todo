class Todo {
  String title;
  bool completed;
  final DateTime createdAt = DateTime.now();
  DateTime? completedAt;
  DateTime? expiredAt;

  Todo({required this.title, this.completed = false});
}
