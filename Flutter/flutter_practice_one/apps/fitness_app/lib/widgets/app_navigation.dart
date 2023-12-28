import 'package:flutter/material.dart';
import 'package:flutter_practice_one/pages/category/category.dart';
import 'package:flutter_practice_one/pages/controller/controller_page.dart';
import 'package:flutter_practice_one/pages/home/home.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();

  static String link = '/home';

  // Private navigators
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _shellNavigatorMeal =
      GlobalKey<NavigatorState>(debugLabel: 'shellMeal');
  static final _shellNavigatorExercise =
      GlobalKey<NavigatorState>(debugLabel: 'shellMeal');
  static final _shellNavigatorProfile =
      GlobalKey<NavigatorState>(debugLabel: 'shellMeal');

  static final GoRouter router = GoRouter(
    initialLocation: link,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      /// Home Router
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ControllerPage(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          /// Branch Home
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: [
              GoRoute(
                path: '/home',
                name: 'Home',
                builder: (context, state) {
                  return HomePage(
                    key: state.pageKey,
                  );
                },
                routes: [
                  /// CategoryPage
                  GoRoute(
                    path: 'category',
                    name: 'category',
                    builder: (context, state) {
                      return CategoryPage(
                        key: state.pageKey,
                      );
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
                path: '/exercise',
                name: 'Exercise',
                builder: (context, state) => Container(
                  color: Colors.blue,
                ),
              ),
            ],
          ),

          /// Branch Profile
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfile,
            routes: [
              GoRoute(
                path: '/profile',
                name: 'Profile',
                builder: (context, state) => Container(
                  color: Colors.pink.shade100,
                ),
              ),
            ],
          ),
        ],
      )
    ],
  );
}
