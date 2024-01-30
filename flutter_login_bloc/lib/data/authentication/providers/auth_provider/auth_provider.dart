enum AuthenticationStatus { unknown, authenticated, unauthenticated, error }

abstract class AuthenticationProvider {
  Future<AuthenticationStatus> login({
    required String email,
    required String password,
  });
  Future<AuthenticationStatus> logout();
}
