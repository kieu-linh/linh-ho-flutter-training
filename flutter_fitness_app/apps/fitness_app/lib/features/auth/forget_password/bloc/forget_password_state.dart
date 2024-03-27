import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/utils/status.dart';

class ForgotPassState extends Equatable {
  const ForgotPassState({
    this.status = SubmissionStatus.initial,
    this.email = '',
    this.newPassword = '',
    this.confirmPassword = '',
    this.errorMessage = '',
    this.isValid = false,
    this.isEmailValid = false,
  });

  final SubmissionStatus status;
  final String email;
  final String newPassword;
  final String confirmPassword;
  final bool isValid;
  final bool isEmailValid;
  final String errorMessage;

  ForgotPassState copyWith({
    SubmissionStatus? status,
    String? email,
    String? newPassword,
    String? confirmPassword,
    bool? isValid,
    String? errorMessage,
    bool? isEmailValid,
  }) {
    return ForgotPassState(
      status: status ?? this.status,
      email: email ?? this.email,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isValid: isValid ?? this.isValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        email,
        newPassword,
        confirmPassword,
        isValid,
        isEmailValid,
        errorMessage,
      ];
}
