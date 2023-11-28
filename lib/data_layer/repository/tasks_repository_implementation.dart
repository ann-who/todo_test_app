import 'package:todo_test_app/data_layer/data_source/tasks_data_source.dart';
import 'package:todo_test_app/data_layer/models/task_model/task_model.dart';
import 'package:todo_test_app/data_layer/models/task_status.dart';
import 'package:todo_test_app/data_layer/repository/tasks_repository.dart';

class TasksRepositoryImplementation implements TasksRepository {
  final TasksDataSource tasksDataSource;

  const TasksRepositoryImplementation({required this.tasksDataSource});

  @override
  Future<List<TaskModel>> loadExistingTasks() async {
    List<TaskModel> result = await tasksDataSource.loadExistingTasks();

    return result;
  }

  @override
  Future<String> createTask(TaskModel task) async {
    return await tasksDataSource.createTask(task);
  }

  @override
  Future<void> deleteTask(String id) async {
    await tasksDataSource.deleteTask(id);
  }

  @override
  Future<void> updateTask(String id, TaskStatus status) async {
    await tasksDataSource.updateTask(id, status);
  }
}
