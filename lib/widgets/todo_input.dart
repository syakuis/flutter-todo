import 'package:flutter/material.dart';

class TodoInput extends StatefulWidget {
  final Function(String) add;

  const TodoInput({super.key, required this.add});

  @override
  State<TodoInput> createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  final todoController = TextEditingController();

  @override
  void dispose() {
    todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            child: TextField(
                controller: todoController,
                decoration: const InputDecoration(
                  hintText: 'Enter your text...',
                  border: OutlineInputBorder(),
                ))),
        ElevatedButton(
          onPressed: () {
            if (todoController.text.isNotEmpty) {
              widget.add(todoController.text);
              todoController.clear();
            }
          },
          child: const Text('Add Todo'),
        )
      ],
    ));
  }
}
