import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/storage/shared_prefs.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/pages/auth/login/bloc/login_event.dart';
import 'package:fitness_app/pages/auth/login/bloc/login_state.dart';
import 'package:fitness_app/pages/auth/login/model/user_model.dart';
import 'package:fitness_app/pages/auth/login/repositories/auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LogInEmailChangedEvent>(_onEmailChanged);
    on<LogInPasswordChangedEvent>(_onPasswordChange);
    on<LoginSubmittedEvent>(_onLoginSubmitted);
  }

  Future<void> _onEmailChanged(
    LogInEmailChangedEvent event,
    Emitter<LoginState> emit,
  ) async {
    /// This code is called when the value of the
    /// email form field on the sign in screen changes.

    /// It checks to see if the email is valid.
    final email = event.email;
    final isCheckEmail = FAValidator.validatorEmail(email);

    /// If the email is valid, it emits isEmailValid true,
    /// otherwise it emits isEmailValid false.
    bool isFormValid = _checkFormValid(event.email ?? '', state.password);

    emit(state.copyWith(
      status: LoginStatus.initial,
      email: email ?? '',
      isEmailValid: isCheckEmail == null ? true : false,
      isValid: isFormValid,
    ));
  }

  Future<void> _onPasswordChange(
    LogInPasswordChangedEvent event,
    Emitter<LoginState> emit,
  ) async {
    /// This code is called when the value of the password and email form field changes.
    bool isFormValid = _checkFormValid(state.email, event.password);

    emit(state.copyWith(
      status: LoginStatus.initial,
      password: event.password,
      email: state.email,
      isValid: isFormValid,
    ));
  }

  Future<void> _onLoginSubmitted(
    LoginSubmittedEvent event,
    Emitter<LoginState> emit,
  ) async {
    /// This code is called when the user presses the sign in button.
    emit(state.copyWith(
        status: LoginStatus.onLoading, isEmailValid: true, isValid: true));

    // get data from repository
    List<User> list = await AuthRepository().users() ?? [];

    /// It checks to see if the email and password are exist in the list data.
    final listUser = list
        .where(
          (element) =>
              element.email == event.email &&
              element.password == event.password,
        )
        .toList();

    /// If the email and password are empty, it emits a [SignInFailureState],
    /// otherwise it emits a [SignInSuccessState].
    if (listUser.isEmpty) {
      emit(state.copyWith(status: LoginStatus.failure));
    } else {
      emit(state.copyWith(status: LoginStatus.success));

      /// Save the user data to the local storage.
      User user = User()
        ..email = event.email
        ..password = event.password;
      SharedPrefs().saveAccount(user);
    }
  }

  /// This method is used to check the email and password are valid.
  bool _checkFormValid(
    String email,
    String pass,
  ) {
    final isValidEmail = FAValidator.validatorEmail(email);
    final isValidPassword = FAValidator.validatorPassword(pass);

    return isValidEmail == null && isValidPassword == null;
  }
}
