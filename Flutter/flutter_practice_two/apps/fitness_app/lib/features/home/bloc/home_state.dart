import 'package:equatable/equatable.dart';
import 'package:fitness_app/features/home/model/category.dart';
import 'package:fitness_app/features/home/model/exercise.dart';
import 'package:fitness_app/features/home/model/goal.dart';
import 'package:fitness_app/features/home/model/meal.dart';

enum HomePageStatus {
  initial,
  onLoadingData,
  success,
  failure,
}

class HomeState extends Equatable {
  const HomeState({
    this.status = HomePageStatus.initial,
    this.goals,
    this.categories,
    this.meals,
    this.popularExercises,
    this.errorMessage = '',
  });

  final HomePageStatus status;
  final List<Goal>? goals;
  final List<Category>? categories;
  final List<Meal>? meals;
  final List<Exercise>? popularExercises;
  final String errorMessage;

  HomeState copyWith({
    HomePageStatus? status,
    List<Goal>? goals,
    List<Category>? categories,
    List<Meal>? meals,
    List<Exercise>? popularExercises,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      goals: goals ?? this.goals,
      categories: categories ?? this.categories,
      meals: meals ?? this.meals,
      popularExercises: popularExercises ?? this.popularExercises,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        goals,
        categories,
        meals,
        popularExercises,
        errorMessage,
      ];
}
