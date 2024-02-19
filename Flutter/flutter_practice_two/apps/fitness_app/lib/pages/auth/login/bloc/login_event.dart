import 'package:equatable/equatable.dart';
import 'package:fitness_app/pages/auth/login/bloc/login_state.dart';

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
  const LogInPasswordChangedEvent({required this.state});

  final LoginStatus state;

  @override
  List<Object> get props => [state];
}

/// The [LogOutRequestedEvent] is used to notify
/// when the User pressed the LogOutButton.
class LogOutRequestedEvent extends LoginEvent {}
