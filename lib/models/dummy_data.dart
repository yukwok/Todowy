import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:todowy/models/task.dart';
import 'dart:collection';

class DummyData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Dummy Home Work'),
    Task(name: 'Dummy Pccw'),
  ];

  List<int> integers = [1974, 1997, 2003];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get tasksCount {
    return _tasks.length;
  }

  void getTasks() async {
    Firestore _db = Firestore.instance;

    var response =
    await _db.collection('tasks').snapshots()
        .map((snapshot) => {});

    print('$response');
  }

  void addTask(String newTaskTitle) {
    print('in class, newTaskTitle=$newTaskTitle');
    Task task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
