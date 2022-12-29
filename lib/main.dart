import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tasks_view/task/task.dart';
import 'package:flutter_tasks_view/tasks-view/tasks_view_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const _title = 'Flutter Tasks View'; 
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyAppContent(),
    );
  }
}

class MyAppContent extends StatelessWidget {
  static const _text = 'Tasks View Dialog';
  late List<DetailedTask> _tasks;

  MyAppContent() {
    _createTaks();
  }

  _createTaks() {
    DetailedTask helloWorld = DetailedTask('Hello World', (resolver) async {
      await Future.delayed(const Duration(seconds: 4));
      return resolver.resolve();
    });

    DetailedTask fakeError = DetailedTask('Fake Error', (resolver) async {
      await Future.delayed(const Duration(seconds: 2));
      return resolver.reject();
    });

    DetailedTask tenSeconds = DetailedTask('Ten Seconds', (resolver) async {
      await Future.delayed(const Duration(seconds: 10));
      return resolver.resolve();
    });

    DetailedTask random = DetailedTask('Random', (resolver) async {
      await Future.delayed(const Duration(seconds: 2));
      return Random().nextInt(2) == 0 ? resolver.resolve() : resolver.reject();
    });

    _tasks = List.from([helloWorld, fakeError, tenSeconds, random]);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showDialog(context: context, builder: ((context) => TasksViewDialog(_tasks)));
        },
        child: const Text(_text),
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(color: Colors.white), 
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue
        )
      ),
    );
  }
}