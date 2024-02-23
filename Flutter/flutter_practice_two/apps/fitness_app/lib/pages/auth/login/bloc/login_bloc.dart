import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/pages/auth/login/bloc/login_event.dart';
import 'package:fitness_app/pages/auth/login/bloc/login_state.dart';
import 'package:fitness_app/pages/auth/login/model/user_model.dart';
import 'package:fitness_app/pages/auth/login/repositories/auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LogInEmailChangedEvent>(_onEmailChanged);
    on<LogInButtonChangedEvent>(_onButtonChange);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

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

    isValidEmail == null
        ? emit(LoginState(email: email ?? '', isUsernameValid: true))
        : emit(LoginState(email: email ?? '', isUsernameValid: false));
  }

  Future<void> _onButtonChange(
    LogInButtonChangedEvent event,
    Emitter<LoginState> emit,
  ) async {
    final password = event.password;
    final email = event.email;

    final isValidEmail = FAValidator.validatorEmail(email);
    final isValidPassword = FAValidator.validatorPassword(password);

    isValidEmail == null && isValidPassword == null
        ? emit(LoginState(isValid: true))
        : emit(LoginState(isValid: false));
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginState(
        status: LoginStatus.onLoading, isUsernameValid: true, isValid: true));
    List<UserModel> list = await AuthRepository().users() ?? [];
    final listUser = list
        .where(
          (element) =>
              element.email == event.email &&
              element.password == event.password,
        )
        .toList();
    if (listUser.isEmpty) {
      emit(const LoginState(status: LoginStatus.failure));
    } else {
      emit(const LoginState(status: LoginStatus.success));
      
    }
  }
}
