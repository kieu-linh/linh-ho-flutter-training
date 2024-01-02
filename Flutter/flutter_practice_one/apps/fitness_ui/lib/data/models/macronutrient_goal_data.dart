import 'package:fitness_ui/core/constant/images.dart';

class MacronutrientGoalModel {
  MacronutrientGoalModel();

  String? image;
  String? title;
  int? gam;
  String? description;
}

List<MacronutrientGoalModel> listMacronutrientGoal = [
  MacronutrientGoalModel()
    ..image = FAImage.imgProtein
    ..title = 'Protein'
    ..gam = 130
    ..description = 'Grams per day',
    MacronutrientGoalModel()
    ..image = FAImage.imgCarbs
    ..title = 'Carbs'
    ..gam = 235
    ..description = 'Grams per day',
    MacronutrientGoalModel()
    ..image = FAImage.imgFat
    ..title = 'Fat'
    ..gam = 60
    ..description = 'Grams per day',
];
