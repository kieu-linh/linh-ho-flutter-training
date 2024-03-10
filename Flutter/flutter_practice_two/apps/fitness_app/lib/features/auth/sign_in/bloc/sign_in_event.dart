import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object?> get props => [];
}

/// The [SignInSubmitted] is used to notify
/// when the User pressed the LoginButton.
class SignInSubmitted extends SignInEvent {
  const SignInSubmitted({
    this.email = '',
    this.password = '',
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

/// The [SignInEmailChanged] is used to notify
/// when the User input the email field.
class SignInEmailChanged extends SignInEvent {
  const SignInEmailChanged({this.email = ''});

  final String email;

  @override
  List<Object> get props => [email];
}

/// The [SignInPasswordChanged] is used to notify
/// when the User input the password field.
class SignInPasswordChanged extends SignInEvent {
  const SignInPasswordChanged({
    this.password = '',
  });

  final String password;

  @override
  List<Object> get props => [password];
}

/// The [SignOutRequested] is used to notify
/// when the User pressed the LogOutButton.
class SignOutRequested extends SignInEvent {}
