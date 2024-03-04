import 'package:fitness_app/features/exercise/bloc/exercise_event.dart';
import 'package:fitness_app/features/exercise/bloc/exercise_state.dart';
import 'package:fitness_app/features/exercise/repositories/exercise_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  ExerciseBloc(this.repository) : super(const ExerciseState()) {
    on<ExerciseOnTap>(_onChangeBenefit);
    on<ExerciseFetchBenefitData>(_onFetchBenefitData);
    on<ExerciseFetchExerciseData>(_onFetchExerciseData);
    on<ExerciseFetchExerciseDataByBenefitID>(_onFetchExerciseDataByBenefitID);
  }

  final ExerciseRepository repository;

  Future<void> _onChangeBenefit(
    ExerciseOnTap event,
    Emitter<ExerciseState> emit,
  ) async {
    emit(state.copyWith(index: event.index));
  }

  Future<void> _onFetchBenefitData(
    ExerciseFetchBenefitData event,
    Emitter<ExerciseState> emit,
  ) async {
    emit(state
        .copyWith(fetchBenefitStatus: ExerciseStatus.loading, benefits: []));
    try {
      final benefits = await this.repository.fetchBenefit();

      emit(state.copyWith(
          fetchBenefitStatus: ExerciseStatus.success, benefits: benefits));
    } catch (e) {
      emit(state.copyWith(
          fetchBenefitStatus: ExerciseStatus.failure,
          errorMessage: e.toString()));
    }
  }

  Future<void> _onFetchExerciseData(
    ExerciseFetchExerciseData event,
    Emitter<ExerciseState> emit,
  ) async {
    emit(
      state.copyWith(
        fetchExercisesStatus: ExerciseStatus.loading,
        exercises: [],
      ),
    );

    try {
      final exercises = await this.repository.fetchExercise();
      print('object 1 ${exercises![1].benefit?.title}');
      emit(
        state.copyWith(
            fetchExercisesStatus: ExerciseStatus.success, exercises: exercises),
      );
      print('obb :${state.exercises}');
    } catch (e) {
      emit(
        state.copyWith(
          fetchExercisesStatus: ExerciseStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onFetchExerciseDataByBenefitID(
    ExerciseFetchExerciseDataByBenefitID event,
    Emitter<ExerciseState> emit,
  ) async {
    emit(
      state.copyWith(
        fetchExercisesStatus: ExerciseStatus.loading,
        exercises: [],
        index: event.index,
      ),
    );

    try {
      final exercises = await this.repository.fetchExercise();
      exercises?.where((element) => element.benefit?.benefitID == event.index);
      print('object 1 ${exercises![1].benefit?.title}');
      //print('object 1 ${exercises![1].benefit?.title}');
      emit(
        state.copyWith(
            fetchExercisesStatus: ExerciseStatus.success, exercises: exercises),
      );
      print('obb :${state.exercises}');
    } catch (e) {
      emit(
        state.copyWith(
          fetchExercisesStatus: ExerciseStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
