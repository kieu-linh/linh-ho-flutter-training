import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/constant/link.dart';
import 'package:fitness_app/features/auth/login/model/user_model.dart';

class AuthRepository {
  Future<List<User>?> users() async {
    final response =
        await AccountServices().get(endPoint: FALink.endPointLogin);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      final users =
          data.map((e) => User.fromJson(e as Map<String, dynamic>)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
