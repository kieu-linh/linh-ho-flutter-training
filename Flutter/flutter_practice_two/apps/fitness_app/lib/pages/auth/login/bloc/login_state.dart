import 'package:equatable/equatable.dart';

enum LoginStatus {
  initial,
  onLoading,
  success,
  failure,
}

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    this.email = '',
    this.password = '',
    this.errorMessage = '',
    this.isEmailValid = false,
    this.isValid = false,
  });

  final LoginStatus status;
  final String email;
  final String password;
  final bool isEmailValid;
  final bool isValid;
  final String errorMessage;

  LoginState copyWith({
    LoginStatus? status,
    String? email,
    String? password,
    bool? isEmailValid,
    bool? isValid,
    String? errorMessage,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        email,
        password,
        isEmailValid,
        isValid,
        errorMessage,
      ];
}
