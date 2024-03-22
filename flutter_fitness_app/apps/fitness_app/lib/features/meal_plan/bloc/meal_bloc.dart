import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/features/meal_plan/bloc/meal_event.dart';
import 'package:fitness_app/features/meal_plan/bloc/meal_state.dart';
import 'package:fitness_app/features/meal_plan/repository/meal_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  MealBloc({
    required this.repository,
  }) : super(MealState()) {
    on<FetchMealData>(_onFetchMealData);
    on <FetchMealDetailData>(_onFetchMealDetailData);
    on<MealOnTap>(_onMealOnTap);
  }

  final MealRepository repository;

  /// This function [_onFetchMealData] is called when loading the meal data.
  Future<void> _onFetchMealData(
    FetchMealData event,
    Emitter<MealState> emit,
  ) async {
    emit(state.copyWith(fetchMealStatus: SubmissionStatus.loading, meals: []));

    /// delay 2 seconds to simulate loading data from server
    await Future.delayed(Duration(seconds: 2));

    /// fetch meal data from repository
    try {
      final meals = await this.repository.fetchMeal();

      /// emit new state with new values and status success
      emit(state.copyWith(
          fetchMealStatus: SubmissionStatus.success, meals: meals));
    }

    /// emit new state with new values and status failure with error message
    catch (e) {
      emit(
        state.copyWith(
          fetchMealStatus: SubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  /// This function [_onFetchMealDetailData] is called when loading the meal detail data.
  Future<void> _onFetchMealDetailData(
    FetchMealDetailData event,
    Emitter<MealState> emit,
  ) async {
    emit(state.copyWith(fetchMealDetailStatus: SubmissionStatus.loading, mealDetails: []));

    /// delay 2 seconds to simulate loading data from server
    await Future.delayed(Duration(seconds: 2));

    /// fetch meal data from repository
    try {
      final meals = await this.repository.fetchMealDetail();

      /// emit new state with new values and status success
      emit(state.copyWith(
          fetchMealDetailStatus: SubmissionStatus.success, mealDetails: meals));
    }

    /// emit new state with new values and status failure with error message
    catch (e) {
      emit(
        state.copyWith(
          fetchMealDetailStatus: SubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  /// This function [_onMealOnTap] is called when the user taps the Meal.
  Future<void> _onMealOnTap(
    MealOnTap event,
    Emitter<MealState> emit,
  ) async {
    /// emit new state with new values and index
    emit(state.copyWith(index: event.index));
  }
}
