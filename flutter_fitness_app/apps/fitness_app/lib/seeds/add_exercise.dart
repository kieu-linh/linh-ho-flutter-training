import 'dart:ui';

import 'package:fitness_app/models/exercise.dart';
import 'package:fitness_ui/core/color/app_color.dart';
import 'package:fitness_ui/core/constant/images.dart';

class ExerciseSeeds {
  static List<Exercise> listAddExercise = [
    Exercise()
      ..imagePath = FAImage.imgJumpRope
      ..title = 'Exercises with Jumping Rope'
      ..kcal = 110
      ..min = 10
      ..level = 'Beginner'
      ..backgroundImage = FAImage.imgExerciseDumbbell
      ..backgroundColor = const Color.fromRGBO(250, 188, 6, 1)
      ..category = listCategoryExercise[0],
    Exercise()
      ..imagePath = FAImage.imgHoldJump
      ..title = 'Exercises with Holding Jumping Rope '
      ..kcal = 135
      ..min = 8
      ..level = 'Beginner'
      ..backgroundImage = FAImage.imgExerciseDumbbell
      ..backgroundColor = AppColor.iconColor
      ..category = listCategoryExercise[0],
    Exercise()
      ..imagePath = FAImage.imgGirlDumbbell
      ..title = 'Exercises with Sitting \nDumbbells'
      ..kcal = 135
      ..min = 5
      ..level = 'Beginner'
      ..backgroundColor = AppColor.containerThird
      ..category = listCategoryExercise[0]
      ..backgroundImage = FAImage.imgExerciseDumbbell
      ..weight = 'Lose'
      ..description =
          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour.'
      ..weeks = 3
      ..exerciseNumber = 20,
    Exercise()
      ..imagePath = FAImage.imgYogaExercise
      ..title = 'Exercises with Yoga'
      ..kcal = 140
      ..min = 10
      ..level = 'Beginner'
      ..backgroundImage = FAImage.imgExerciseDumbbell
      ..backgroundColor = AppColor.containerSecond
      ..category = listCategoryExercise[0],
    Exercise()
      ..imagePath = FAImage.imgHoldJump
      ..title = 'Exercises with Holding Jumping Rope '
      ..kcal = 135
      ..min = 8
      ..level = 'Beginner'
      ..backgroundImage = FAImage.imgExerciseDumbbell
      ..backgroundColor = AppColor.iconColor
      ..category = listCategoryExercise[0],
    Exercise()
      ..imagePath = FAImage.imgJumpRope
      ..title = 'Exercises with Jumping Rope'
      ..kcal = 110
      ..min = 10
      ..level = 'Beginner'
      ..backgroundImage = FAImage.imgExerciseDumbbell
      ..backgroundColor = AppColor.containerSecond
      ..category = listCategoryExercise[1],
  ];
}

List<String> listCategoryExercise = [
  'Cardio',
  'Legs',
  'Back',
  'Chest',
];
