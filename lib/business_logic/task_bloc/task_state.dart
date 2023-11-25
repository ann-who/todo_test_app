part of 'task_bloc.dart';

@freezed
class TaskState with _$TaskState {
  const TaskState._();

  const factory TaskState({
    @Default([]) List<TaskModel> tasks,
    TaskModel? currentTask,
    @Default(0) int newTasksCounter,
    @Default(false) bool isLoading,
  }) = _TaskState;
}
