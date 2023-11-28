part of 'authentification_bloc.dart';

abstract class AuthentificationEvent {}

class CredentialsChecked extends AuthentificationEvent {
  final String email;
  final String password;

  CredentialsChecked({required this.email, required this.password});
}

class UserAuthorized extends AuthentificationEvent {
  final String email;
  final String password;

  UserAuthorized({required this.email, required this.password});
}

class PasswordShowed extends AuthentificationEvent {
  PasswordShowed();
}
