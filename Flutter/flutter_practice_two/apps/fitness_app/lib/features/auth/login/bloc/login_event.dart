import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

/// The [LoginSubmitted] is used to notify
/// when the User pressed the LoginButton.
class LoginSubmitted extends LoginEvent {
  const LoginSubmitted({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

/// The [LogInEmailChanged] is used to notify
/// when the User input the username form.
class LogInEmailChanged extends LoginEvent {
  const LogInEmailChanged({this.email});

  final String? email;

  @override
  List<Object> get props => [email ?? ''];
}

/// The [LogInPasswordChanged] is used to notify
/// when the User input the password form.
class LogInPasswordChanged extends LoginEvent {
  const LogInPasswordChanged({
    required this.password,
  });

  final String password;

  @override
  List<Object> get props => [password];
}

/// The [LogOutRequested] is used to notify
/// when the User pressed the LogOutButton.
class LogOutRequested extends LoginEvent {}
