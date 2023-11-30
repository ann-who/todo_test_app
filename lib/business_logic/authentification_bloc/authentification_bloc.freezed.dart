// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthentificationState {
  bool get obscurePassword => throw _privateConstructorUsedError;
  bool get canAuthorize => throw _privateConstructorUsedError;
  bool get isAuthorized => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  AuthStateStatus get status => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthentificationStateCopyWith<AuthentificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthentificationStateCopyWith<$Res> {
  factory $AuthentificationStateCopyWith(AuthentificationState value,
          $Res Function(AuthentificationState) then) =
      _$AuthentificationStateCopyWithImpl<$Res, AuthentificationState>;
  @useResult
  $Res call(
      {bool obscurePassword,
      bool canAuthorize,
      bool isAuthorized,
      String email,
      AuthStateStatus status,
      Object? error});
}

/// @nodoc
class _$AuthentificationStateCopyWithImpl<$Res,
        $Val extends AuthentificationState>
    implements $AuthentificationStateCopyWith<$Res> {
  _$AuthentificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? obscurePassword = null,
    Object? canAuthorize = null,
    Object? isAuthorized = null,
    Object? email = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      obscurePassword: null == obscurePassword
          ? _value.obscurePassword
          : obscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      canAuthorize: null == canAuthorize
          ? _value.canAuthorize
          : canAuthorize // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthorized: null == isAuthorized
          ? _value.isAuthorized
          : isAuthorized // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStateStatus,
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthentificationStateImplCopyWith<$Res>
    implements $AuthentificationStateCopyWith<$Res> {
  factory _$$AuthentificationStateImplCopyWith(
          _$AuthentificationStateImpl value,
          $Res Function(_$AuthentificationStateImpl) then) =
      __$$AuthentificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool obscurePassword,
      bool canAuthorize,
      bool isAuthorized,
      String email,
      AuthStateStatus status,
      Object? error});
}

/// @nodoc
class __$$AuthentificationStateImplCopyWithImpl<$Res>
    extends _$AuthentificationStateCopyWithImpl<$Res,
        _$AuthentificationStateImpl>
    implements _$$AuthentificationStateImplCopyWith<$Res> {
  __$$AuthentificationStateImplCopyWithImpl(_$AuthentificationStateImpl _value,
      $Res Function(_$AuthentificationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? obscurePassword = null,
    Object? canAuthorize = null,
    Object? isAuthorized = null,
    Object? email = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$AuthentificationStateImpl(
      obscurePassword: null == obscurePassword
          ? _value.obscurePassword
          : obscurePassword // ignore: cast_nullable_to_non_nullable
              as bool,
      canAuthorize: null == canAuthorize
          ? _value.canAuthorize
          : canAuthorize // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuthorized: null == isAuthorized
          ? _value.isAuthorized
          : isAuthorized // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStateStatus,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$AuthentificationStateImpl extends _AuthentificationState {
  const _$AuthentificationStateImpl(
      {this.obscurePassword = true,
      this.canAuthorize = false,
      this.isAuthorized = false,
      this.email = '',
      this.status = AuthStateStatus.needCheck,
      this.error})
      : super._();

  @override
  @JsonKey()
  final bool obscurePassword;
  @override
  @JsonKey()
  final bool canAuthorize;
  @override
  @JsonKey()
  final bool isAuthorized;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final AuthStateStatus status;
  @override
  final Object? error;

  @override
  String toString() {
    return 'AuthentificationState(obscurePassword: $obscurePassword, canAuthorize: $canAuthorize, isAuthorized: $isAuthorized, email: $email, status: $status, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthentificationStateImpl &&
            (identical(other.obscurePassword, obscurePassword) ||
                other.obscurePassword == obscurePassword) &&
            (identical(other.canAuthorize, canAuthorize) ||
                other.canAuthorize == canAuthorize) &&
            (identical(other.isAuthorized, isAuthorized) ||
                other.isAuthorized == isAuthorized) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, obscurePassword, canAuthorize,
      isAuthorized, email, status, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthentificationStateImplCopyWith<_$AuthentificationStateImpl>
      get copyWith => __$$AuthentificationStateImplCopyWithImpl<
          _$AuthentificationStateImpl>(this, _$identity);
}

abstract class _AuthentificationState extends AuthentificationState {
  const factory _AuthentificationState(
      {final bool obscurePassword,
      final bool canAuthorize,
      final bool isAuthorized,
      final String email,
      final AuthStateStatus status,
      final Object? error}) = _$AuthentificationStateImpl;
  const _AuthentificationState._() : super._();

  @override
  bool get obscurePassword;
  @override
  bool get canAuthorize;
  @override
  bool get isAuthorized;
  @override
  String get email;
  @override
  AuthStateStatus get status;
  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$AuthentificationStateImplCopyWith<_$AuthentificationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
