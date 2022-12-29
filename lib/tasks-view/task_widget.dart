import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tasks_view/task/task.dart';
import 'package:flutter_tasks_view/tasks-view/task_status_widget.dart';

class TaskWidget extends StatelessWidget {
  final DetailedTask task;
  final TaskResultStatus? status;

  TaskWidget(this.task, this.status);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(task.description)
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight, 
            child: TaskStatusWidget(status)
          )
        )
      ],
    );
  }

}