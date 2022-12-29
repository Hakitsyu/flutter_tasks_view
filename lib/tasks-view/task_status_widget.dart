import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tasks_view/task/task.dart';
import 'package:flutter_tasks_view/tasks-view/tasks_view_widget.dart';

class TaskStatusWidget extends StatelessWidget {
  final TaskResultStatus? status;

  TaskStatusWidget(this.status);

  @override
  Widget build(BuildContext context) {
    return status == null 
      ? new CircularProgressIndicator(strokeWidth: 1) 
      : Icon(status == TaskResultStatus.resolved ? Icons.check : Icons.close);
  }
}