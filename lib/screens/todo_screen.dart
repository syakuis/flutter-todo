import 'package:flutter/material.dart';
import 'package:todo/models/Todo.dart';
import 'package:todo/widgets/todo_input.dart';
import 'package:todo/widgets/todo_list.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final List<Todo> todos =
      List<Todo>.generate(10, (index) => Todo(title: 'Item $index'));

  void addTodo(String title) {
    setState(() {
      todos.insert(0, Todo(title: title));
    });
  }

  void removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void updateTodo(int index, String? title, bool? completed) {
    Todo todo = todos[index];

    if (title != null && title.isNotEmpty) {
      todo.title = title;
    }

    if (completed != null) {
      todo.completed = completed;
      todo.completedAt = completed ? DateTime.now() : null;
    }

    setState(() {
      todos[index] = todo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          color: Colors.grey[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: TodoList(todos: todos, remove: removeTodo, update: updateTodo)),
              Expanded(child: TodoInput(add: addTodo)),
            ],
          )),
    );
  }
}
