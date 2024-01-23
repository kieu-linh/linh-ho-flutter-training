import 'package:flutter_bloc_login/data/providers/auth_provider.dart';

class DummyAuthProvider implements AuthenticationProvider {
  DummyAuthProvider();

  @override
  Future<AuthenticationStatus> login(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
 
    if (email == 'email' && password == 'password') {
      return AuthenticationStatus.authenticated;
    } else {
      return AuthenticationStatus.unAuthenticated;
    }
  }

  @override
  Future<AuthenticationStatus> logout() {
    throw UnimplementedError();
  }
}
