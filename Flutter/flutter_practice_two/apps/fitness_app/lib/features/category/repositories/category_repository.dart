import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/constant/path.dart';
import 'package:fitness_app/features/home/model/category.dart';

class CategoryRepository {
  const CategoryRepository(this.apiClient);

  final ApiClient apiClient;

  Future<List<Category>?> fetchCategory() async {
    try {
      final response = await this.apiClient.get(endPoint: FAPath.category);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List<dynamic>;
        final categories = data
            .map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList();
        return categories;
      } else {
        throw Exception('Failed to load users');
      }
    } on Failure {
      rethrow;
    }
  }
}
