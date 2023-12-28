import 'package:flutter_practice_one/core/constant/images.dart';

class CategoryModel {
  CategoryModel();

  String? image;
  String? name;
}

List<CategoryModel> listCategory = [
  CategoryModel()
    ..image = FAImage.imgYogaHome
    ..name = 'Yoga',
  CategoryModel()
    ..image = FAImage.imgGym
    ..name = 'Gym',
  CategoryModel()
    ..image = FAImage.imgCardio
    ..name = 'Cardio',
  CategoryModel()
    ..image = FAImage.imgStretch
    ..name = 'Stretch',
  CategoryModel()
    ..image = FAImage.imgFullBody
    ..name = 'Full Body',
  CategoryModel()
    ..image = FAImage.imgLegs
    ..name = 'Legs',
];
