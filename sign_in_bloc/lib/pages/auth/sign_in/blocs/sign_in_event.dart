// The AuthEvent is used to notify the interact of User.

import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

/// The [SignInRequestedEvent] is used to notify
/// when the User pressed the SignInButton.
class SignInRequestedEvent extends AuthEvent {
  const SignInRequestedEvent(this.username, this.password);

  final String username;
  final String password;

  @override
  List<Object> get props => [username, password];
}

/// The [SignInUsernameChangedEvent] is used to notify
/// when the User input the username form.
class SignInUsernameChangedEvent extends AuthEvent {
  const SignInUsernameChangedEvent({this.username});

  final String? username;

  @override
  List<Object> get props => [username ?? ''];
}

/// The [SignInPasswordChangedEvent] is used to notify
/// when the User input the password form.
class SignInPasswordChangedEvent extends AuthEvent {
  const SignInPasswordChangedEvent({this.password});

  final String? password;

  @override
  List<Object> get props => [password ?? ''];
}

/// The [SignOutRequestedEvent] is used to notify
/// when the User pressed the SignOutButton.
class SignOutRequestedEvent extends AuthEvent {}