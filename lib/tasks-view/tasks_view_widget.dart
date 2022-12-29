import 'package:flutter/material.dart';
import 'package:flutter_tasks_view/tasks-view/task_widget.dart';

import '../task/task.dart';

class TasksViewDialog extends StatefulWidget {
  final List<DetailedTask> _tasks;

  TasksViewDialog(this._tasks);
  
  @override
  State<StatefulWidget> createState() => _TasksViewDialog(_tasks);
}

class _TasksViewDialog extends State<TasksViewDialog> {
  static const _title = 'Tasks View Dialog';

  List<DetailedTask> _tasks;
  late Map<DetailedTask, TaskResultStatus?> _memory;

  _TasksViewDialog(this._tasks);

  @override
  void initState() {
    _loadMemoryFromTasks();
    _runAll();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text(_title),
      children: _tasks.map((task) => SimpleDialogOption(
        child: TaskWidget(task, _memory[task]),
      )).toList(),
    );
  }

  _runAll() {
    _tasks.forEach((task) => task.run().then((result) => {
      if (mounted)
        this.setState(() => _update(task, result))
    }));
  }

  _update(DetailedTask task, TaskResult result) {
    _memory[task] = result.status;
  }

  _loadMemoryFromTasks() {
    _memory = Map.fromIterable(_tasks, key: (task) => task, value: (task) => null);
  }
}