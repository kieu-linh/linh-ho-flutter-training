import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/constant/path.dart';
import 'package:fitness_app/features/auth/login/model/user_model.dart';

class AuthRepository {
  AuthRepository(this.apiClient);

  final ApiClient apiClient;

  Future<List<User>?> users() async {
    final response = await this.apiClient.get(endPoint: FALink.login);
    final data = jsonDecode(response.body) as List<dynamic>;
    final users =
        data.map((e) => User.fromJson(e as Map<String, dynamic>)).toList();

    return users;
  }
}
