import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentification_bloc.freezed.dart';
part 'authentification_event.dart';
part 'authentification_state.dart';

class AuthentificationBloc
    extends Bloc<AuthentificationEvent, AuthentificationState> {
  AuthentificationBloc() : super(const AuthentificationState()) {
    on<CredentialsChecked>(_onCredentialsChecked);
    on<UserAuthorized>(_onUserAuthorized);
    on<PasswordShowed>(_onPasswordShowed);
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
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
      } else {
        throw e;
      }
    }
  }

  void _onPasswordShowed(
    PasswordShowed event,
    Emitter<AuthentificationState> emit,
  ) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }
}
