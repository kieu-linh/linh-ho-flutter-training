import 'package:fitness_app/data/models/exercise_data.dart';
import 'package:fitness_ui/core/constant/images.dart';

class ExerciseSeeds {
  static List<Exercise> listExercise = [
  Exercise()
    ..image = FAImage.imgWomanStretch
    ..title = 'Full Shot Woman Stretching Arm'
    ..level = 'Beginner'
    ..time = 30,
  Exercise()
    ..image = FAImage.imgAthlete
    ..title = 'Athlete Practicing Monochrome'
    ..level = 'Beginner'
    ..time = 50,
];

}
