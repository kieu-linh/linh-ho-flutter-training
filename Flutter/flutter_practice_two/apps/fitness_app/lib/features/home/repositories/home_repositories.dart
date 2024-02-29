import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/constant/link.dart';
import 'package:fitness_app/features/home/model/category.dart';
import 'package:fitness_app/features/home/model/goal.dart';
import 'package:fitness_app/features/home/model/meal.dart';

class HomeRepository {
  const HomeRepository();

  Future<List<Goal>?> fetchGoals() async {
    try {
      final response =
          await AccountServices().get(endPoint: FALink.endPointGoal);
      if (response.statusCode == 200) {
        //print(response.body);
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

  Future<List<Category>?> fetchCategory() async {
    try {
      final response =
          await AccountServices().get(endPoint: FALink.endPointCategory);
      if (response.statusCode == 200) {
        //print(response.body);
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

  Future<List<Meal>?> fetchMeal() async {
    try {
      final response =
          await AccountServices().get(endPoint: FALink.endPointMeal);
      if (response.statusCode == 200) {
        print(response.body);
        final data = jsonDecode(response.body) as List<dynamic>;
        final meals =
            data.map((e) => Meal.fromJson(e as Map<String, dynamic>)).toList();
        return meals;
      } else {
        throw Exception('Failed to load users');
      }
    } on Failure {
      rethrow;
    }
  }
}
