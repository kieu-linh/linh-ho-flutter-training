import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/constant/path.dart';
import 'package:fitness_app/features/home/model/category.dart';
import 'package:fitness_app/features/home/model/exercise.dart';
import 'package:fitness_app/features/home/model/goal.dart';
import 'package:fitness_app/features/home/model/meal.dart';

class HomeRepository {
  const HomeRepository(this.apiClient);

  final ApiClient apiClient;

  /// This function [fetchGoals] is called when loading the goal data.
  Future<List<Goal>?> fetchGoals() async {
    try {
      /// get the goal data from the api
      final response = await this.apiClient.get(endPoint: FAPath.goal);

      /// check if the response status code is 200: return the goal data
      if (response.statusCode == 200) {
        /// decode the response body and map it to a list of goals
        final data = jsonDecode(response.body) as List<dynamic>;
        final goals =
            data.map((e) => Goal.fromJson(e as Map<String, dynamic>)).toList();

        return goals;
      }

      /// else notify the user that the data failed to load
      else {
        throw Exception('Failed to load goals');
      }
    } on Failure {
      rethrow;
    }
  }

  /// This function [fetchCategory] is called when loading the category data.
  Future<List<Category>?> fetchCategory() async {
    try {
      /// get the category data from the api
      final response = await this.apiClient.get(endPoint: FAPath.category);

      /// check if the response status code is 200: return the category data
      if (response.statusCode == 200) {
        /// decode the response body and map it to a list of categories
        final data = jsonDecode(response.body) as List<dynamic>;
        final categories = data
            .map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList();

        return categories;
      }

      /// else notify the user that the data failed to load
      else {
        throw Exception('Failed to load category');
      }
    } on Failure {
      rethrow;
    }
  }

  /// This function [fetchMeal] is called when loading the meal data.
  Future<List<Meal>?> fetchMeal() async {
    try {
      /// get the meal data from the api
      final response = await this.apiClient.get(endPoint: FAPath.meal);

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

  /// This function [fetchPopularExercise] is called when loading the popular exercise data.
  Future<List<Exercise>?> fetchPopularExercise() async {
    try {
      /// get the popular exercise data from the api
      final response =
          await this.apiClient.get(endPoint: FAPath.popularExercise);

      /// check if the response status code is 200: return the popular exercise data
      if (response.statusCode == 200) {
        /// decode the response body and map it to a list of popular exercises
        final data = jsonDecode(response.body) as List<dynamic>;
        final exercises = data
            .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
            .toList();

        return exercises;
      }

      /// else notify the user that the data failed to load
      else {
        throw Exception('Failed to load popular exercises');
      }
    } on Failure {
      rethrow;
    }
  }

  /// This function [fetchAddExercise] is called when loading the add exercise data.
  Future<List<Exercise>?> fetchAddExercise() async {
    try {
      /// get the add exercise data from the api
      final response = await this.apiClient.get(endPoint: FAPath.exercise);

      /// check if the response status code is 200: return the add exercise data
      if (response.statusCode == 200) {
        /// decode the response body and map it to a list of add exercises
        final data = jsonDecode(response.body) as List<dynamic>;
        final exercises = data
            .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
            .toList();

        return exercises;
      } 
      
      /// else notify the user that the data failed to load
      else {
        throw Exception('Failed to add exercises');
      }
    } on Failure {
      rethrow;
    }
  }
}
