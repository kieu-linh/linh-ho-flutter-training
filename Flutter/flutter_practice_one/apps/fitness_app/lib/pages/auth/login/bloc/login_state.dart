import 'package:equatable/equatable.dart';

enum LoginStatus {
  initial,
  inProgress,
  onValueChangedLoading,
  onValueChangedSuccess,
  onValueChangedFailure,
  onEmailChangedLoading,
  onEmailChangedSuccess,
  onEmailChangedFailure,
  onPasswordChangedLoading,
  onPasswordChangedSuccess,
  onPasswordChangedFailure,
  onShowPassword,
  onHiddenPassword,
  success,
  failure,
  canceled,
}

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    this.email = '',
    this.password = '',
    this.errorMessage = '',
    this.isUsernameValid = false,
    this.isPasswordValid = false,
  });

  final LoginStatus status;
  final String email;
  final String password;
  final bool isUsernameValid;
  final bool isPasswordValid;
  final String errorMessage;

  @override
  List<Object?> get props => [
        status,
        email,
        password,
        isUsernameValid,
        isPasswordValid,
        errorMessage,
      ];
}
