import 'package:todo_test_app/data_layer/models/task_model/task_model.dart';
import 'package:todo_test_app/data_layer/models/task_status.dart';

abstract class TasksRepository {
  Future<List<TaskModel>> loadExistingTasks();
  Future<String> createTask(TaskModel task);
  Future<void> deleteTask(String id);
  Future<void> updateTask(String id, TaskStatus status);
}
