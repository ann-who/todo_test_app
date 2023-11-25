import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:todo_test_app/data_layer/models/task_model/task_model.dart';

part 'tasks_list_model.freezed.dart';
part 'tasks_list_model.g.dart';

@freezed
class TasksListModel with _$TasksListModel {
  const factory TasksListModel({
    @Default([]) List<TaskModel> tasks,
  }) = _TasksListModel;

  factory TasksListModel.fromJson(Map<String, Object?> json) =>
      _$TasksListModelFromJson(json);
}
