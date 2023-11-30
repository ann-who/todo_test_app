import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:todo_test_app/data_layer/repository/authentification_repository.dart';

part 'authentification_bloc.freezed.dart';
part 'authentification_event.dart';
part 'authentification_state.dart';

class AuthentificationBloc
    extends Bloc<AuthentificationEvent, AuthentificationState> {
  final AuthentificationRepository authRepository;

  AuthentificationBloc({required this.authRepository})
      : super(const AuthentificationState()) {
    on<CredentialsChecked>(_onCredentialsChecked);
    on<UserAuthorized>(_onUserAuthorized);
    on<PasswordShowed>(_onPasswordShowed);
    on<UserSignedOut>(_onUserSignedOut);
  }

  void _onCredentialsChecked(
    CredentialsChecked event,
    Emitter<AuthentificationState> emit,
  ) {
    if (event.email.isNotEmpty &&
        event.email.length >= 2 &&
        event.password.isNotEmpty &&
        event.password.length >= 4) {
      emit(state.copyWith(canAuthorize: true));
    } else {
      emit(state.copyWith(canAuthorize: false));
    }
  }

  void _onUserAuthorized(
    UserAuthorized event,
    Emitter<AuthentificationState> emit,
  ) async {
    await authRepository.createOrSignIn(event.email, event.password);
    emit(state.copyWith(email: event.email, isAuthorized: true));
  }

  void _onPasswordShowed(
    PasswordShowed event,
    Emitter<AuthentificationState> emit,
  ) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  void _onUserSignedOut(
    UserSignedOut event,
    Emitter<AuthentificationState> emit,
  ) async {
    await authRepository.signOut();
    emit(state.copyWith(email: '', isAuthorized: false));
  }
}
