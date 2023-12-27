import 'dart:ui';

import 'package:flutter_practice_one/core/color/app_color.dart';
import 'package:flutter_practice_one/core/constant/images.dart';

class AddExerciseModel {
  AddExerciseModel();

  String? image;
  String? description;
  int? kcal;
  int? min;
  String? level;
  Color? backgroundColor;
}

List<AddExerciseModel> listAddExercise = [
  AddExerciseModel()
    ..image = FAImage.imgJumpRope
    ..description = 'Exercises with Jumping Rope'
    ..kcal = 110
    ..min = 10
    ..level = 'Beginner'
    ..backgroundColor = AppColor.containerSecond,
  AddExerciseModel()
    ..image = FAImage.imgHoldJump
    ..description = 'Exercises with Holding Jumping Rope '
    ..kcal = 135
    ..min = 8
    ..level = 'Beginner'
    ..backgroundColor = AppColor.iconColor,
  AddExerciseModel()
    ..image = FAImage.imgGirlDumbbell
    ..description = 'Exercises with Sitting Dumbbells'
    ..kcal = 135
    ..min = 5
    ..level = 'Beginner'
    ..backgroundColor = AppColor.containerThird,
];
