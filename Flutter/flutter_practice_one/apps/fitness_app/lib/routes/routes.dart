import 'package:flutter/material.dart';
import 'package:flutter_practice_one/pages/auth/login.dart';
import 'package:flutter_practice_one/pages/onboarding/age.dart';
import 'package:flutter_practice_one/pages/onboarding/favorite.dart';
import 'package:flutter_practice_one/pages/onboarding/weight.dart';
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
