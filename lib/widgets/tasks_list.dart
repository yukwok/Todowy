import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todowy/models/task.dart';
import 'package:todowy/models/task_data.dart';

import 'package:todowy/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            Task task = taskData.tasks[index];
            return Container(
              child: TaskTile(
                name: task.name,
                isDone: task.isDone,
                toggleCallback: (checkboxState) {
                  taskData.updateTask(task);
                },
                longPressedCallback: () {
                  taskData.deleteTask(task);
                },
              ),
            );
          },
          itemCount: taskData.tasksCount,
        );
      },
    );
  }
}
