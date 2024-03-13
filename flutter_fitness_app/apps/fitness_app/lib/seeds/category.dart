import 'package:fitness_app/models/category.dart';
import 'package:fitness_ui/core/constant/images.dart';

class CategorySeeds {
  static List<Category> listCategory = [
    Category()
      ..imagePath = FAImage.imgYogaHome
      ..name = 'Yoga',
    Category()
      ..imagePath = FAImage.imgGym
      ..name = 'Gym',
    Category()
      ..imagePath = FAImage.imgCardio
      ..name = 'Cardio',
    Category()
      ..imagePath = FAImage.imgStretch
      ..name = 'Stretch',
    Category()
      ..imagePath = FAImage.imgFullBody
      ..name = 'Full Body',
    Category()
      ..imagePath = FAImage.imgLegs
      ..name = 'Legs',
  ];
}
