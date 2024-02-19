class FavoriteData {
  FavoriteData();

  String? image;
  String? title;
}

List<FavoriteData> listFavorite = [
  FavoriteData()
    ..image = 'assets/images/img_running.png'
    ..title = 'Running',
  FavoriteData()
    ..image = 'assets/images/img_walking.png'
    ..title = 'Walking',
  FavoriteData()
    ..image = 'assets/images/img_meal.png'
    ..title = 'Meal plan',
  FavoriteData()
    ..image = 'assets/images/img_cycling.png'
    ..title = 'Cycling',
  FavoriteData()
    ..image = 'assets/images/img_yoga.png'
    ..title = 'Yoga',
  FavoriteData()
    ..image = 'assets/images/img_health.png'
    ..title = 'Health',
];
