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
        .copyWith(fetchGoalsStatus: SubmissionStatus.onLoadingData, goals: []));

    try {
      final goals = await HomeRepository().fetchGoals();

      emit(state.copyWith(
          fetchGoalsStatus: SubmissionStatus.success, goals: goals));
    } catch (e) {
      emit(state.copyWith(
          fetchGoalsStatus: SubmissionStatus.failure,
          errorMessage: e.toString()));
    }
  }

  Future<void> _onFetchCategoryData(
    HomeFetchCategoryData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
        fetchCategoryStatus: SubmissionStatus.onLoadingData, categories: []));

    try {
      final categories = await HomeRepository().fetchCategory();

      emit(state.copyWith(
          fetchCategoryStatus: SubmissionStatus.success,
          categories: categories));
    } catch (e) {
      emit(state.copyWith(
          fetchCategoryStatus: SubmissionStatus.failure,
          errorMessage: e.toString()));
    }
  }

  Future<void> _onFetchMealData(
    HomeFetchMealData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state
        .copyWith(fetchMealStatus: SubmissionStatus.onLoadingData, meals: []));

    try {
      final meals = await HomeRepository().fetchMeal();

      emit(state.copyWith(
          fetchMealStatus: SubmissionStatus.success, meals: meals));
    } catch (e) {
      emit(state.copyWith(
          fetchMealStatus: SubmissionStatus.failure,
          errorMessage: e.toString()));
    }
  }

  Future<void> _onFetchPopularExerciseData(
    HomeFetchPopularExerciseData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
        fetchPopularExerciseStatus: SubmissionStatus.onLoadingData,
        popularExercises: []));

    try {
      final popularExercises = await HomeRepository().fetchPopularExercise();

      emit(state.copyWith(
          fetchPopularExerciseStatus: SubmissionStatus.success,
          popularExercises: popularExercises));
    } catch (e) {
      emit(state.copyWith(
          fetchPopularExerciseStatus: SubmissionStatus.failure,
          errorMessage: e.toString()));
    }
  }

  Future<void> _onFetchAddExerciseData(
    HomeFetchAddExerciseData event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        fetchAddExercisesStatus: SubmissionStatus.onLoadingData,
        addExercises: [],
      ),
    );

    try {
      final addExercises = await HomeRepository().fetchAddExercise();
      //print('object1: ${addExercises?[1].benefit?.title}');
      emit(
        state.copyWith(
            fetchAddExercisesStatus: SubmissionStatus.success,
            addExercises: addExercises),
      );
    } catch (e) {
      emit(
        state.copyWith(
          fetchAddExercisesStatus: SubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
