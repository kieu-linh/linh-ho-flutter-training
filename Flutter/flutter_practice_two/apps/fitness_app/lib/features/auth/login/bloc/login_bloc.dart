// ignore_for_file: body_might_complete_normally_catch_error

import 'package:api_client/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/storage/shared_prefs.dart';
import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/features/auth/login/bloc/login_event.dart';
import 'package:fitness_app/features/auth/login/bloc/login_state.dart';
import 'package:fitness_app/features/auth/login/model/user_model.dart';
import 'package:fitness_app/features/auth/login/repositories/auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.repository) : super(const LoginState()) {
    on<LogInEmailChanged>(_onEmailChanged);
    on<LogInPasswordChanged>(_onPasswordChange);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  final AuthRepository repository;

  /// This function [_onEmailChanged] is called when the value of the
  /// email form field on the sign in screen changes
  Future<void> _onEmailChanged(
    LogInEmailChanged event,
    Emitter<LoginState> emit,
  ) async {
    /// Check email and password form field are valid
    bool isFormValid = _checkFormValid(event.email ?? '', state.password);

    /// emit new state with new values and status initial
    emit(state.copyWith(
      status: SubmissionStatus.initial,
      email: event.email ?? '',
      isEmailValid: FAValidator.validatorEmail(event.email) == null,
      isValid: isFormValid,
    ));
  }

  /// This function [_onPasswordChanged] is called when the value of the
  /// password form field on the sign in screen changes
  Future<void> _onPasswordChange(
    LogInPasswordChanged event,
    Emitter<LoginState> emit,
  ) async {
    /// Check email and password form field are valid
    bool isFormValid = _checkFormValid(state.email, event.password);

    emit(state.copyWith(
      status: SubmissionStatus.initial,
      password: event.password,
      email: state.email,
      isValid: isFormValid,
    ));
  }

  /// This function [_onLoginSubmitted] is called when the user presses the sign in button.
  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    /// This code is called when the user presses the sign in button.
    emit(state.copyWith(status: SubmissionStatus.loading));

    // get data from repository
    try {
      User user = await this
          .repository
          .login(email: event.email, password: event.password);

      /// emit the success state.
      emit(state.copyWith(status: SubmissionStatus.success));

      /// Save the user data to the local storage.
      SharedPrefs().saveAccount(user);
    } catch (e) {
      emit(
        state.copyWith(
          status: SubmissionStatus.failure,
          errorMessage: (e as Failure).message,
        ),
      );
    }
  }

  /// This method is used to check the email and password are valid.
  bool _checkFormValid(
    String email,
    String pass,
  ) {
    return FAValidator.validatorEmail(email) == null &&
        FAValidator.validatorPassword(pass) == null;
  }
}
