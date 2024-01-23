part of 'login_bloc.dart';

enum LoginStatus { loading, success, failure, unknown }

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.unknown,
    this.email = '',
    this.password = '',
  });

  final LoginStatus status;
  final String email;
  final String password;

  LoginState copyWith({
    LoginStatus? status,
    String? email,
    String? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, email, password];
}
