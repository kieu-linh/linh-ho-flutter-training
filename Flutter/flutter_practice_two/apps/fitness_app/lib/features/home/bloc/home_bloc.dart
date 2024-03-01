import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/home/bloc/home_event.dart';
import 'package:fitness_app/features/home/bloc/home_state.dart';
import 'package:fitness_app/features/home/repositories/home_repositories.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeFetchGoalData>(_onFetchGoalData);
    on<HomeFetchCategoryData>(_onFetchCategoryData);
    on<HomeFetchMealData>(_onFetchMealData);
    on<HomeFetchPopularExerciseData>(_onFetchPopularExerciseData);
    on<HomeFetchAddExerciseData>(_onFetchAddExerciseData);
  }

  Future<void> _onFetchGoalData(
    HomeFetchGoalData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state
        .copyWith(fetchGoalsStatus: HomePageStatus.onLoadingData, goals: []));

    try {
      final goals = await HomeRepository().fetchGoals();

      emit(state.copyWith(
          fetchGoalsStatus: HomePageStatus.success, goals: goals));
    } catch (e) {
      emit(state.copyWith(
          fetchGoalsStatus: HomePageStatus.failure,
          errorMessage: e.toString()));
    }
  }

  Future<void> _onFetchCategoryData(
    HomeFetchCategoryData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
        fetchCategoryStatus: HomePageStatus.onLoadingData, categories: []));

    try {
      final categories = await HomeRepository().fetchCategory();

      emit(state.copyWith(
          fetchCategoryStatus: HomePageStatus.success, categories: categories));
    } catch (e) {
      emit(state.copyWith(
          fetchCategoryStatus: HomePageStatus.failure,
          errorMessage: e.toString()));
    }
  }

  Future<void> _onFetchMealData(
    HomeFetchMealData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state
        .copyWith(fetchMealStatus: HomePageStatus.onLoadingData, meals: []));

    try {
      final meals = await HomeRepository().fetchMeal();

      emit(state.copyWith(
          fetchMealStatus: HomePageStatus.success, meals: meals));
    } catch (e) {
      emit(state.copyWith(
          fetchMealStatus: HomePageStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> _onFetchPopularExerciseData(
    HomeFetchPopularExerciseData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
        fetchPopularExerciseStatus: HomePageStatus.onLoadingData,
        popularExercises: []));

    try {
      final popularExercises = await HomeRepository().fetchPopularExercise();

      emit(state.copyWith(
          fetchPopularExerciseStatus: HomePageStatus.success,
          popularExercises: popularExercises));
    } catch (e) {
      emit(state.copyWith(
          fetchPopularExerciseStatus: HomePageStatus.failure,
          errorMessage: e.toString()));
    }
  }

  Future<void> _onFetchAddExerciseData(
    HomeFetchAddExerciseData event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        fetchAddExercisesStatus: HomePageStatus.onLoadingData,
        addExercises: [],
      ),
    );

    try {
      final addExercises = await HomeRepository().fetchAddExercise();

      emit(
        state.copyWith(
            fetchAddExercisesStatus: HomePageStatus.success,
            addExercises: addExercises),
      );
    } catch (e) {
      emit(
        state.copyWith(
          fetchAddExercisesStatus: HomePageStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
