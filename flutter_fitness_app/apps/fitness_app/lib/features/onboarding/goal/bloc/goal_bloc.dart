import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/features/onboarding/Goal/repository/Goal_repository.dart';
import 'package:fitness_app/features/onboarding/goal/bloc/goal_event.dart';
import 'package:fitness_app/features/onboarding/goal/bloc/goal_state.dart';

class GoalBloc extends Bloc<GoalEvent, GoalState> {
  GoalBloc(this.repository) : super(const GoalState()) {
    on<GoalFetchData>(_onFetchGoalData);
    on<GoalOnTap>(_onGoalOnTap);
  }

  /// This is an instance of the [GoalRepository] class.
  final GoalRepository repository;

  /// This function [_onFetchGoalData] is called when loading the Goal data.
  Future _onFetchGoalData(
    GoalFetchData event,
    Emitter<GoalState> emit,
  ) async {
    /// emit new state with new values and status loading
    emit(state.copyWith(
        fetchGoalStatus: SubmissionStatus.loading, goals: []));
    try {
      /// fetch Goal data from repository
      final goals = await this.repository.fetchGoal();

      emit(
        state.copyWith(
          fetchGoalStatus: SubmissionStatus.success,
          goals: goals,
        ),
      );
    } catch (e) {
      /// emit new state with new values and status failure
      emit(
        state.copyWith(
          fetchGoalStatus: SubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  /// This function [_onGoalOnTap] is called when the user taps on a Goal.
  Future _onGoalOnTap(
    GoalOnTap event,
    Emitter<GoalState> emit,
  ) async {
    /// emit new state with new values and index
    emit(state.copyWith(index: event.index));
  }

}
