import 'dart:convert';

import 'package:api_client/api_client.dart';
import 'package:fitness_app/core/constant/link.dart';
import 'package:fitness_app/features/exercise/model/benefit.dart';
import 'package:fitness_app/features/home/model/exercise.dart';

class ExerciseRepository {
  const ExerciseRepository();

  Future<List<Benefit>?> fetchBenefit() async {
    try {
      final response =
          await AccountServices().get(endPoint: FALink.endPointBenefit);
      if (response.statusCode == 200) {
        //print(response.body);
        final data = jsonDecode(response.body) as List<dynamic>;
        final benefits = data
            .map((e) => Benefit.fromJson(e as Map<String, dynamic>))
            .toList();
        return benefits;
      } else {
        throw Exception('Failed to load benefit');
      }
    } on Failure {
      rethrow;
    }
  }

  Future<List<Exercise>?> fetchExercise() async {
    try {
      final response = await AccountServices()
          .get(endPoint: FALink.endPointExerciseByBenefit);
      if (response.statusCode == 200) {
        //print(response.body);
        final data = jsonDecode(response.body) as List<dynamic>;
        final exercises = data
            .map((e) => Exercise.fromJson(e as Map<String, dynamic>))
            .toList();
        //print('object  ${exercises[1].benefit?.title}');
        return exercises;
      } else {
        throw Exception('Failed to load exercise');
      }
    } on Failure {
      rethrow;
    }
  }
}
