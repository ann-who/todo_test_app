import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:todo_test_app/data_layer/models/task_model/task_model.dart';
import 'package:todo_test_app/data_layer/models/task_status.dart';
import 'package:todo_test_app/data_layer/repository/tasks_repository.dart';
import 'package:todo_test_app/resources/exceptions/task_exception.dart';

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
    on<UserSignedOut>(_onUserSignedOut);
  }

  void _onTasksListLoaded(
    TasksListLoaded event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
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
          error: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  void _onTaskCreated(
    TaskCreated event,
    Emitter<TaskState> emit,
  ) async {
    var updatedTasks = List<TaskModel>.from(state.tasks);

    try {
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
          error: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
    }
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
      emit(state.copyWith(error: const TaskException('Delete error')));
      throw const TaskException('Delete error');
    }

    updatedTasks.removeAt(elementIndex);

    try {
      await tasksRepository.deleteTask(event.id);

      var newTasksCounter = updatedTasks
          .where((task) => task.status == TaskStatus.fresh)
          .toList()
          .length;

      emit(
        state.copyWith(
          tasks: updatedTasks,
          newTasksCounter: newTasksCounter,
          error: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  void _onTaskStatusChanged(
    TaskStatusChanged event,
    Emitter<TaskState> emit,
  ) async {
    var updatedTasks = List<TaskModel>.from(state.tasks);
    var updatedTaskIndex = updatedTasks.indexOf(event.task);
    var nextStatus = event.task.status == TaskStatus.fresh
        ? TaskStatus.inProgress
        : TaskStatus.done;

    var taskNeededUpdate = updatedTasks.elementAt(updatedTaskIndex).copyWith(
          status: nextStatus,
        );

    updatedTasks[updatedTaskIndex] = taskNeededUpdate;
    try {
      await tasksRepository.updateTask(event.task.databaseId, nextStatus);

      var newTasksCounter = updatedTasks
          .where((task) => task.status == TaskStatus.fresh)
          .toList()
          .length;

      emit(
        state.copyWith(
          tasks: updatedTasks,
          newTasksCounter: newTasksCounter,
          error: null,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  void _onUserSignedOut(
    UserSignedOut event,
    Emitter<TaskState> emit,
  ) {
    emit(
      state.copyWith(
        tasks: [],
        newTasksCounter: 0,
        isLoading: true,
        error: null,
      ),
    );
  }
}
