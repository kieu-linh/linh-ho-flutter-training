import 'package:fitness_app/models/macronutrient_goal.dart';
import 'package:fitness_ui/core/constant/images.dart';

class MacronutrientGoalSeeds {
  static List<MacronutrientGoal> listMacronutrientGoal = [
    MacronutrientGoal()
      ..imagePath = FAImage.imgProtein
      ..title = 'Protein'
      ..gam = 130
      ..description = 'Grams per day',
    MacronutrientGoal()
      ..imagePath = FAImage.imgCarbs
      ..title = 'Carbs'
      ..gam = 235
      ..description = 'Grams per day',
    MacronutrientGoal()
      ..imagePath = FAImage.imgFat
      ..title = 'Fat'
      ..gam = 60
      ..description = 'Grams per day',
  ];
}
