// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      shortDescription: json['shortDescription'] as String,
      detailedDescription: json['detailedDescription'] as String?,
      status: TaskStatus.fromJson(json['status'] as String),
      creationDate: DateTime.parse(json['creationDate'] as String),
      creationTime: DateTime.parse(json['creationTime'] as String),
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'shortDescription': instance.shortDescription,
      'detailedDescription': instance.detailedDescription,
      'status': TaskStatus.toJson(instance.status),
      'creationDate': instance.creationDate.toIso8601String(),
      'creationTime': instance.creationTime.toIso8601String(),
    };