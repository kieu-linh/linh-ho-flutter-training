import 'dart:ui';

import 'package:fitness_ui/core/color/app_color.dart';
import 'package:fitness_ui/core/constant/images.dart';
class AddExerciseModel {
  AddExerciseModel();

  String? image;
  String? description;
  int? kcal;
  int? min;
  String? level;
  Color? backgroundColor;
  String? category;
}

List<String> listCategoryExercise = [
  'Cardio',
  'Legs',
  'Back',
  'Chest',
];

List<AddExerciseModel> listAddExercise = [
  AddExerciseModel()
    ..image = FAImage.imgJumpRope
    ..description = 'Exercises with Jumping Rope'
    ..kcal = 110
    ..min = 10
    ..level = 'Beginner'
    ..backgroundColor = AppColor.containerSecond
    ..category = listCategoryExercise[1],
  AddExerciseModel()
    ..image = FAImage.imgHoldJump
    ..description = 'Exercises with Holding Jumping Rope '
    ..kcal = 135
    ..min = 8
    ..level = 'Beginner'
    ..backgroundColor = AppColor.iconColor
    ..category = listCategoryExercise[1],
  AddExerciseModel()
    ..image = FAImage.imgGirlDumbbell
    ..description = 'Exercises with Sitting Dumbbells'
    ..kcal = 135
    ..min = 5
    ..level = 'Beginner'
    ..backgroundColor = AppColor.containerThird
    ..category = listCategoryExercise[1],
  AddExerciseModel()
    ..image = FAImage.imgYogaExercise
    ..description = 'Exercises with Yoga'
    ..kcal = 140
    ..min = 10
    ..level = 'Beginner'
    ..backgroundColor = AppColor.containerSecond
    ..category = listCategoryExercise[1],
  AddExerciseModel()
    ..image = FAImage.imgHoldJump
    ..description = 'Exercises with Holding Jumping Rope '
    ..kcal = 135
    ..min = 8
    ..level = 'Beginner'
    ..backgroundColor = AppColor.iconColor
    ..category = listCategoryExercise[1],
];
