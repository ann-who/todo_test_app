// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TasksListModelImpl _$$TasksListModelImplFromJson(Map<String, dynamic> json) =>
    _$TasksListModelImpl(
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TasksListModelImplToJson(
        _$TasksListModelImpl instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };
