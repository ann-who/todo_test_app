// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TasksListModel _$TasksListModelFromJson(Map<String, dynamic> json) {
  return _TasksListModel.fromJson(json);
}

/// @nodoc
mixin _$TasksListModel {
  List<TaskModel> get tasks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TasksListModelCopyWith<TasksListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksListModelCopyWith<$Res> {
  factory $TasksListModelCopyWith(
          TasksListModel value, $Res Function(TasksListModel) then) =
      _$TasksListModelCopyWithImpl<$Res, TasksListModel>;
  @useResult
  $Res call({List<TaskModel> tasks});
}

/// @nodoc
class _$TasksListModelCopyWithImpl<$Res, $Val extends TasksListModel>
    implements $TasksListModelCopyWith<$Res> {
  _$TasksListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_value.copyWith(
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TasksListModelImplCopyWith<$Res>
    implements $TasksListModelCopyWith<$Res> {
  factory _$$TasksListModelImplCopyWith(_$TasksListModelImpl value,
          $Res Function(_$TasksListModelImpl) then) =
      __$$TasksListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TaskModel> tasks});
}

/// @nodoc
class __$$TasksListModelImplCopyWithImpl<$Res>
    extends _$TasksListModelCopyWithImpl<$Res, _$TasksListModelImpl>
    implements _$$TasksListModelImplCopyWith<$Res> {
  __$$TasksListModelImplCopyWithImpl(
      _$TasksListModelImpl _value, $Res Function(_$TasksListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_$TasksListModelImpl(
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TasksListModelImpl implements _TasksListModel {
  const _$TasksListModelImpl({final List<TaskModel> tasks = const []})
      : _tasks = tasks;

  factory _$TasksListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TasksListModelImplFromJson(json);

  final List<TaskModel> _tasks;
  @override
  @JsonKey()
  List<TaskModel> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'TasksListModel(tasks: $tasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksListModelImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksListModelImplCopyWith<_$TasksListModelImpl> get copyWith =>
      __$$TasksListModelImplCopyWithImpl<_$TasksListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TasksListModelImplToJson(
      this,
    );
  }
}

abstract class _TasksListModel implements TasksListModel {
  const factory _TasksListModel({final List<TaskModel> tasks}) =
      _$TasksListModelImpl;

  factory _TasksListModel.fromJson(Map<String, dynamic> json) =
      _$TasksListModelImpl.fromJson;

  @override
  List<TaskModel> get tasks;
  @override
  @JsonKey(ignore: true)
  _$$TasksListModelImplCopyWith<_$TasksListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
