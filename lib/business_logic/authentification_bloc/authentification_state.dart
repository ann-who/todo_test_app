part of 'authentification_bloc.dart';

@freezed
class AuthentificationState with _$AuthentificationState {
  const AuthentificationState._();

  const factory AuthentificationState({
    @Default(true) bool obscurePassword,
    @Default(false) bool canAuthorize,
    @Default(false) bool isAuthorized,
    @Default('') String email,
    @Default(AuthStateStatus.needCheck) AuthStateStatus status,
    Object? error,
  }) = _AuthentificationState;
}
