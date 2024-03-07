import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

/// The [SignUpSubmitted] is used to notify
/// when the User pressed the CreateAccountButton.
class SignUpSubmitted extends SignUpEvent {
  const SignUpSubmitted({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  @override
  List<Object> get props => [name, email, password, confirmPassword];
}

/// The [SignUpNameChanged] is used to notify
/// when the User input the full name field.
class SignUpNameChanged extends SignUpEvent {
  const SignUpNameChanged({this.name = ''});

  final String name;

  @override
  List<Object> get props => [name];
}

/// The [SignUpEmailChanged] is used to notify
/// when the User input the email field.
class SignUpEmailChanged extends SignUpEvent {
  const SignUpEmailChanged({this.email = ''});

  final String email;

  @override
  List<Object> get props => [email];
}

/// The [SignUpPasswordChanged] is used to notify
/// when the User input the password field.
class SignUpPasswordChanged extends SignUpEvent {
  const SignUpPasswordChanged({this.password = ''});

  final String password;

  @override
  List<Object> get props => [password];
}

/// The [SignUpPasswordChanged] is used to notify
/// when the User input the confirm password field.
class SignUpConfirmPasswordChanged extends SignUpEvent {
  const SignUpConfirmPasswordChanged({this.confirmPassword = ''});

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}
