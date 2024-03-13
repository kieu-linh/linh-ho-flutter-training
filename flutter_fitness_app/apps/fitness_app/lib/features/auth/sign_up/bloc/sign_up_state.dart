import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/utils/status.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.status = SubmissionStatus.initial,
    this.name = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.errorMessage = '',
    this.isEmailValid = false,
    this.isValid = false,
  });

  final SubmissionStatus status;
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final bool isEmailValid;
  final bool isValid;
  final String errorMessage;

  SignUpState copyWith({
    SubmissionStatus? status,
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isEmailValid,
    bool? isValid,
    String? errorMessage,
  }) {
    return SignUpState(
      status: status ?? this.status,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        name,
        email,
        password,
        confirmPassword,
        isEmailValid,
        isValid,
        errorMessage,
      ];
}
