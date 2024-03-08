import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/features/auth/sign_in/model/user_model.dart';
import 'package:fitness_app/features/home/model/category.dart';
import 'package:fitness_app/features/home/model/exercise.dart';
import 'package:fitness_app/features/home/model/goal.dart';
import 'package:fitness_app/features/home/model/meal.dart';

class HomeState extends Equatable {
  const HomeState({
    this.fetchGoalStatus = SubmissionStatus.initial,
    this.fetchCategoryStatus = SubmissionStatus.initial,
    this.fetchMealStatus = SubmissionStatus.initial,
    this.fetchPopularExerciseStatus = SubmissionStatus.initial,
    this.fetchAddExercisesStatus = SubmissionStatus.initial,
    this.goals = const [],
    this.categories = const [],
    this.meals = const [],
    this.popularExercises = const [],
    this.addExercises = const [],
    this.errorMessage = '',
    this.index = 0,
    this.user,
  });

  final SubmissionStatus fetchGoalStatus;
  final List<Goal>? goals;

  final SubmissionStatus fetchCategoryStatus;
  final List<Category>? categories;

  final SubmissionStatus fetchMealStatus;
  final List<Meal>? meals;

  final SubmissionStatus fetchPopularExerciseStatus;
  final List<Exercise>? popularExercises;

  final SubmissionStatus fetchAddExercisesStatus;
  final List<Exercise>? addExercises;

  final String errorMessage;

  final User? user;
  final int index;

  HomeState copyWith({
    SubmissionStatus? fetchGoalsStatus,
    List<Goal>? goals,
    SubmissionStatus? fetchCategoryStatus,
    List<Category>? categories,
    SubmissionStatus? fetchMealStatus,
    List<Meal>? meals,
    SubmissionStatus? fetchPopularExerciseStatus,
    List<Exercise>? popularExercises,
    SubmissionStatus? fetchAddExercisesStatus,
    List<Exercise>? addExercises,
    String? errorMessage,
    User? user,
    int? index,
  }) {
    return HomeState(
      fetchGoalStatus: fetchGoalsStatus ?? this.fetchGoalStatus,
      goals: goals ?? this.goals,
      fetchCategoryStatus: fetchCategoryStatus ?? this.fetchCategoryStatus,
      categories: categories ?? this.categories,
      fetchMealStatus: fetchMealStatus ?? this.fetchMealStatus,
      meals: meals ?? this.meals,
      fetchPopularExerciseStatus:
          fetchPopularExerciseStatus ?? this.fetchPopularExerciseStatus,
      popularExercises: popularExercises ?? this.popularExercises,
      fetchAddExercisesStatus:
          fetchAddExercisesStatus ?? this.fetchAddExercisesStatus,
      addExercises: addExercises ?? this.addExercises,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
      index: index ?? this.index,
    );
  }

  @override
  List<Object?> get props => [
        fetchGoalStatus,
        goals,
        fetchCategoryStatus,
        categories,
        fetchMealStatus,
        meals,
        fetchPopularExerciseStatus,
        popularExercises,
        fetchAddExercisesStatus,
        addExercises,
        errorMessage,
        user,
        index,
      ];
}
