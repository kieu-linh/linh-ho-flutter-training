import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

/// The [LoginSubmittedEvent] is used to notify
/// when the User pressed the LoginButton.
class LoginSubmittedEvent extends LoginEvent {
  const LoginSubmittedEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

/// The [LogInEmailChangedEvent] is used to notify
/// when the User input the username form.
class LogInEmailChangedEvent extends LoginEvent {
  const LogInEmailChangedEvent({this.email});

  final String? email;

  @override
  List<Object> get props => [email ?? ''];
}

/// The [LogInPasswordChangedEvent] is used to notify
/// when the User input the password form.
class LogInPasswordChangedEvent extends LoginEvent {
  const LogInPasswordChangedEvent({
    required this.password,
  });

  final String password;

  @override
  List<Object> get props => [password];
}

/// The [LogOutRequestedEvent] is used to notify
/// when the User pressed the LogOutButton.
class LogOutRequestedEvent extends LoginEvent {}
