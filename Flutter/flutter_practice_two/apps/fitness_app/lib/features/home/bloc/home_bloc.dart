import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/home/bloc/home_event.dart';
import 'package:fitness_app/features/home/bloc/home_state.dart';
import 'package:fitness_app/features/home/repositories/home_repositories.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeFetchDataEvent>(_onFetchData);
  }

  Future<void> _onFetchData(
    HomeFetchDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomePageStatus.onLoadingData, goals: []));

    try {
      final goals = await HomeRepository().fetchGoals();
      final categories = await HomeRepository().fetchCategory();
      final meals = await HomeRepository().fetchMeal();
      final popularExercises = await HomeRepository().fetchPopularExercise();

      emit(state.copyWith(
        status: HomePageStatus.success,
        goals: goals,
        categories: categories,
        meals: meals,
        popularExercises: popularExercises,
      ));
    } catch (e) {
      emit(state.copyWith(
          status: HomePageStatus.failure, errorMessage: e.toString()));
    }
  }
}
