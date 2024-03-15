import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/constant/path.dart';
import 'package:fitness_app/features/home/model/goal.dart';

class GoalRepository {
  const GoalRepository(this.apiClient);

  /// This is an instance of the [ApiClient] class.
  final ApiClient apiClient;

  /// This function [fetchGoal] is called when loading the Goal data.
  Future<List<Goal>?> fetchGoal() async {
    try {
      final response =
          await this.apiClient.get(endPoint: FAPath.goalOnboarding);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        final goals =
            data.map((e) => Goal.fromJson(e as Map<String, dynamic>)).toList();

        return goals;
      } else {
        throw Exception('Failed to load Goals');
      }
    } on Failure {
      rethrow;
    }
  }
}
