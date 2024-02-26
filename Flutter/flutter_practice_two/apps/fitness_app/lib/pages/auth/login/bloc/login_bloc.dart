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
    on<LogInButtonChangedEvent>(_onButtonChange);
    on<LoginSubmittedEvent>(_onLoginSubmitted);
  }

  Future<void> _onEmailChanged(
    LogInEmailChangedEvent event,
    Emitter<LoginState> emit,
  ) async {
    /// This code is called when the value of the
    /// email form field on the sign in screen changes.

    emit(const LoginState(status: LoginStatus.onEmailChangedLoading));

    /// It checks to see if the email is valid.
    final email = event.email;
    final isValidEmail = FAValidator.validatorEmail(email);

    /// If the email is valid, it emits isUsernameValid true,
    /// otherwise it emits isUsernameValid false.
    isValidEmail == null
        ? emit(LoginState(email: email ?? '', isUsernameValid: true))
        : emit(LoginState(email: email ?? '', isUsernameValid: false));
  }

  Future<void> _onButtonChange(
    LogInButtonChangedEvent event,
    Emitter<LoginState> emit,
  ) async {

    /// This code is called when the value of the password and email form field changes.
    final password = event.password;
    final email = event.email;

    /// It checks to see if the email and password are valid.
    final isValidEmail = FAValidator.validatorEmail(email);
    final isValidPassword = FAValidator.validatorPassword(password);

    /// If the email and password are valid, it emits isValid true,
    /// otherwise it emits isValid false.
    isValidEmail == null && isValidPassword == null
        ? emit(LoginState(isValid: true))
        : emit(LoginState(isValid: false));
  }

  Future<void> _onLoginSubmitted(
    LoginSubmittedEvent event,
    Emitter<LoginState> emit,
  ) async {

    /// This code is called when the user presses the sign in button.
    emit(const LoginState(
        status: LoginStatus.onLoading, isUsernameValid: true, isValid: true));
    
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
      emit(const LoginState(status: LoginStatus.failure));
    } else {
      emit(const LoginState(status: LoginStatus.success));
    }

    /// Save the user data to the local storage.
    User user = User()
      ..email = event.email
      ..password = event.password;
    SharedPrefs().saveAccount(user);
  }
}
