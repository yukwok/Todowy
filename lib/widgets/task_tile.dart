import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isDone;
  final String name;
  final Function toggleCallback;
  final Function longPressedCallback;

  TaskTile(
      {this.name = 'dummy', this.isDone, this.toggleCallback, this.longPressedCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onLongPress: longPressedCallback,
        title: Text(
          name,
          style:
              TextStyle(decoration: isDone ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          value: isDone,
          onChanged: toggleCallback,
        ),
      ),
    );
  }
}
