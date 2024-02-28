import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/constant/link.dart';
import 'package:fitness_app/features/home/model/goal.dart';

class HomeRepository {
  const HomeRepository();

  Future<List<Goal>?> fetchGoals() async {
    try {
      final response =
          await AccountServices().get(endPoint: FALink.endPointGoal);
      if (response.statusCode == 200) {
        print(response.body);
        final data = jsonDecode(response.body) as List<dynamic>;
        final goals =
            data.map((e) => Goal.fromJson(e as Map<String, dynamic>)).toList();
        return goals;
      } else {
        throw Exception('Failed to load users');
      }
    } on Failure {
      rethrow;
    }
  }
}
