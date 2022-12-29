import 'package:uuid/uuid.dart';

typedef FutureFunction<T1, R> = Future<R> Function(T1 parameter);

typedef TaskFunction = FutureFunction<TaskResolver, TaskResult>;

class Task {
  late String _uuid;
  final TaskFunction _func;

  Task(this._func) {
    _uuid = const Uuid().v1();
  }

  Future<TaskResult> run() async {
    return await _func(TaskResolver());
  }

  String get uuid {
    return _uuid;
  }
}

enum TaskResultStatus {
  resolved,
  rejected
}

class TaskResult {
  TaskResultStatus status;
  int? time;


  TaskResult({
    required this.status,
    this.time
  });
}

class TaskResolver {
  final int _initialMilliseconds = DateTime.now().millisecondsSinceEpoch;

  TaskResult resolve() {
    return TaskResult(status: TaskResultStatus.resolved, time: _calculateTimeFromNow());    
  }

  TaskResult reject() {
    return TaskResult(status: TaskResultStatus.rejected, time: _calculateTimeFromNow());
  }

  int _calculateTimeFromNow() {
    final int currentMilliseconds = DateTime.now().millisecondsSinceEpoch;
    return currentMilliseconds - _initialMilliseconds;
  }
}

class DetailedTask extends Task {
  final String description;

  DetailedTask(this.description, super.func);
}