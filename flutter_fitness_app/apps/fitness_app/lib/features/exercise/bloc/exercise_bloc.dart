import 'package:fitness_app/core/utils/status.dart';
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

  /// This is an instance of [ExerciseRepository] to call API
  final ExerciseRepository repository;

  /// This function [_onChangeBenefit] is called when on tap benefit item.
  Future<void> _onChangeBenefit(
    ExerciseOnTap event,
    Emitter<ExerciseState> emit,
  ) async {
    /// emit new state with new values and index
    emit(state.copyWith(index: event.index));
  }

  /// This function [_onFetchBenefitData] is called when loading the benefit data.
  Future<void> _onFetchBenefitData(
    ExerciseFetchBenefitData event,
    Emitter<ExerciseState> emit,
  ) async {
    emit(
      state
          .copyWith(fetchBenefitStatus: SubmissionStatus.loading, benefits: []),
    );

    /// fetch benefit data from repository
    try {
      final benefits = await this.repository.fetchBenefit();

      /// emit new state with new values and status success
      emit(state.copyWith(
          fetchBenefitStatus: SubmissionStatus.success, benefits: benefits));
    }

    /// emit new state with new values and status failure
    catch (e) {
      emit(
        state.copyWith(
          fetchBenefitStatus: SubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  /// This function [_onFetchExerciseData] is called when loading the exercise data.
  Future<void> _onFetchExerciseData(
    ExerciseFetchExerciseData event,
    Emitter<ExerciseState> emit,
  ) async {
    emit(
      state.copyWith(
        fetchExercisesStatus: SubmissionStatus.loading,
        exercises: [],
      ),
    );

    /// fetch exercise data from repository
    try {
      final exercises = await this.repository.fetchExercise();

      /// emit new state with new values and status success
      emit(
        state.copyWith(
          fetchExercisesStatus: SubmissionStatus.success,
          exercises: exercises,
        ),
      );
    }

    /// emit new state with new values and status failure with error message
    catch (e) {
      emit(
        state.copyWith(
          fetchExercisesStatus: SubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  /// This function [_onFetchExerciseDataByBenefitID] is called when loading the exercise data by benefit id.
  Future<void> _onFetchExerciseDataByBenefitID(
    ExerciseFetchExerciseDataByBenefitID event,
    Emitter<ExerciseState> emit,
  ) async {
    emit(
      state.copyWith(
        fetchExercisesStatus: SubmissionStatus.loading,
        exercises: [],
        index: event.index,
      ),
    );

    /// fetch exercise data from repository
    try {
      final exercises = await this.repository.fetchExercise();
      exercises?.where((element) => element.benefit?.benefitID == event.index);

      /// emit new state with new values and status success
      emit(
        state.copyWith(
          fetchExercisesStatus: SubmissionStatus.success,
          exercises: exercises,
        ),
      );
    }

    /// emit new state with new values and status failure with error message
    catch (e) {
      emit(
        state.copyWith(
          fetchExercisesStatus: SubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
