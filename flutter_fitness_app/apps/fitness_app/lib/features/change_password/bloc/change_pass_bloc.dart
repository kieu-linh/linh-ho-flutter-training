import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/storage/shared_prefs.dart';
import 'package:fitness_app/core/utils/encode.dart';
import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/features/auth/sign_in/model/user_model.dart';
import 'package:fitness_app/features/change_password/bloc/change_pass_event.dart';
import 'package:fitness_app/features/change_password/bloc/change_pass_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePassBloc extends Bloc<ChangePassEvent, ChangePassState> {
  ChangePassBloc(this.apiClient) : super(const ChangePassState()) {
    on<CurrentPassChanged>(_onCurrentPasswordChanged);
    on<NewPassChanged>(_onNewPasswordChanged);
    on<ChangePassSubmitted>(_onChangePassSubmitted);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
  }

  final ApiClient apiClient;

  /// This function [_onCurrentPasswordChanged] is called when the value of the
  /// email form field on the sign in screen changes
  Future<void> _onCurrentPasswordChanged(
    CurrentPassChanged event,
    Emitter<ChangePassState> emit,
  ) async {
    /// Check email and password form field are valid
    bool isFormValid = _checkFormValid(
      event.currentPassword,
      state.newPassword,
      state.confirmPassword,
    );

    /// emit new state with new values and status initial
    emit(state.copyWith(
      status: SubmissionStatus.initial,
      currentPassword: event.currentPassword,
      isValid: isFormValid,
    ));
  }

  /// This function [_onNewPasswordChanged] is called when the value of the
  /// password form field on the sign in screen changes
  Future<void> _onNewPasswordChanged(
    NewPassChanged event,
    Emitter<ChangePassState> emit,
  ) async {
    bool isFormValid = _checkFormValid(
      event.newPassword,
      state.currentPassword,
      state.confirmPassword,
    );

    emit(state.copyWith(
      status: SubmissionStatus.initial,
      newPassword: event.newPassword,
      isValid: isFormValid,
    ));
  }

  /// This function [_onConfirmPasswordChanged] is called when the value of the
  /// password form field on the sign in screen changes
  Future<void> _onConfirmPasswordChanged(
    ConfirmPasswordChanged event,
    Emitter<ChangePassState> emit,
  ) async {
    bool isFormValid = _checkFormValid(
      state.currentPassword,
      state.newPassword,
      event.confirmPassword,
    );

    emit(state.copyWith(
      status: SubmissionStatus.initial,
      confirmPassword: event.confirmPassword,
      isValid: isFormValid,
    ));
  }

  /// This function [_onChangePassSubmitted] is called when the user presses the sign in button.
  Future<void> _onChangePassSubmitted(
    ChangePassSubmitted event,
    Emitter<ChangePassState> emit,
  ) async {
    /// This code is called when the user presses the sign in button.
    emit(state.copyWith(status: SubmissionStatus.loading));

    // get data from repository
    try {
      /// Get the user data to the local storage.
      final user =
          await SharedPrefs(SharedPreferences.getInstance()).getAccount();

      if (Encode.decryptPassword(user?.password ?? '') !=
          event.currentPassword) {
        throw Failure(400, 'Current password is incorrect');
      } else {
        await this.apiClient.patch(
              endpoint: '/User?email=eq.${user?.email}',
              body: jsonEncode(
                {'password': Encode.encryptPassword(event.newPassword)},
              ),
            );

        emit(state.copyWith(status: SubmissionStatus.success));
        user?.password = event.newPassword;
        SharedPrefs(SharedPreferences.getInstance())
            .saveAccount(user ?? User());
      }
      print(user?.password);
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
    String currentPass,
    String newPass,
    String confirmPass,
  ) {
    return FAValidator.validatorPassword(currentPass) == null &&
        FAValidator.validatorPassword(newPass) == null &&
        FAValidator.validatorConfirmPassword(confirmPass, newPass) == null;
  }
}
