import 'providers/auth_provider/auth_provider.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    required AuthenticationProvider authenticationProvider,
  }) : _authenticationProvider = authenticationProvider;

  final AuthenticationProvider _authenticationProvider;

  Future<AuthenticationStatus> logIn({
    required String email,
    required String password,
  }) async {
    return await _authenticationProvider.login(
      email: email,
      password: password,
    );
  }

  Future<void> logOut() async {
    await _authenticationProvider.logout();
  }
}
