import 'dart:async';
import 'package:api_client/api_client.dart';
import 'package:sign_in_bloc/pages/auth/sign_in/models/user_model.dart';

/// This is a repository that handles authentication.
/// It is responsible for logging in, signing out,
/// and checking if any user is logged in.
class AuthRepository {
  /// Creates an [AuthRepository] with the given [client] and [storage].
  const AuthRepository({
    required this.client,
  });

  /// The API client that is used to make network requests.
  final ApiClient client;

  /// The storage that is used to persist data between sessions.

  /// This function takes a username and password and returns a [UserModel]
  /// if the login was successful or throws an error if it was not.
  Future<UserModel> signIn({
    required String username,
    required String password,
  }) async {
    final response = await client.post(
      'api/v1/login',
      body: UserModel(
        username: username,
        password: password,
      ).toJson(),
    );

    final data = UserModel.fromJson(response.body);

    //await storage.setString(
     // userIdKey,
     // data.userId ?? '',
    //);

    return data;
  }

  /// Sign out the user by removing their user ID from storage.
  Future<void> signOut() async {
    try {
      await Future<void>.delayed(const Duration(seconds: 2));
      //await storage.removeData(userIdKey);
    } on Exception {
      rethrow;
    }
  }

  /// Checks if any user is logged in.
  /// Returns true if any user is logged in, false otherwise.
  /*Future<bool> isAnyUserLoggedIn() async {
    try {
      final userId = await storage.getString(userIdKey);
      return userId != '' && userId.isNotEmpty;
    } on Exception {
      rethrow;
    }
  }*/
}

