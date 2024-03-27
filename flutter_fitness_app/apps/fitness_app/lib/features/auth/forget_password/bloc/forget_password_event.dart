import 'package:equatable/equatable.dart';

abstract class ForgotPassEvent extends Equatable {
  const ForgotPassEvent();

  @override
  List<Object?> get props => [];
}

/// The [ForgotPassSubmitted] is used to notify
/// when the User pressed the CreateAccountButton.
class ForgotPassSubmitted extends ForgotPassEvent {
  const ForgotPassSubmitted({
    required this.email,
  });

  final String email;

  @override
  List<Object> get props => [email];
}

/// The [inputEmailChanged] is used to notify
/// when the User input the email field.
class inputEmailChanged extends ForgotPassEvent {
  const inputEmailChanged({this.email = ''});

  final String email;

  @override
  List<Object> get props => [email];
}

/// The [inputPasswordChanged] is used to notify
/// when the User input the password field.
class inputPasswordChanged extends ForgotPassEvent {
  const inputPasswordChanged({this.newPassword = ''});

  final String newPassword;

  @override
  List<Object> get props => [newPassword];
}

/// The [inputConfirmPasswordChanged] is used to notify
/// when the User input the confirm password field.
class inputConfirmPasswordChanged extends ForgotPassEvent {
  const inputConfirmPasswordChanged({this.confirmPassword = ''});

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}

class ResetPassSubmitted extends ForgotPassEvent {
  const ResetPassSubmitted({
    required this.newPassword,
  });

  final String newPassword;

  @override
  List<Object> get props => [newPassword];
}
