part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState._({this.status = AuthenticationStatus.unknown});
  final AuthenticationStatus status;

  @override
  List<Object> get props => [status];
}

// unauthenticated
class AuthenticationUnauthenticated extends AuthenticationState {
  const AuthenticationUnauthenticated()
      : super._(status: AuthenticationStatus.unauthenticated);
}

// authenticated
class AuthenticationAuthenticated extends AuthenticationState {
  const AuthenticationAuthenticated()
      : super._(status: AuthenticationStatus.authenticated);
}

// unknown
class AuthenticationUnknown extends AuthenticationState {
  const AuthenticationUnknown() : super._(status: AuthenticationStatus.unknown);
}

// Error
class AuthenticationError extends AuthenticationState {
  const AuthenticationError() : super._(status: AuthenticationStatus.error);
}