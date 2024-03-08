import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/constant/path.dart';
import 'package:fitness_app/features/auth/sign_in/model/user_model.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';

class AuthRepository {
  AuthRepository(this.apiClient);

  final ApiClient apiClient;

  Future<User> signIn({
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
            (element) => element.email == email && element.password == password,
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
        throw Failure(400, 'Account already exists!');
      }
    } else {
      throw Failure(
        response.statusCode,
        jsonDecode(response.body)['message'],
      );
    }
  }
}
