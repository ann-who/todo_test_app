// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskState {
  List<TaskModel> get tasks => throw _privateConstructorUsedError;
  TaskModel? get currentTask => throw _privateConstructorUsedError;
  int get newTasksCounter => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskStateCopyWith<TaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskStateCopyWith<$Res> {
  factory $TaskStateCopyWith(TaskState value, $Res Function(TaskState) then) =
      _$TaskStateCopyWithImpl<$Res, TaskState>;
  @useResult
  $Res call(
      {List<TaskModel> tasks,
      TaskModel? currentTask,
      int newTasksCounter,
      bool isLoading});

  $TaskModelCopyWith<$Res>? get currentTask;
}

/// @nodoc
class _$TaskStateCopyWithImpl<$Res, $Val extends TaskState>
    implements $TaskStateCopyWith<$Res> {
  _$TaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? currentTask = freezed,
    Object? newTasksCounter = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      currentTask: freezed == currentTask
          ? _value.currentTask
          : currentTask // ignore: cast_nullable_to_non_nullable
              as TaskModel?,
      newTasksCounter: null == newTasksCounter
          ? _value.newTasksCounter
          : newTasksCounter // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskModelCopyWith<$Res>? get currentTask {
    if (_value.currentTask == null) {
      return null;
    }

    return $TaskModelCopyWith<$Res>(_value.currentTask!, (value) {
      return _then(_value.copyWith(currentTask: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskStateImplCopyWith<$Res>
    implements $TaskStateCopyWith<$Res> {
  factory _$$TaskStateImplCopyWith(
          _$TaskStateImpl value, $Res Function(_$TaskStateImpl) then) =
      __$$TaskStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TaskModel> tasks,
      TaskModel? currentTask,
      int newTasksCounter,
      bool isLoading});

  @override
  $TaskModelCopyWith<$Res>? get currentTask;
}

/// @nodoc
class __$$TaskStateImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TaskStateImpl>
    implements _$$TaskStateImplCopyWith<$Res> {
  __$$TaskStateImplCopyWithImpl(
      _$TaskStateImpl _value, $Res Function(_$TaskStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? currentTask = freezed,
    Object? newTasksCounter = null,
    Object? isLoading = null,
  }) {
    return _then(_$TaskStateImpl(
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskModel>,
      currentTask: freezed == currentTask
          ? _value.currentTask
          : currentTask // ignore: cast_nullable_to_non_nullable
              as TaskModel?,
      newTasksCounter: null == newTasksCounter
          ? _value.newTasksCounter
          : newTasksCounter // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TaskStateImpl extends _TaskState {
  const _$TaskStateImpl(
      {final List<TaskModel> tasks = const [],
      this.currentTask,
      this.newTasksCounter = 0,
      this.isLoading = false})
      : _tasks = tasks,
        super._();

  final List<TaskModel> _tasks;
  @override
  @JsonKey()
  List<TaskModel> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  final TaskModel? currentTask;
  @override
  @JsonKey()
  final int newTasksCounter;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'TaskState(tasks: $tasks, currentTask: $currentTask, newTasksCounter: $newTasksCounter, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskStateImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.currentTask, currentTask) ||
                other.currentTask == currentTask) &&
            (identical(other.newTasksCounter, newTasksCounter) ||
                other.newTasksCounter == newTasksCounter) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tasks),
      currentTask,
      newTasksCounter,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskStateImplCopyWith<_$TaskStateImpl> get copyWith =>
      __$$TaskStateImplCopyWithImpl<_$TaskStateImpl>(this, _$identity);
}

abstract class _TaskState extends TaskState {
  const factory _TaskState(
      {final List<TaskModel> tasks,
      final TaskModel? currentTask,
      final int newTasksCounter,
      final bool isLoading}) = _$TaskStateImpl;
  const _TaskState._() : super._();

  @override
  List<TaskModel> get tasks;
  @override
  TaskModel? get currentTask;
  @override
  int get newTasksCounter;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$TaskStateImplCopyWith<_$TaskStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
