import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_login/data/authentication_repository.dart';
import 'package:flutter_bloc_login/login/auth_validator.dart';
import 'package:flutter_bloc_login/login/models/user_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LogInEmailChangedEvent>(_onEmailChanged);
    on<LogInPasswordChangedEvent>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
  }
  final AuthenticationRepository _authenticationRepository;

  Future<void> _onEmailChanged(
    LogInEmailChangedEvent event,
    Emitter<LoginState> emit,
  ) async {
    /// This code is called when the value of the
    /// email form field on the sign in screen changes.

    emit(const LoginState(status: LoginStatus.onEmailChangedLoading));

    /// It checks to see if the email is valid.
    /// If it is, it emits a [SignInValueChangedSuccessState],
    /// otherwise it emits a [SignInValueChangedFailureState].
    final email = event.email;
    final isValidEmail = FAValidator.validatorEmail(email);

    if (isValidEmail == null) {
      emit(
        LoginState(
          status: LoginStatus.onEmailChangedSuccess,
          email: email ?? '',
          isUsernameValid: true,
        ),
      );
      print('[Log] ${state.email}');
    } else {
      emit(
        LoginState(
            status: LoginStatus.onEmailChangedFailure, email: email ?? ''),
      );
    }
  }

  Future<void> _onPasswordChanged(
    LogInPasswordChangedEvent event,
    Emitter<LoginState> emit,
  ) async {
    /// This code is called when the value of the
    /// password form field on the sign in screen changes.
    emit(const LoginState(status: LoginStatus.onPasswordChangedLoading));

    /// It checks to see if the email is valid.
    /// If it is, it emits a [SignInValueChangedSuccessState],
    /// otherwise it emits a [SignInValueChangedFailureState].
    final password = event.password;
    final isValidPassword = FAValidator.validatorPassword(password);

    if (isValidPassword == null) {
      emit(LoginState(
        status: LoginStatus.onPasswordChangedSuccess,
        password: password ?? '',
        isPasswordValid: true,
      ));
      print('[Log] ${state.password}');
    } else {
      emit(
        LoginState(
          status: LoginStatus.onPasswordChangedFailure,
          password: password ?? '',
        ),
      );
    }
  }

  void _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginState(status: LoginStatus.loading));
    /*final login = await _authenticationRepository.logIn(
      email: event.email,
      password: event.password,
    );*/
    await Future.delayed(const Duration(seconds: 2));
    if (event.email == user1.email && event.password == user1.password) {
      emit(const LoginState(status: LoginStatus.success));
    } else {
      emit(const LoginState(status: LoginStatus.failure));
    }

    /*print('[Log] $login');
    if (login == AuthenticationStatus.authenticated) {
      emit(state.copyWith(status: LoginStatus.success));
    } else {
      emit(state.copyWith(status: LoginStatus.failure));
    }*/
  }
}
