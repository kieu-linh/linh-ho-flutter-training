import 'package:api_client/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/storage/shared_prefs.dart';
import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/features/auth/sign_in/bloc/sign_in_event.dart';
import 'package:fitness_app/features/auth/sign_in/bloc/sign_in_state.dart';
import 'package:fitness_app/features/auth/sign_in/model/user_model.dart';
import 'package:fitness_app/features/auth/sign_in/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(this.repository) : super(const SignInState()) {
    on<SignInEmailChanged>(_onEmailChanged);
    on<SignInPasswordChanged>(_onPasswordChanged);
    on<SignInSubmitted>(_onSignInSubmitted);
  }

  /// This is an instance of the [AuthRepository] class.
  final AuthRepository repository;

  /// This function [_onEmailChanged] is called when the value of the
  /// email form field on the sign in screen changes
  Future<void> _onEmailChanged(
    SignInEmailChanged event,
    Emitter<SignInState> emit,
  ) async {
    /// Check email and password form field are valid
    bool isFormValid = _checkFormValid(event.email, state.password);

    /// emit new state with new values and status initial
    emit(state.copyWith(
      status: SubmissionStatus.initial,
      email: event.email,
      isEmailValid: FAValidator.validatorEmail(event.email) == null,
      isValid: isFormValid,
    ));
  }

  /// This function [_onPasswordChanged] is called when the value of the
  /// password form field on the sign in screen changes
  Future<void> _onPasswordChanged(
    SignInPasswordChanged event,
    Emitter<SignInState> emit,
  ) async {
    /// Check email and password form field are valid
    bool isFormValid = _checkFormValid(state.email, event.password);

    emit(state.copyWith(
      status: SubmissionStatus.initial,
      password: event.password,
      isValid: isFormValid,
    ));
  }

  /// This function [_onSignInSubmitted] is called when the user presses the sign in button.
  Future<void> _onSignInSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    /// This code is called when the user presses the sign in button.
    emit(state.copyWith(status: SubmissionStatus.loading));

    // get data from repository
    try {
      User user = await this
          .repository
          .signIn(email: event.email, password: event.password);

      /// emit the success state.
      emit(state.copyWith(status: SubmissionStatus.success));

      /// Save the user data to the local storage.
      SharedPrefs(SharedPreferences.getInstance()).saveAccount(user);
    } catch (e) {
      print('object $e');
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
