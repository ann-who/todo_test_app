// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      databaseId: json['databaseId'] as String? ?? '',
      id: json['id'] as String,
      shortDescription: json['shortDescription'] as String,
      detailedDescription: json['detailedDescription'] as String?,
      status: TaskStatus.fromJson(json['status'] as String),
      creationDate: DateTime.parse(json['creationDate'] as String),
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'databaseId': instance.databaseId,
      'id': instance.id,
      'shortDescription': instance.shortDescription,
      'detailedDescription': instance.detailedDescription,
      'status': TaskStatus.toJson(instance.status),
      'creationDate': instance.creationDate.toIso8601String(),
    };
