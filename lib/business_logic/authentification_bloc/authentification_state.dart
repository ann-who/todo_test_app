part of 'authentification_bloc.dart';

@freezed
class AuthentificationState with _$AuthentificationState {
  const AuthentificationState._();

  const factory AuthentificationState({
    @Default(true) bool obscurePassword,
    @Default(false) bool canAuthorize,
  }) = _AuthentificationState;
}
