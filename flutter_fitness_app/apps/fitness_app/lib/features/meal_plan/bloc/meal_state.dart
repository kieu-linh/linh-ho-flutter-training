import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/features/home/model/meal.dart';
import 'package:fitness_app/features/meal_plan/model/meal_detail.dart';

class MealState extends Equatable {
  const MealState({
    this.fetchMealStatus = SubmissionStatus.initial,
    this.fetchMealDetailStatus = SubmissionStatus.initial,
    this.meals = const [],
    this.mealDetails = const [],
    this.errorMessage = '',
    this.index = 0,
  });

  final SubmissionStatus fetchMealStatus;
  final List<Meal> meals;

  final SubmissionStatus fetchMealDetailStatus;
  final List<MealDetail> mealDetails;

  final int index;
  final String errorMessage;

  MealState copyWith({
    SubmissionStatus? fetchMealStatus,
    SubmissionStatus? fetchMealDetailStatus,
    List<Meal>? meals,
    List<MealDetail>? mealDetails,
    int? index,
    String? errorMessage,
  }) {
    return MealState(
      fetchMealStatus: fetchMealStatus ?? this.fetchMealStatus,
      fetchMealDetailStatus:
          fetchMealDetailStatus ?? this.fetchMealDetailStatus,
      meals: meals ?? this.meals,
      mealDetails: mealDetails ?? this.mealDetails,
      index: index ?? this.index,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [fetchMealStatus, meals, mealDetails, index, errorMessage];
}
