class FALink {
  static const endPointLogin = '/User?select=*';

  static const endPointGoal = '/Goal?select=*';

  static const endPointCategory = '/Category?select=*';

  static const endPointMeal = '/Meal?select=*';

  static const endPointExercise =
      '/Exercise?type=eq.1&select=*&order=exerciseID.asc';

  static const endPointPopularExercise = '/Exercise?type=eq.2&select=*';

  static const endPointBenefit = '/Benefit?select=*';

  static const endPointExerciseByBenefit= '/Exercise?select=*,Benefit(title)';
}
