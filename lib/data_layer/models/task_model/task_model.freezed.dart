// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  String get shortDescription => throw _privateConstructorUsedError;
  String? get detailedDescription => throw _privateConstructorUsedError;
  @JsonKey(fromJson: TaskStatus.fromJson, toJson: TaskStatus.toJson)
  TaskStatus get status => throw _privateConstructorUsedError;
  DateTime get creationDate => throw _privateConstructorUsedError;
  DateTime get creationTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call(
      {String shortDescription,
      String? detailedDescription,
      @JsonKey(fromJson: TaskStatus.fromJson, toJson: TaskStatus.toJson)
      TaskStatus status,
      DateTime creationDate,
      DateTime creationTime});
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortDescription = null,
    Object? detailedDescription = freezed,
    Object? status = null,
    Object? creationDate = null,
    Object? creationTime = null,
  }) {
    return _then(_value.copyWith(
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      detailedDescription: freezed == detailedDescription
          ? _value.detailedDescription
          : detailedDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      creationTime: null == creationTime
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskModelImplCopyWith<$Res>
    implements $TaskModelCopyWith<$Res> {
  factory _$$TaskModelImplCopyWith(
          _$TaskModelImpl value, $Res Function(_$TaskModelImpl) then) =
      __$$TaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String shortDescription,
      String? detailedDescription,
      @JsonKey(fromJson: TaskStatus.fromJson, toJson: TaskStatus.toJson)
      TaskStatus status,
      DateTime creationDate,
      DateTime creationTime});
}

/// @nodoc
class __$$TaskModelImplCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$TaskModelImpl>
    implements _$$TaskModelImplCopyWith<$Res> {
  __$$TaskModelImplCopyWithImpl(
      _$TaskModelImpl _value, $Res Function(_$TaskModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shortDescription = null,
    Object? detailedDescription = freezed,
    Object? status = null,
    Object? creationDate = null,
    Object? creationTime = null,
  }) {
    return _then(_$TaskModelImpl(
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      detailedDescription: freezed == detailedDescription
          ? _value.detailedDescription
          : detailedDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      creationDate: null == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      creationTime: null == creationTime
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskModelImpl implements _TaskModel {
  const _$TaskModelImpl(
      {required this.shortDescription,
      this.detailedDescription,
      @JsonKey(fromJson: TaskStatus.fromJson, toJson: TaskStatus.toJson)
      required this.status,
      required this.creationDate,
      required this.creationTime});

  factory _$TaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskModelImplFromJson(json);

  @override
  final String shortDescription;
  @override
  final String? detailedDescription;
  @override
  @JsonKey(fromJson: TaskStatus.fromJson, toJson: TaskStatus.toJson)
  final TaskStatus status;
  @override
  final DateTime creationDate;
  @override
  final DateTime creationTime;

  @override
  String toString() {
    return 'TaskModel(shortDescription: $shortDescription, detailedDescription: $detailedDescription, status: $status, creationDate: $creationDate, creationTime: $creationTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskModelImpl &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.detailedDescription, detailedDescription) ||
                other.detailedDescription == detailedDescription) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.creationTime, creationTime) ||
                other.creationTime == creationTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, shortDescription,
      detailedDescription, status, creationDate, creationTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      __$$TaskModelImplCopyWithImpl<_$TaskModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskModelImplToJson(
      this,
    );
  }
}

abstract class _TaskModel implements TaskModel {
  const factory _TaskModel(
      {required final String shortDescription,
      final String? detailedDescription,
      @JsonKey(fromJson: TaskStatus.fromJson, toJson: TaskStatus.toJson)
      required final TaskStatus status,
      required final DateTime creationDate,
      required final DateTime creationTime}) = _$TaskModelImpl;

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$TaskModelImpl.fromJson;

  @override
  String get shortDescription;
  @override
  String? get detailedDescription;
  @override
  @JsonKey(fromJson: TaskStatus.fromJson, toJson: TaskStatus.toJson)
  TaskStatus get status;
  @override
  DateTime get creationDate;
  @override
  DateTime get creationTime;
  @override
  @JsonKey(ignore: true)
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
