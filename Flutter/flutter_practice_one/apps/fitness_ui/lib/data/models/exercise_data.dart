import 'package:fitness_ui/core/constant/images.dart';

class ExerciseModel {
  ExerciseModel();

  String? image;
  String? title;
  String? level;
  int? time;
}

List<ExerciseModel> listExercise = [
  ExerciseModel()
    ..image = FAImage.imgWomanStretch
    ..title = 'Full Shot Woman Stretching Arm'
    ..level = 'Beginner'
    ..time = 30,
  ExerciseModel()
    ..image = FAImage.imgAthlete
    ..title = 'Athlete Practicing Monochrome'
    ..level = 'Beginner'
    ..time = 50,
];
