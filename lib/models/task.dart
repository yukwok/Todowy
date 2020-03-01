import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String name;
  final Timestamp time;
  bool isDone;

  Task({this.name, this.isDone = false, this.time});

  Task.fromJson(Map<String, dynamic> parsedJSON)
      : name = parsedJSON['title'],
        time = parsedJSON['time'],
        isDone = parsedJSON['done'];

  void toggleDone() {
    isDone = !isDone;
  }
}
