import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/storage/shared_prefs.dart';
import 'package:fitness_app/core/utils/encode.dart';
import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/features/auth/forget_password/bloc/forget_password_event.dart';
import 'package:fitness_app/features/auth/forget_password/bloc/forget_password_state.dart';
import 'package:fitness_app/features/auth/sign_in/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPassBloc extends Bloc<ForgotPassEvent, ForgotPassState> {
  ForgotPassBloc(this.apiClient) : super(const ForgotPassState()) {
    on<inputEmailChanged>(_onEmailChanged);
    on<inputPasswordChanged>(_onPasswordChanged);
    on<inputConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<ForgotPassSubmitted>(_onForgotPassSubmitted);
    on<ResetPassSubmitted>(_onResetPassSubmitted);
  }

  final ApiClient apiClient;

  /// This function [_onEmailChanged] is called when the value of the
  /// email form field on the sign in screen Forgot
  Future<void> _onEmailChanged(
    inputEmailChanged event,
    Emitter<ForgotPassState> emit,
  ) async {
    /// Check email and password form field are valid
    bool isFormValid = FAValidator.validatorEmail(event.email) == null;

    /// emit new state with new values and status initial
    emit(state.copyWith(
      status: SubmissionStatus.initial,
      email: event.email,
      isValid: isFormValid,
      isEmailValid: FAValidator.validatorEmail(event.email) == null,
    ));
  }

  /// This function [_onPasswordChanged] is called when the value of the
  /// password form field on the sign in screen Forgot
  Future<void> _onPasswordChanged(
    inputPasswordChanged event,
    Emitter<ForgotPassState> emit,
  ) async {
    bool isFormValid =
        _checkFormValid(event.newPassword, state.confirmPassword);

    emit(state.copyWith(
      status: SubmissionStatus.initial,
      newPassword: event.newPassword,
      isValid: isFormValid,
    ));
  }

  /// This function [_onConfirmPasswordChanged] is called when the value of the
  /// password form field on the sign in screen Forgot
  Future<void> _onConfirmPasswordChanged(
    inputConfirmPasswordChanged event,
    Emitter<ForgotPassState> emit,
  ) async {
    bool isFormValid = _checkFormValid(
      state.newPassword,
      event.confirmPassword,
    );

    emit(state.copyWith(
      status: SubmissionStatus.initial,
      confirmPassword: event.confirmPassword,
      isValid: isFormValid,
    ));
  }

  /// This function [_onForgotPassSubmitted] is called when the user presses the sign in button.
  Future<void> _onForgotPassSubmitted(
    ForgotPassSubmitted event,
    Emitter<ForgotPassState> emit,
  ) async {
    /// This code is called when the user presses the sign in button.
    emit(state.copyWith(status: SubmissionStatus.loading));

    // get data from repository
    try {
      /// Get the user data to the local storage.
      final user =
          await SharedPrefs(SharedPreferences.getInstance()).getAccount();

      if (user?.email != event.email) {
        
        throw Failure(400, 'Your email is incorrect');
      } else {

        emit(state.copyWith(status: SubmissionStatus.success));
        
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: SubmissionStatus.failure,
          errorMessage: (e as Failure).message,
        ),
      );
    }
  }

  /// This function [_onResetPassSubmitted] is called when the user presses the sign in button.
  Future<void> _onResetPassSubmitted(
    ResetPassSubmitted event,
    Emitter<ForgotPassState> emit,
  ) async {
    /// This code is called when the user presses the sign in button.
    emit(state.copyWith(status: SubmissionStatus.loading));

    try {
      /// Get the user data to the local storage.
      final user =
          await SharedPrefs(SharedPreferences.getInstance()).getAccount();

      await this.apiClient.patch(
            endpoint: '/User?email=eq.${user?.email}',
            body: jsonEncode(
              {'password': Encode.encryptPassword(event.newPassword)},
            ),
          );

      emit(state.copyWith(status: SubmissionStatus.success));

      user?.password = event.newPassword;

      SharedPrefs(SharedPreferences.getInstance()).saveAccount(user ?? User());
    } catch (e) {
      emit(
        state.copyWith(
          status: SubmissionStatus.failure,
          errorMessage: (e as Failure).message,
        ),
      );
    }
  }

  /// This method is used to check the currentPass and newPass are valid.
  bool _checkFormValid(
    String newPass,
    String confirmPass,
  ) {
    return FAValidator.validatorPassword(newPass) == null &&
        FAValidator.validatorConfirmPassword(confirmPass, newPass) == null;
  }
}
