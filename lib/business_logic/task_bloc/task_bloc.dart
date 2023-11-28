import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:todo_test_app/data_layer/models/task_model/task_model.dart';
import 'package:todo_test_app/data_layer/models/task_status.dart';
import 'package:todo_test_app/data_layer/repository/tasks_repository.dart';

part 'task_bloc.freezed.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TasksRepository tasksRepository;

  TaskBloc({required this.tasksRepository}) : super(const TaskState()) {
    on<TasksListLoaded>(_onTasksListLoaded);
    on<TaskCreated>(_onTaskCreated);
    on<TaskDeleted>(_onTaskDeleted);
    on<TaskStatusChanged>(_onTaskStatusChanged);
  }

  void _onTasksListLoaded(
    TasksListLoaded event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    var updatedTasks = await tasksRepository.loadExistingTasks();
    var newTasksCounter = updatedTasks
        .where((task) => task.status == TaskStatus.fresh)
        .toList()
        .length;

    emit(
      state.copyWith(
        isLoading: false,
        tasks: updatedTasks,
        newTasksCounter: newTasksCounter,
      ),
    );
  }

  void _onTaskCreated(
    TaskCreated event,
    Emitter<TaskState> emit,
  ) async {
    var updatedTasks = List<TaskModel>.from(state.tasks);
    var createdTaskId = await tasksRepository.createTask(event.task);
    var updatedTask = event.task.copyWith(databaseId: createdTaskId);

    updatedTasks.insert(0, updatedTask);

    var newTasksCounter = updatedTasks
        .where((task) => task.status == TaskStatus.fresh)
        .toList()
        .length;

    emit(
      state.copyWith(
        tasks: updatedTasks,
        newTasksCounter: newTasksCounter,
      ),
    );
  }

  void _onTaskDeleted(
    TaskDeleted event,
    Emitter<TaskState> emit,
  ) async {
    var updatedTasks = List<TaskModel>.from(state.tasks);
    int elementIndex =
        updatedTasks.indexWhere((task) => task.databaseId == event.id);

    if (updatedTasks[elementIndex].status == TaskStatus.inProgress ||
        updatedTasks[elementIndex].status == TaskStatus.done) {
      // По условиям ТЗ, мы не можем удалить задачу в статусе "В работе" или "Выполнена"
      return;
    }

    if (elementIndex == -1) {
      // TODO
      throw Exception();
    }

    updatedTasks.removeAt(elementIndex);
    await tasksRepository.deleteTask(event.id);

    var newTasksCounter = updatedTasks
        .where((task) => task.status == TaskStatus.fresh)
        .toList()
        .length;

    emit(
      state.copyWith(
        tasks: updatedTasks,
        newTasksCounter: newTasksCounter,
      ),
    );
  }

  void _onTaskStatusChanged(
    TaskStatusChanged event,
    Emitter<TaskState> emit,
  ) async {
    var updatedTasks = List<TaskModel>.from(state.tasks);
    var updatedTaskIndex = updatedTasks.indexOf(event.task);

    var taskNeededUpdate = updatedTasks.elementAt(updatedTaskIndex).copyWith(
        status: event.task.status == TaskStatus.fresh
            ? TaskStatus.inProgress
            : TaskStatus.done);

    updatedTasks[updatedTaskIndex] = taskNeededUpdate;

    var newTasksCounter = updatedTasks
        .where((task) => task.status == TaskStatus.fresh)
        .toList()
        .length;

    emit(
      state.copyWith(
        tasks: updatedTasks,
        newTasksCounter: newTasksCounter,
      ),
    );
  }
}
