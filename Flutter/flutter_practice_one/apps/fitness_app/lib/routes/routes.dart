import 'package:flutter/material.dart';
import 'package:flutter_practice_one/pages/auth/login.dart';
import 'package:flutter_practice_one/pages/controller/controller_page.dart';
import 'package:flutter_practice_one/pages/home/home.dart';
import 'package:flutter_practice_one/pages/onboarding/age.dart';
import 'package:flutter_practice_one/pages/onboarding/favorite.dart';
import 'package:flutter_practice_one/pages/onboarding/get_start.dart';
import 'package:flutter_practice_one/pages/onboarding/goal.dart';
import 'package:flutter_practice_one/pages/onboarding/height.dart';
import 'package:flutter_practice_one/pages/onboarding/level.dart';
import 'package:flutter_practice_one/pages/onboarding/weight.dart';
import 'package:flutter_practice_one/pages/onboarding/weight_goal.dart';
import 'package:flutter_practice_one/pages/splash/splash_screen.dart';
import 'package:flutter_practice_one/pages/welcome/welcome.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splashScreen.path,
  routes: <GoRoute>[
    GoRoute(
      path: AppRoutes.splashScreen.path,
      name: AppRoutes.splashScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.welcomeScreen.path,
      name: AppRoutes.welcomeScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const WelcomePage(),
    ),
    GoRoute(
      path: AppRoutes.loginScreen.path,
      name: AppRoutes.loginScreen.name,
      builder: (BuildContext context, GoRouterState state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.favoriteScreen.path,
      name: AppRoutes.favoriteScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const FavoritePage(),
    ),
    GoRoute(
      path: AppRoutes.ageScreen.path,
      name: AppRoutes.ageScreen.name,
      builder: (BuildContext context, GoRouterState state) => const AgePage(),
    ),
    GoRoute(
      path: AppRoutes.weightScreen.path,
      name: AppRoutes.weightScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const WeightPage(),
    ),
    GoRoute(
      path: AppRoutes.weightGoalScreen.path,
      name: AppRoutes.weightGoalScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const WeightGoalPage(),
    ),
    GoRoute(
      path: AppRoutes.heightScreen.path,
      name: AppRoutes.heightScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const HeightPage(),
    ),
    GoRoute(
      path: AppRoutes.levelScreen.path,
      name: AppRoutes.levelScreen.name,
      builder: (BuildContext context, GoRouterState state) => const LevelPage(),
    ),
    GoRoute(
      path: AppRoutes.goalScreen.path,
      name: AppRoutes.goalScreen.name,
      builder: (BuildContext context, GoRouterState state) => const GoalPage(),
    ),
    GoRoute(
      path: AppRoutes.getStartScreen.path,
      name: AppRoutes.getStartScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const GetStartPage(),
    ),
    GoRoute(
      path: AppRoutes.getHomeScreen.path,
      name: AppRoutes.getHomeScreen.name,
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoutes.getControllerScreen.path,
      name: AppRoutes.getControllerScreen.name,
      builder: (BuildContext context, GoRouterState state) =>
          const ControllerPage(),
    ),
  ],
);

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
  getHomeScreen(
    name: 'getHomeScreen',
    path: '/getHomeScreen',
  ),
  getControllerScreen(
    name: 'getControllerScreen',
    path: '/getControllerScreen',
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
