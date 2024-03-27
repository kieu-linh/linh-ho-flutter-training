import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/constant/path.dart';
import 'package:fitness_app/core/utils/encode.dart';
import 'package:fitness_app/features/auth/sign_in/model/user_model.dart';
import 'package:fitness_ui/l10n/generated/l10n.dart';

class AuthRepository {
  AuthRepository(this.apiClient);

  /// This is an instance of [ApiClient] to call API
  final ApiClient apiClient;

  /// This function [signIn] is called when the user presses the sign in button.
  Future<User> signIn({
    String email = '',
    String password = '',
  }) async {
    /// get account data from server
    final response = await this.apiClient.get(endPoint: FAPath.login);

    /// If the server returns a 200 OK response, it will return the user account data.
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final data = jsonDecode(response.body) as List<dynamic>;

      final listUser =
          data.map((e) => User.fromJson(e as Map<String, dynamic>)).toList();

      /// check user account has in list data or not
      final user = listUser
          .where(
            (element) =>
                element.email == email &&
                Encode.decryptPassword(element.password ?? '') ==
                    password.trim(),
          )
          .toList();

      /// If user account is not found, it will throw an error.
      if (user.isEmpty) {
        throw Failure(400, FAUiS.current.errorMessage);
      } else {
        return user.first;
      }
    } else {
      throw Failure(
        response.statusCode,
        jsonDecode(response.body)['message'],
      );
    }
  }

  Future<User> signUp({
    String name = '',
    String email = '',
    String password = '',
  }) async {
    final response = await this.apiClient.get(endPoint: FAPath.login);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;

      final listUser =
          data.map((e) => User.fromJson(e as Map<String, dynamic>)).toList();

      /// check user account has in list data or not
      final user = listUser
          .where(
            (element) => element.email == email,
          )
          .toList();

      /// If user account is empty, it will push account data.
      if (user.isEmpty) {
        this.apiClient.post(
              endpoint: FAPath.signUp,
              body: jsonEncode(
                {
                  'name': name,
                  'email': email,
                  'password': password,
                },
              ),
            );

        /// get account data from server and return it.
        User newUser = User(
          name: name,
          email: email,
          password: password,
        );
        return newUser;
      } else {
        throw Failure(400, FAUiS.current.accountExist);
      }
    } else {
      throw Failure(
        response.statusCode,
        jsonDecode(response.body)['message'],
      );
    }
  }
}
