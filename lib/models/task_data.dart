import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:todowy/models/task.dart';
import 'dart:collection';
import 'package:shared_preferences/shared_preferences.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Homework(default)'),
    Task(name: 'pccw(default)'),
    Task(name: '123(default)'),
    Task(name: '456(default)'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get tasksCount {
    return _tasks.length;
  }

  void getTasks() async {
    Firestore _db = Firestore.instance;

    var response =
        await _db.collection('tasks').snapshots().map((snapshot) => {});

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

  void updateTask1(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  //TODO: below is to implement the initial values.
  savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }
  loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }
}
