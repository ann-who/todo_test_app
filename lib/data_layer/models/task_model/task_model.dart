// ignore_for_file: invalid_annotation_target

import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_test_app/data_layer/models/task_status.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required int id,
    required String shortDescription,
    String? detailedDescription,
    @JsonKey(fromJson: TaskStatus.fromJson, toJson: TaskStatus.toJson)
    required TaskStatus status,
    required DateTime creationDate,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, Object?> json) =>
      _$TaskModelFromJson(json);
}
