part of 'task_bloc.dart';

abstract class TaskEvent {}

class TasksListLoaded extends TaskEvent {
  final List<TaskModel> tasks;

  TasksListLoaded({required this.tasks});
}

class TaskCreated extends TaskEvent {
  final TaskModel task;

  TaskCreated({required this.task});
}

class TaskDeleted extends TaskEvent {
  final String id;

  TaskDeleted({required this.id});
}

class TaskStatusChanged extends TaskEvent {
  final TaskModel task;

  TaskStatusChanged({required this.task});
}
