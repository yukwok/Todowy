import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todowy/models/task.dart';

class FireStoreService {
  Firestore _db = Firestore.instance;

  Stream<List<Task>> getTasks() {
    return _db
        .collection('tasks')
        .orderBy('time', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.documents
            .map((document) => new Task.fromJson(document.data))
            .toList());
  }

  void addData() {}
}
