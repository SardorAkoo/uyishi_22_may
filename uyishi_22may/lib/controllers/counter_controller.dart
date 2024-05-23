import 'package:flutter/material.dart';
import 'package:uyishi_22may/models/counter.dart';


class TaskController extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title) {
    _tasks.add(Task(title: title));
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void toggleTaskStatus(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    notifyListeners();
  }

  int get completedTaskCount => _tasks.where((task) => task.isDone).length;
  int get uncompletedTaskCount => _tasks.where((task) => !task.isDone).length;
}
