import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_test_app/data_layer/data_source/tasks_data_source.dart';

import 'package:todo_test_app/data_layer/models/task_model/task_model.dart';
import 'package:todo_test_app/data_layer/models/task_status.dart';
import 'package:todo_test_app/resources/exceptions/logger.dart';
import 'package:todo_test_app/resources/exceptions/task_exception.dart';

class FirebaseTasksDataSource implements TasksDataSource {
  @override
  Future<List<TaskModel>> loadExistingTasks() async {
    final tasksDb = FirebaseFirestore.instance.collection('tasks');
    String userId = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot? tasks;
    List<TaskModel> existingTasks = [];

    try {
      tasks = await tasksDb
          .where('userId', isEqualTo: userId)
          .orderBy('creationDate', descending: true)
          .get();
    } on FirebaseException catch (e, s) {
      logger.e('Loading error', error: e, stackTrace: s);

      return Future.error(const TaskException('Loading error'));
    }

    existingTasks = tasks.docs
        .map((doc) => TaskModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    return existingTasks;
  }

  @override
  Future<String> createTask(TaskModel task) async {
    final tasksDb = FirebaseFirestore.instance.collection('tasks');
    try {
      DocumentReference docRef = await tasksDb.add(task.toJson());
      tasksDb.doc(docRef.id).update({'databaseId': docRef.id});
      return docRef.id;
    } on FirebaseException catch (e, s) {
      logger.e('Create error', error: e, stackTrace: s);

      return Future.error(const TaskException('Create error'));
    }
  }

  @override
  Future<void> deleteTask(String id) async {
    final tasksDb = FirebaseFirestore.instance.collection('tasks');
    try {
      tasksDb.doc(id).delete();
    } on FirebaseException catch (e, s) {
      logger.e('Delete error', error: e, stackTrace: s);

      return Future.error(const TaskException('Delete error'));
    }
  }

  @override
  Future<void> updateTask(String id, TaskStatus newStatus) async {
    final tasksDb = FirebaseFirestore.instance.collection('tasks');
    try {
      tasksDb.doc(id).update({'status': newStatus.status});
    } on FirebaseException catch (e, s) {
      logger.e('Update error', error: e, stackTrace: s);

      return Future.error(const TaskException('Update error'));
    }
  }
}
