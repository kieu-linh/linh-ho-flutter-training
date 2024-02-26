import 'package:fitness_app/data/models/category_data.dart';
import 'package:fitness_ui/core/constant/images.dart';

class CategorySeeds {
  static List<Category> listCategory = [
    Category()
      ..image = FAImage.imgYogaHome
      ..name = 'Yoga',
    Category()
      ..image = FAImage.imgGym
      ..name = 'Gym',
    Category()
      ..image = FAImage.imgCardio
      ..name = 'Cardio',
    Category()
      ..image = FAImage.imgStretch
      ..name = 'Stretch',
    Category()
      ..image = FAImage.imgFullBody
      ..name = 'Full Body',
    Category()
      ..image = FAImage.imgLegs
      ..name = 'Legs',
  ];
}
