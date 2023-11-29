import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_test_app/data_layer/data_source/tasks_data_source.dart';

import 'package:todo_test_app/data_layer/models/task_model/task_model.dart';
import 'package:todo_test_app/data_layer/models/task_status.dart';

class FirebaseTasksDataSource implements TasksDataSource {
  final tasksDb = FirebaseFirestore.instance.collection('tasks');

  @override
  Future<List<TaskModel>> loadExistingTasks() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot? tasks;
    List<TaskModel> existingTasks = [];

    try {
      tasks = await tasksDb
          .where('userId', isEqualTo: userId)
          .orderBy('creationDate', descending: true)
          .get();
    } on FirebaseException catch (e) {}

    if (tasks == null) {
      return existingTasks;
    }
    existingTasks = tasks.docs
        .map((doc) => TaskModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    return existingTasks;
  }

  @override
  Future<String> createTask(TaskModel task) async {
    try {
      DocumentReference docRef = await tasksDb.add(task.toJson());
      tasksDb.doc(docRef.id).update({'databaseId': docRef.id});
      return docRef.id;
    } on FirebaseException catch (e) {
      throw e;
    }
  }

  @override
  Future<void> deleteTask(String id) async {
    try {
      tasksDb.doc(id).delete();
    } on FirebaseException catch (e) {
      throw e;
    }
  }

  @override
  Future<void> updateTask(String id, TaskStatus newStatus) async {
    try {
      tasksDb.doc(id).update({'status': newStatus.status});
    } on FirebaseException catch (e) {
      throw e;
    }
  }
}