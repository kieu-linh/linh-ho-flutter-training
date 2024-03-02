import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/constant/link.dart';
import 'package:fitness_app/features/home/model/category.dart';

class CategoryRepository {
  const CategoryRepository();

  Future<List<Category>?> fetchCategory() async {
    try {
      final response =
          await AccountServices().get(endPoint: FALink.endPointCategory);
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
