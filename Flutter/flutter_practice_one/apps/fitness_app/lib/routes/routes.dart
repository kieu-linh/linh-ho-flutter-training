import 'package:fitness_app/data/models/add_exercise_data.dart';
//import 'package:fitness_app/pages/auth/login.dart';
import 'package:fitness_app/pages/auth/login/presentation/login_view.dart';
import 'package:fitness_app/pages/auth/sign_in/forget_pass.dart';
import 'package:fitness_app/pages/auth/sign_in/sign_in.dart';
import 'package:fitness_app/pages/category/category.dart';
import 'package:fitness_app/pages/drawer/drawer_main.dart';
import 'package:fitness_app/pages/exercise/exercise.dart';
import 'package:fitness_app/pages/exercise_detail/exercise_detail.dart';
import 'package:fitness_app/pages/onboarding/age.dart';
import 'package:fitness_app/pages/onboarding/favorite.dart';
import 'package:fitness_app/pages/onboarding/get_start.dart';
import 'package:fitness_app/pages/onboarding/goal.dart';
import 'package:fitness_app/pages/onboarding/height.dart';
import 'package:fitness_app/pages/onboarding/level.dart';
import 'package:fitness_app/pages/onboarding/weight.dart';
import 'package:fitness_app/pages/onboarding/weight_goal.dart';
import 'package:fitness_app/pages/profile/profile.dart';
import 'package:fitness_app/pages/splash/splash_screen.dart';
import 'package:fitness_app/pages/welcome/welcome.dart';
import 'package:fitness_ui/components/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FARouter {
  FARouter._();

  // Private navigators
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final _shellNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _shellNavigatorMeal =
      GlobalKey<NavigatorState>(debugLabel: 'shellMeal');
  static final _shellNavigatorExercise =
      GlobalKey<NavigatorState>(debugLabel: 'shellExercise');
  static final _shellNavigatorProfile =
      GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

  //static final _navigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter appRouter = GoRouter(
    initialLocation: AppRoutes.splashScreen.path,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen.path,
        name: AppRoutes.splashScreen.name,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.welcomeScreen.path,
        name: AppRoutes.welcomeScreen.name,
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: AppRoutes.loginScreen.path,
        name: AppRoutes.loginScreen.name,
        builder: (context, state) => const LoginView(),
        //const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.signInScreen.path,
        name: AppRoutes.signInScreen.name,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassScreen.path,
        name: AppRoutes.forgotPassScreen.name,
        builder: (context, state) => const ForgetPassword(),
      ),
      GoRoute(
        path: AppRoutes.favoriteScreen.path,
        name: AppRoutes.favoriteScreen.name,
        builder: (context, state) => const FavoritePage(),
      ),
      GoRoute(
        path: AppRoutes.ageScreen.path,
        name: AppRoutes.ageScreen.name,
        builder: (context, state) => const AgePage(),
      ),
      GoRoute(
        path: AppRoutes.weightScreen.path,
        name: AppRoutes.weightScreen.name,
        builder: (context, state) => const WeightPage(),
      ),
      GoRoute(
        path: AppRoutes.weightGoalScreen.path,
        name: AppRoutes.weightGoalScreen.name,
        builder: (context, state) => const WeightGoalPage(),
      ),
      GoRoute(
        path: AppRoutes.heightScreen.path,
        name: AppRoutes.heightScreen.name,
        builder: (context, state) => const HeightPage(),
      ),
      GoRoute(
        path: AppRoutes.levelScreen.path,
        name: AppRoutes.levelScreen.name,
        builder: (context, state) => const LevelPage(),
      ),
      GoRoute(
        path: AppRoutes.goalScreen.path,
        name: AppRoutes.goalScreen.name,
        builder: (context, state) => const GoalPage(),
      ),
      GoRoute(
        path: AppRoutes.getStartScreen.path,
        name: AppRoutes.getStartScreen.name,
        builder: (context, state) => const GetStartPage(),
      ),

      /// Home Router
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return FABottomNavigationBar(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          /// Branch Home
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.homeScreen.path,
                name: AppRoutes.homeScreen.name,
                builder: (context, state) {
                  return DrawerMain(key: state.pageKey);
                },
                routes: [
                  /// CategoryPage
                  GoRoute(
                    path: AppRoutes.categoryScreen.path,
                    name: AppRoutes.categoryScreen.name,
                    builder: (context, state) {
                      return CategoryPage(key: state.pageKey);
                    },
                  ),
                ],
              ),
            ],
          ),

          /// Branch Meal
          StatefulShellBranch(
            navigatorKey: _shellNavigatorMeal,
            routes: [
              GoRoute(
                path: '/mealPlan',
                name: 'MealPlan',
                builder: (context, state) => Container(
                  color: Colors.green,
                ),
              ),
            ],
          ),

          /// Branch Exercise
          StatefulShellBranch(
            navigatorKey: _shellNavigatorExercise,
            routes: [
              GoRoute(
                path: AppRoutes.exerciseScreen.path,
                name: AppRoutes.exerciseScreen.name,
                builder: (context, state) => ExercisePage(key: state.pageKey),
                routes: [
                  /// Exercise Detail Page
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: AppRoutes.exerciseDetailScreen.path,
                    name: AppRoutes.exerciseDetailScreen.name,
                    builder: (context, state) {
                      return ExerciseDetailPage(
                        key: state.pageKey,
                        exercise: state.extra! as AddExerciseModel,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),

          /// Branch Profile
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfile,
            routes: [
              GoRoute(
                path: AppRoutes.profileScreen.path,
                name: AppRoutes.profileScreen.path,
                builder: (context, state) => ProfilePage(key: state.pageKey),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

/// Represents the app routes and their paths.
enum AppRoutes {
  welcomeScreen(
    name: 'welcomeScreen',
    path: '/welcomeScreen',
  ),
  splashScreen(
    name: 'splashScreen',
    path: '/splashScreen',
  ),
  loginScreen(
    name: 'loginScreen',
    path: '/loginScreen',
  ),
  signInScreen(
    name: 'signInScreen',
    path: '/signInScreen',
  ),
  forgotPassScreen(
    name: 'forgotPassScreen',
    path: '/forgotPassScreen',
  ),
  favoriteScreen(
    name: 'favoriteScreen',
    path: '/favoriteScreen',
  ),
  ageScreen(
    name: 'ageScreen',
    path: '/ageScreen',
  ),
  weightScreen(
    name: 'weightScreen',
    path: '/weightScreen',
  ),
  weightGoalScreen(
    name: 'weightGoalScreen',
    path: '/weightGoalScreen',
  ),
  heightScreen(
    name: 'heightScreen',
    path: '/heightScreen',
  ),
  levelScreen(
    name: 'levelScreen',
    path: '/levelScreen',
  ),
  goalScreen(
    name: 'goalScreen',
    path: '/goalScreen',
  ),
  getStartScreen(
    name: 'getStartScreen',
    path: '/getStartScreen',
  ),
  homeScreen(
    name: 'homeScreen',
    path: '/homeScreen',
  ),
  controllerScreen(
    name: 'controllerScreen',
    path: '/controllerScreen',
  ),
  categoryScreen(
    name: 'categoryScreen',
    path: 'categoryScreen',
  ),
  profileScreen(
    name: 'profileScreen',
    path: '/profileScreen',
  ),
  exerciseScreen(
    name: 'exerciseScreen',
    path: '/exerciseScreen',
  ),
  exerciseDetailScreen(
    name: 'exerciseDetailScreen',
    path: 'exerciseDetailScreen',
  );

  const AppRoutes({
    required this.name,
    required this.path,
  });

  /// Represents the route name
  ///
  /// Example: `AppRoutes.recipesList.name`
  /// Returns: 'recipesList'
  final String name;

  /// Represents the route path
  ///
  /// Example: `AppRoutes.recipesList.path`
  /// Returns: '/recipesList'
  final String path;

  @override
  String toString() => name;
}
