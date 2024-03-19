import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/constant/path.dart';
import 'package:fitness_app/features/auth/sign_in/model/user_model.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';

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
            (element) => element.email == email && element.password == password,
          )
          .toList();

      /// If user account is not found, it will throw an error.
      if (user.isEmpty) {
        throw Failure(400, FAUiS.current.errorMessage);
      } else {
        print('object ${user.first.name}');
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
    print('oo ${response.statusCode}');
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
      print('oo ${user.length}}');

      /// If user account is empty, it will push account data.
      if (user.isEmpty) {
        print('object vao r2');
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
        print('object vao r');
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
