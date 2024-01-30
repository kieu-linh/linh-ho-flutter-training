import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:fitness_app/pages/auth/login/model/user_model.dart';

class AuthRepository {
  Future<List<UserModel>?> users() async {
    final response = await AccountServices().getUser();
    final data = jsonDecode(response.body) as List<dynamic>;
    final users =
        data.map((e) => UserModel.fromJson(e as Map<String, dynamic>)).toList();
    return users;
  }
}
