import 'package:flutter_practice_one/core/constant/images.dart';

class MealModel {
  MealModel();

  String? image;
  String? description;
  int? kcal;
}

List<MealModel> listMeal = [
  MealModel()
    ..image = FAImage.imgGreekSalad
    ..description = 'Greek salad with lettuce, green onion'
    ..kcal = 150,
  MealModel()
    ..image = FAImage.imgSalad
    ..description = 'Salad of fresh vegetables'
    ..kcal = 270,
];
