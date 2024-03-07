import 'package:api_client/api_client.dart';
import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/features/auth/sign_in/repository/auth_repository.dart';
import 'package:fitness_app/features/auth/sign_up/bloc/sign_up_event.dart';
import 'package:fitness_app/features/auth/sign_up/bloc/sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this.repository) : super(const SignUpState()) {
    on<SignUpNameChanged>(_onNameChanged);
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<SignUpSubmitted>(_onSignUpSubmitted);
  }

  final AuthRepository repository;

  /// This function [_onNameChanged] is called when the value of the
  /// name form field on the sign in screen changes
  Future<void> _onNameChanged(
    SignUpNameChanged event,
    Emitter<SignUpState> emit,
  ) async {
    /// Check form field are valid
    bool isFormValid = _checkFormValid(
      state.name,
      state.email,
      state.password,
      state.confirmPassword,
    );

    emit(state.copyWith(
      status: SubmissionStatus.initial,
      name: event.name,
      isValid: isFormValid,
    ));
  }

  /// This function [_onEmailChanged] is called when the value of the
  /// email form field on the sign in screen changes
  Future<void> _onEmailChanged(
    SignUpEmailChanged event,
    Emitter<SignUpState> emit,
  ) async {
    /// Check form field are valid
    bool isFormValid = _checkFormValid(
      state.name,
      state.email,
      state.password,
      state.confirmPassword,
    );

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
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) async {
    /// Check form field are valid
    bool isFormValid = _checkFormValid(
      state.name,
      state.email,
      state.password,
      state.confirmPassword,
    );

    emit(state.copyWith(
      status: SubmissionStatus.initial,
      password: event.password,
      isValid: isFormValid,
    ));
  }

  /// This function [_onConfirmPasswordChanged] is called when the value of the
  /// confirm password form field on the sign in screen changes
  Future<void> _onConfirmPasswordChanged(
    SignUpConfirmPasswordChanged event,
    Emitter<SignUpState> emit,
  ) async {
    /// Check form field are valid
    bool isFormValid = _checkFormValid(
      state.name,
      state.email,
      state.password,
      state.confirmPassword,
    );
    print(
        'fgh $isFormValid ${state.name} ${state.email} ${state.password} ${state.confirmPassword}}');
    emit(state.copyWith(
      status: SubmissionStatus.initial,
      confirmPassword: event.confirmPassword,
      isValid: isFormValid,
    ));
  }

  /// This function [_onSignUpSubmitted] is called when the user presses the sign up button.
  Future<void> _onSignUpSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    /// This code is called when the user presses the sign in button.
    emit(state.copyWith(status: SubmissionStatus.loading));

    // get data from repository
    try {
      /// emit the success state.
      emit(state.copyWith(status: SubmissionStatus.success));

      this.repository.signUp(
            name: event.name,
            email: event.email,
            password: event.password,
          );

      /// Save the user data to the local storage.
      // SharedPrefs(SharedPreferences.getInstance()).saveAccount(user);
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
    String name,
    String email,
    String pass,
    String confirmPass,
  ) {
    return FAValidator.validatorInput(name) == null &&
        FAValidator.validatorEmail(email) == null &&
        FAValidator.validatorPassword(pass) == null &&
        FAValidator.validatorPassword(confirmPass) == null;
  }
}
