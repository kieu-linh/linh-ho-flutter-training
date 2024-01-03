// ignore_for_file: lines_longer_than_80_chars

import 'dart:ui';

import 'package:fitness_ui/core/color/app_color.dart';
import 'package:fitness_ui/core/constant/images.dart';

class AddExerciseModel {
  AddExerciseModel();

  String? image;
  String? title;
  int? kcal;
  int? min;
  String? level;
  Color? backgroundColor;
  String? category;
  String? backgroundImage;
  String? weight;
  String? description;
  int? weeks;
  int? exerciseNumber;
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
    ..title = 'Exercises with Jumping Rope'
    ..kcal = 110
    ..min = 10
    ..level = 'Beginner'
    ..backgroundColor = AppColor.containerSecond
    ..category = listCategoryExercise[1],
  AddExerciseModel()
    ..image = FAImage.imgHoldJump
    ..title = 'Exercises with Holding Jumping Rope '
    ..kcal = 135
    ..min = 8
    ..level = 'Beginner'
    ..backgroundColor = AppColor.iconColor
    ..category = listCategoryExercise[1],
  AddExerciseModel()
    ..image = FAImage.imgGirlDumbbell
    ..title = 'Exercises with Sitting \nDumbbells'
    ..kcal = 135
    ..min = 5
    ..level = 'Beginner'
    ..backgroundColor = AppColor.containerThird
    ..category = listCategoryExercise[0]
    ..backgroundImage = FAImage.imgExerciseDumbbell
    ..weight = 'Lose'
    ..description =
        'There are many variations of passages of Lorem \nIpsum available, but the majority have suffered \nalteration in some form, by injected humour.'
    ..weeks = 3
    ..exerciseNumber = 20,
  AddExerciseModel()
    ..image = FAImage.imgYogaExercise
    ..title = 'Exercises with Yoga'
    ..kcal = 140
    ..min = 10
    ..level = 'Beginner'
    ..backgroundColor = AppColor.containerSecond
    ..category = listCategoryExercise[1],
  AddExerciseModel()
    ..image = FAImage.imgHoldJump
    ..title = 'Exercises with Holding Jumping Rope '
    ..kcal = 135
    ..min = 8
    ..level = 'Beginner'
    ..backgroundColor = AppColor.iconColor
    ..category = listCategoryExercise[1],
];
