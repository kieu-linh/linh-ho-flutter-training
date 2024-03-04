import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/home/bloc/home_event.dart';
import 'package:fitness_app/features/home/bloc/home_state.dart';
import 'package:fitness_app/features/home/repositories/home_repositories.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.repository) : super(const HomeState()) {
    on<HomeFetchGoalData>(_onFetchGoalData);
    on<HomeFetchCategoryData>(_onFetchCategoryData);
    on<HomeFetchMealData>(_onFetchMealData);
    on<HomeFetchPopularExerciseData>(_onFetchPopularExerciseData);
    on<HomeFetchAddExerciseData>(_onFetchAddExerciseData);
  }

  final HomeRepository repository;

  Future<void> _onFetchGoalData(
    HomeFetchGoalData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(fetchGoalsStatus: SubmissionStatus.loading, goals: []));

    try {
      final goals = await this.repository.fetchGoals();

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
        fetchCategoryStatus: SubmissionStatus.loading, categories: []));

    try {
      final categories = await this.repository.fetchCategory();

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
    emit(state.copyWith(fetchMealStatus: SubmissionStatus.loading, meals: []));

    try {
      final meals = await this.repository.fetchMeal();

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
        fetchPopularExerciseStatus: SubmissionStatus.loading,
        popularExercises: []));

    try {
      final popularExercises = await this.repository.fetchPopularExercise();

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
        fetchAddExercisesStatus: SubmissionStatus.loading,
        addExercises: [],
      ),
    );

    try {
      final addExercises = await this.repository.fetchAddExercise();
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
