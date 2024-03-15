import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/constant/path.dart';
import 'package:fitness_app/features/onboarding/level/model/level.dart';

class LevelRepository {
  const LevelRepository(this.apiClient);

  /// This is an instance of the [ApiClient] class.
  final ApiClient apiClient;

  /// This function [fetchLevel] is called when loading the Level data.
  Future<List<Level>?> fetchLevel() async {
    try {
      final response = await this.apiClient.get(endPoint: FAPath.level);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        final levels =
            data.map((e) => Level.fromJson(e as Map<String, dynamic>)).toList();

        return levels;
      } else {
        throw Exception('Failed to load levels');
      }
    } on Failure {
      rethrow;
    }
  }
}
