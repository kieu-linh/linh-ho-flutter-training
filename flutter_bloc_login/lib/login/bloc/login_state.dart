part of 'login_bloc.dart';

enum LoginStatus {
  loading,
  success,
  failure,
  unknown,
  onValueChangedLoading,
  onValueChangedSuccess,
  onValueChangedFailure,
  onEmailChangedLoading,
  onEmailChangedSuccess,
  onEmailChangedFailure,
  onPasswordChangedLoading,
  onPasswordChangedSuccess,
  onPasswordChangedFailure,
}

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.unknown,
    this.email = '',
    this.password = '',
    this.isUsernameValid = false,
    this.isPasswordValid = false,
    this.errorMessage = '',
  });

  final LoginStatus status;
  final String email;
  final String password;
  final bool isUsernameValid;
  final bool isPasswordValid;

  // Get the current error message
  final String errorMessage;

  LoginState copyWith({
    LoginStatus? status,
    String? email,
    String? password,
    bool? isUsernameValid,
    bool? isPasswordValid,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      isUsernameValid: isUsernameValid ?? this.isUsernameValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        status,
        email,
        password,
        isUsernameValid,
        isPasswordValid,
        errorMessage,
      ];
}
