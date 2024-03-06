import 'package:fitness_app/models/favorite.dart';

class FavoriteSeeds {
  static List<Favorite> listFavorite = [
    Favorite()
      ..imagePath = 'assets/images/img_running.png'
      ..title = 'Running',
    Favorite()
      ..imagePath = 'assets/images/img_walking.png'
      ..title = 'Walking',
    Favorite()
      ..imagePath = 'assets/images/img_meal.png'
      ..title = 'Meal plan',
    Favorite()
      ..imagePath = 'assets/images/img_cycling.png'
      ..title = 'Cycling',
    Favorite()
      ..imagePath = 'assets/images/img_yoga.png'
      ..title = 'Yoga',
    Favorite()
      ..imagePath = 'assets/images/img_health.png'
      ..title = 'Health',
  ];
}
