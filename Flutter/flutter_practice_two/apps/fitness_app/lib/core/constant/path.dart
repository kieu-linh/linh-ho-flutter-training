/// [FAPath] is a class that contains all the path for the API
class FAPath {
  static const login = '/User?select=*';

  static const signUp = '/User';

  static const goal = '/Goal?select=*';

  static const category = '/Category?select=*';

  static const meal = '/Meal?select=*';

  static const exercise = '/Exercise?type=eq.1&select=*&order=exerciseID.asc';

  static const popularExercise = '/Exercise?type=eq.2&select=*';

  static const benefit = '/Benefit?select=*&order=benefitID.asc';

  static const exerciseByBenefit =
      '/Exercise?type=eq.1&order=exerciseID.asc&select=*,Benefit(*)';
}
