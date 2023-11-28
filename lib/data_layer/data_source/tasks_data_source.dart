import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:todo_test_app/data_layer/models/task_model/task_model.dart';

class TasksDataSource {
  final tasksDb = FirebaseFirestore.instance.collection('tasks');

  Future<List<TaskModel>> loadExistingTasks() async {
    QuerySnapshot tasks;
    List<TaskModel> existingTasks = [];
    try {
      tasks = await tasksDb.get();

      existingTasks = tasks.docs
          .map((doc) => TaskModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return existingTasks;
    } on FirebaseException catch (e) {
      throw e;
    }
  }

  Future<String> createTask(TaskModel task) async {
    try {
      DocumentReference docRef = await tasksDb.add(task.toJson());

      return docRef.id;
    } on FirebaseException catch (e) {
      throw e;
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      tasksDb.doc(id).delete();
    } on FirebaseException catch (e) {
      throw e;
    }
  }
}
