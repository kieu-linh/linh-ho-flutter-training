import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/storage/shared_prefs.dart';
import 'package:fitness_app/core/utils/validator.dart';
import 'package:fitness_app/features/auth/login/bloc/login_event.dart';
import 'package:fitness_app/features/auth/login/bloc/login_state.dart';
import 'package:fitness_app/features/auth/login/model/user_model.dart';
import 'package:fitness_app/features/auth/login/repositories/auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LogInEmailChanged>(_onEmailChanged);
    on<LogInPasswordChanged>(_onPasswordChange);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onEmailChanged(
    LogInEmailChanged event,
    Emitter<LoginState> emit,
  ) async {
    /// This code is called when the value of the
    /// email form field on the sign in screen changes.

    /// It checks to see if the email and password are valid.
    bool isFormValid = _checkFormValid(event.email ?? '', state.password);

    emit(state.copyWith(
      status: LoginStatus.initial,
      email: event.email ?? '',
      isEmailValid: FAValidator.validatorEmail(event.email) == null,
      isValid: isFormValid,
    ));
  }

  Future<void> _onPasswordChange(
    LogInPasswordChanged event,
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
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    /// This code is called when the user presses the sign in button.
    emit(state.copyWith(status: LoginStatus.onLoading));

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

    /// If the email and password are empty, it emits a [LoginInFailureState],
    /// otherwise it emits a [LoginInSuccessState].
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
    return FAValidator.validatorEmail(email) == null &&
        FAValidator.validatorPassword(pass) == null;
  }
}
