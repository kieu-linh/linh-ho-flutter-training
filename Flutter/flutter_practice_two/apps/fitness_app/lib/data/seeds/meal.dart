import 'package:fitness_app/data/models/meal_data.dart';
import 'package:fitness_ui/core/constant/images.dart';

class MealSeeds {
  static List<Meal> listMeal = [
  Meal()
    ..image = FAImage.imgGreekSalad
    ..description = 'Greek salad with lettuce, green onion'
    ..kcal = 150,
  Meal()
    ..image = FAImage.imgSalad
    ..description = 'Salad of fresh vegetables'
    ..kcal = 270,
];
}
