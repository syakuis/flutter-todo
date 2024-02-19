import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoTitle extends StatefulWidget {
  final String title;
  final bool completed;
  final DateTime? expiredAt;

  const TodoTitle(
      {super.key,
      required this.title,
      required this.completed,
      this.expiredAt});

  @override
  State<TodoTitle> createState() => _TodoTitleState();
}

class _TodoTitleState extends State<TodoTitle> {
  @override
  Widget build(BuildContext context) {
    final expiredAt = widget.expiredAt != null
        ? DateFormat('yyyy-MM-dd').format(widget.expiredAt!)
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                decoration:
                    widget.completed ? TextDecoration.lineThrough : null)),
        if (expiredAt != null)
          Text(expiredAt, style: Theme.of(context).textTheme.labelSmall)
      ],
    );
  }
}
