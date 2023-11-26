import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_test_app/data_layer/models/task_model/task_model.dart';
import 'package:todo_test_app/data_layer/models/task_status.dart';

part 'task_bloc.freezed.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<TasksListLoaded>(_onTasksListLoaded);
    on<TaskCreated>(_onTaskCreated);
    on<TaskDeleted>(_onTaskDeleted);
    on<TaskStatusChanged>(_onTaskStatusChanged);
    on<TaskDetailsOpened>(_onTaskDetailsOpened);
  }

  void _onTasksListLoaded(
    TasksListLoaded event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    var updatedTasks = <TaskModel>[];
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
    updatedTasks.insert(0, event.task);

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
    int elementIndex = updatedTasks.indexWhere((task) => task.id == event.id);

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

  void _onTaskDetailsOpened(
    TaskDetailsOpened event,
    Emitter<TaskState> emit,
  ) async {
    emit(state.copyWith(currentTask: event.task));
  }
}
