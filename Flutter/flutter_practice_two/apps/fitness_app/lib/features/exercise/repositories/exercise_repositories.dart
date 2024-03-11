import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/constant/path.dart';
import 'package:fitness_app/features/exercise/model/benefit.dart';
import 'package:fitness_app/features/home/model/exercise.dart';

class ExerciseRepository {
  const ExerciseRepository(this.apiClient);

  final ApiClient apiClient;

  /// This function [fetchBenefit] is called when loading the benefit data.
  Future<List<Benefit>?> fetchBenefit() async {
    try {
      
      /// get the benefit data from the api
      final response = await this.apiClient.get(endPoint: FAPath.benefit);

      /// check if the response status code is 200
      if (response.statusCode == 200) {
        
        /// decode the response body and map it to a list of benefits
        final data = jsonDecode(response.body) as List<dynamic>;
        final benefits = data
            .map((e) => Benefit.fromJson(e as Map<String, dynamic>))
            .toList();

        return benefits;
      } 
      
      /// if the response status code is not 200, throw an exception
      else {
        throw Exception('Failed to load benefit');
      }
    } on Failure {
      rethrow;
    }
  }

  /// This function [fetchExercise] is called when loading the exercise data.
  Future<List<Exercise>?> fetchExercise() async {
    try {

      /// get the exercise data from the api
      final response =
          await this.apiClient.get(endPoint: FAPath.exerciseByBenefit);

      /// check if the response status code is 200: return the exercise data
      if (response.statusCode == 200) {

        final data = jsonDecode(response.body) as List<dynamic>;
        final exercises = data
            .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
            .toList();

        return exercises;
      } 
      
      /// else throw an exception
      else {
        throw Exception('Failed to load exercise');
      }
    } on Failure {
      rethrow;
    }
  }
}
