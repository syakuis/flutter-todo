import 'package:flutter/material.dart';
import 'package:todo/models/Todo.dart';
import 'package:todo/widgets/todo_check.dart';
import 'package:todo/widgets/todo_remove.dart';

class TodoList extends StatefulWidget {
  final List<Todo> todos;
  final Function(int) remove;
  final Function(int, String?, bool?) update;

  const TodoList(
      {super.key,
      required this.todos,
      required this.remove,
      required this.update});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  void updateCompleted(int index, bool completed) {
    widget.update(index, null, completed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: widget.todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Row(
                  children: [
                    TodoCompletion(
                        completed: widget.todos[index].completed,
                        update: (completed) =>
                            updateCompleted(index, completed)),
                    const SizedBox(width: 8),
                    Text(widget.todos[index].title,
                        style: widget.todos[index].completed
                            ? const TextStyle(
                                decoration: TextDecoration.lineThrough)
                            : null)
                  ],
                ),
                trailing: TodoRemove(index: index, remove: widget.remove),
              );
            }));
  }
}
