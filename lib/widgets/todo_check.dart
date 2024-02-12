import 'package:flutter/material.dart';

class TodoCompletion extends StatefulWidget {
  final bool completed;
  final Function(bool) update;
  const TodoCompletion({super.key, required this.completed, required this.update});

  @override
  State<TodoCompletion> createState() => _TodoCompletionState();
}

class _TodoCompletionState extends State<TodoCompletion> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(value: widget.completed, onChanged: (value) {
      widget.update(value!);
    });
  }
}
