import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/constant/path.dart';
import 'package:fitness_app/features/home/model/meal.dart';
import 'package:fitness_app/features/meal_plan/model/meal_detail.dart';

class MealRepository {
  MealRepository({
    required this.apiClient,
  });

  final ApiClient apiClient;
  
  /// This function [fetchMeal] is called when loading the meal data.
  Future<List<Meal>?> fetchMeal() async {
    try {
      /// get the meal data from the api
      final response = await this.apiClient.get(endPoint: FAPath.mealPlan);

      /// check if the response status code is 200: return the meal data
      if (response.statusCode == 200) {
        /// decode the response body and map it to a list of meals
        final data = jsonDecode(response.body) as List<dynamic>;
        final meals =
            data.map((e) => Meal.fromJson(e as Map<String, dynamic>)).toList();

        return meals;
      }

      /// else notify the user that the data failed to load
      else {
        throw Exception('Failed to load meals');
      }
    } on Failure {
      rethrow;
    }
  }

  /// This function [fetchMealDetail] is called when loading the meal data.
  Future<List<MealDetail>?> fetchMealDetail() async {
    try {
      /// get the meal data from the api
      final response = await this.apiClient.get(endPoint: FAPath.mealDetail);

      /// check if the response status code is 200: return the meal data
      if (response.statusCode == 200) {
        /// decode the response body and map it to a list of meals
        final data = jsonDecode(response.body) as List<dynamic>;
        final meals =
            data.map((e) => MealDetail.fromJson(e as Map<String, dynamic>)).toList();

        return meals;
      }

      /// else notify the user that the data failed to load
      else {
        throw Exception('Failed to load meals');
      }
    } on Failure {
      rethrow;
    }
  }

  
}
