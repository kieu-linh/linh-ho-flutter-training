import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/utils/status.dart';

class ChangePassState extends Equatable {
  const ChangePassState({
    this.status = SubmissionStatus.initial,
    this.currentPassword = '',
    this.newPassword = '',
    this.errorMessage = '',
    this.isValid = false,
  });

  final SubmissionStatus status;
  final String newPassword;
  final String currentPassword;
  final bool isValid;
  final String errorMessage;

  ChangePassState copyWith({
    SubmissionStatus? status,
    String? currentPassword,
    String? newPassword,
    bool? isValid,
    String? errorMessage,
  }) {
    return ChangePassState(
      status: status ?? this.status,
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        currentPassword,
        newPassword,
        isValid,
        errorMessage,
      ];
}
