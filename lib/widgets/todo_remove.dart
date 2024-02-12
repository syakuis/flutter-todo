import 'package:flutter/material.dart';

class TodoRemove extends StatefulWidget {
  final int index;
  final Function(int) remove;

  const TodoRemove({super.key, required this.index, required this.remove});

  @override
  State<TodoRemove> createState() => _TodoRemoveState();
}

class _TodoRemoveState extends State<TodoRemove> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        widget.remove(widget.index);
      },
    );
  }
}
