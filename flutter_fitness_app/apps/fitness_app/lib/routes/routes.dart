import 'package:fitness_app/features/auth/forget_password/presentation/forget_password.dart';
import 'package:fitness_app/features/auth/sign_in/presentation/sign_in.dart';
import 'package:fitness_app/features/auth/sign_up/presentation/sign_up.dart';
import 'package:fitness_app/features/auth/verify_account/presentation/verify_account.dart';
import 'package:fitness_app/features/category/presentation/category.dart';
import 'package:fitness_app/features/drawer/drawer_main.dart';
import 'package:fitness_app/features/edit_profile/edit_profile.dart';
import 'package:fitness_app/features/exercise/presentation/exercise.dart';
import 'package:fitness_app/features/exercise_detail/exercise_detail.dart';
import 'package:fitness_app/features/home/model/exercise.dart';
import 'package:fitness_app/features/onboarding/age.dart';
import 'package:fitness_app/features/onboarding/favorite/presentation/favorite.dart';
import 'package:fitness_app/features/onboarding/get_start.dart';
import 'package:fitness_app/features/onboarding/goal/presentation/goal.dart';
import 'package:fitness_app/features/onboarding/height.dart';
import 'package:fitness_app/features/onboarding/level/presentation/level.dart';
import 'package:fitness_app/features/onboarding/weight.dart';
import 'package:fitness_app/features/onboarding/weight_goal.dart';
import 'package:fitness_app/features/profile/profile.dart';
import 'package:fitness_app/features/splash/splash_screen.dart';
import 'package:fitness_app/features/welcome/welcome.dart';
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
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: AppRoutes.signUpScreen.path,
        name: AppRoutes.signUpScreen.name,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassScreen.path,
        name: AppRoutes.forgotPassScreen.name,
        builder: (context, state) => const ForgotPassword(),
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
        path: AppRoutes.height.path,
        name: AppRoutes.height.name,
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
      GoRoute(
        path: AppRoutes.verifyAccountScreen.path,
        name: AppRoutes.verifyAccountScreen.name,
        builder: (context, state) => const VerifyAccountPage(),
      ),

      /// Home Router
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => FABottomNavigationBar(
          navigationShell: navigationShell,
        ),
        branches: <StatefulShellBranch>[
          /// Branch Home
          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: AppRoutes.homeScreen.path,
                name: AppRoutes.homeScreen.name,
                builder: (context, state) => DrawerMain(key: state.pageKey),
                routes: [
                  /// CategoryPage
                  GoRoute(
                    path: AppRoutes.category.path,
                    name: AppRoutes.category.name,
                    builder: (context, state) =>
                        CategoryPage(key: state.pageKey),
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
                    builder: (context, state) => ExerciseDetailPage(
                      key: state.pageKey,
                      exercise: state.extra as Exercise,
                    ),
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
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: AppRoutes.editProfileScreen.path,
                    name: AppRoutes.editProfileScreen.name,
                    builder: (context, state) => EditProfilePage(),
                  ),
                ],
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
    path: '/welcome',
  ),
  splashScreen(
    name: 'splashScreen',
    path: '/splash',
  ),

  loginScreen(
    name: 'loginScreen',
    path: '/login',
  ),

  signUpScreen(
    name: 'signUpScreen',
    path: '/sign-up',
  ),
  forgotPassScreen(
    name: 'forgotPassScreen',
    path: '/forgot-pass',
  ),
  favoriteScreen(
    name: 'favoriteScreen',
    path: '/favorite',
  ),
  ageScreen(
    name: 'ageScreen',
    path: '/age',
  ),
  weightScreen(
    name: 'weightScreen',
    path: '/weight',
  ),
  weightGoalScreen(
    name: 'weightGoalScreen',
    path: '/weight-goal',
  ),
  height(
    name: 'height',
    path: '/height',
  ),
  levelScreen(
    name: 'levelScreen',
    path: '/level',
  ),
  goalScreen(
    name: 'goalScreen',
    path: '/goal',
  ),
  getStartScreen(
    name: 'getStartScreen',
    path: '/get-start',
  ),
  homeScreen(
    name: 'homeScreen',
    path: '/home',
  ),
  controllerScreen(
    name: 'controllerScreen',
    path: '/controller',
  ),
  category(
    name: 'category',
    path: 'category',
  ),
  profileScreen(
    name: 'profileScreen',
    path: '/profile',
  ),
  editProfileScreen(
    name: 'edit-profile',
    path: 'edit-profile',
  ),
  exerciseScreen(
    name: 'exerciseScreen',
    path: '/exercise',
  ),
  exerciseDetailScreen(
    name: 'exercise-detail',
    path: 'exercise-detail',
  ),
  verifyAccountScreen(
    name: 'verifyAccountScreen',
    path: '/verify-account',
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
