import 'package:equatable/equatable.dart';

enum LoginStatus {
  initial,
  onLoading,
  onEmailChangedLoading,
  onPasswordChangedLoading,
  success,
  failure,
}

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    this.email = '',
    this.password = '',
    this.errorMessage = '',
    this.isUsernameValid = false,
    this.isValid = false,
  });

  final LoginStatus status;
  final String email;
  final String password;
  final bool isUsernameValid;
  final bool isValid;
  final String errorMessage;

  @override
  List<Object?> get props => [
        status,
        email,
        password,
        isUsernameValid,
        isValid,
        errorMessage,
      ];
}
