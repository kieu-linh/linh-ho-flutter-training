import 'package:fitness_app/data/models/macronutrient_goal_data.dart';
import 'package:fitness_ui/core/constant/images.dart';

class MacronutrientGoalSeeds {
  static List<MacronutrientGoal> listMacronutrientGoal = [
    MacronutrientGoal()
      ..image = FAImage.imgProtein
      ..title = 'Protein'
      ..gam = 130
      ..description = 'Grams per day',
    MacronutrientGoal()
      ..image = FAImage.imgCarbs
      ..title = 'Carbs'
      ..gam = 235
      ..description = 'Grams per day',
    MacronutrientGoal()
      ..image = FAImage.imgFat
      ..title = 'Fat'
      ..gam = 60
      ..description = 'Grams per day',
  ];
}
