part of 'task_bloc.dart';

@freezed
class TaskState with _$TaskState {
  const TaskState._();

  const factory TaskState({
    @Default([]) List<TaskModel> tasks,
    @Default(0) int newTasksCounter,
    @Default(true) bool isLoading,
  }) = _TaskState;
}
