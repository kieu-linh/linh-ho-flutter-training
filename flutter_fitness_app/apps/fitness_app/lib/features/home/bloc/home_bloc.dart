import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/utils/status.dart';
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
    on<HomeFetchUserData>(_onFetchUserData);
    on<HomeGoalOnTap>(_onGoalOnTap);
  }

  /// This is an instance of [HomeRepository] to call API
  final HomeRepository repository;

  /// This function [_onFetchUserData] is called when the user presses the sign in or sign up button.
  Future<void> _onFetchUserData(
    HomeFetchUserData event,
    Emitter<HomeState> emit,
  ) async {
    /// fetch user data from repository
    try {
      final user = await this.repository.fetchUsers();

      print('user: ${user?.name}');

      /// emit new state with new values and status success
      emit(state.copyWith(user: user));
    }

    /// emit new state with new values and status failure
    catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  /// This function [_onFetchGoalData] is called when loading the goal data.
  Future<void> _onFetchGoalData(
    HomeFetchGoalData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(fetchGoalsStatus: SubmissionStatus.loading, goals: []));

    /// delay 2 seconds to simulate loading data from server
    await Future.delayed(Duration(seconds: 2));

    /// fetch goal data from repository
    try {
      final goals = await this.repository.fetchGoals();

      /// emit new state with new values and status success
      emit(
        state.copyWith(
          fetchGoalsStatus: SubmissionStatus.success,
          goals: goals,
        ),
      );
    }

    /// emit new state with new values and status failure
    catch (e) {
      emit(
        state.copyWith(
          fetchGoalsStatus: SubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  /// This function [_onFetchCategoryData] is called when loading the category data.
  Future<void> _onFetchCategoryData(
    HomeFetchCategoryData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
        fetchCategoryStatus: SubmissionStatus.loading, categories: []));

    /// delay 2 seconds to simulate loading data from server
    await Future.delayed(Duration(seconds: 2));

    /// fetch category data from repository
    try {
      final categories = await this.repository.fetchCategory();

      /// emit new state with new values and status success
      emit(
        state.copyWith(
          fetchCategoryStatus: SubmissionStatus.success,
          categories: categories,
        ),
      );
    }

    /// emit new state with new values and status failure
    catch (e) {
      emit(
        state.copyWith(
          fetchCategoryStatus: SubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  /// This function [_onFetchMealData] is called when loading the meal data.
  Future<void> _onFetchMealData(
    HomeFetchMealData event,
    Emitter<HomeState> emit,
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

  /// This function [_onFetchPopularExerciseData] is called when loading the popular exercise data.
  Future<void> _onFetchPopularExerciseData(
    HomeFetchPopularExerciseData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(
        fetchPopularExerciseStatus: SubmissionStatus.loading,
        popularExercises: []));

    /// delay 2 seconds to simulate loading data from server
    await Future.delayed(Duration(seconds: 2));

    /// fetch popular exercise data from repository
    try {
      final popularExercises = await this.repository.fetchPopularExercise();

      /// emit new state with new values and status success with popular exercise data
      emit(
        state.copyWith(
          fetchPopularExerciseStatus: SubmissionStatus.success,
          popularExercises: popularExercises,
        ),
      );
    }

    /// emit new state with new values and status failure with error message
    catch (e) {
      emit(
        state.copyWith(
          fetchPopularExerciseStatus: SubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  /// This function [_onFetchAddExerciseData] is called when loading the add exercise data.
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

    /// delay 2 seconds to simulate loading data from server
    await Future.delayed(Duration(seconds: 2));

    /// fetch add exercise data from repository
    try {
      final addExercises = await this.repository.fetchAddExercise();

      /// emit new state with new values and status success with add exercise data
      emit(
        state.copyWith(
          fetchAddExercisesStatus: SubmissionStatus.success,
          addExercises: addExercises,
        ),
      );
    }

    /// emit new state with new values and status failure with error message
    catch (e) {
      emit(
        state.copyWith(
          fetchAddExercisesStatus: SubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  /// This function [_onGoalOnTap] is called when the user taps the goal.
  Future<void> _onGoalOnTap(
    HomeGoalOnTap event,
    Emitter<HomeState> emit,
  ) async {
    /// emit new state with new values and index
    emit(state.copyWith(index: event.index));
  }
}
