enum AuthenticationStatus { unKnown, authenticated, unAuthenticated, error }

abstract class AuthenticationProvider {
  //Future<AuthenticationStatus> getAuthenticationStatus();
  Future<AuthenticationStatus> login({required String email, required String password});
  //Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<AuthenticationStatus> logout();
}
