import 'package:bloc/bloc.dart';
import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/features/onboarding/level/bloc/level_event.dart';
import 'package:fitness_app/features/onboarding/level/bloc/level_state.dart';
import 'package:fitness_app/features/onboarding/level/repository/level_repository.dart';

class LevelBloc extends Bloc<LevelEvent, LevelState> {
  LevelBloc(this.repository) : super(const LevelState()) {
    on<LevelFetchData>(_onFetchLevelData);
    on<LevelOnTap>(_onLevelOnTap);
  }

  /// This is an instance of the [LevelRepository] class.
  final LevelRepository repository;

  /// This function [_onFetchLevelData] is called when loading the Level data.
  Future _onFetchLevelData(
    LevelFetchData event,
    Emitter<LevelState> emit,
  ) async {
    /// emit new state with new values and status loading
    emit(state.copyWith(fetchLevelStatus: SubmissionStatus.loading, levels: []));
    try {
      /// fetch Level data from repository
      final levels = await this.repository.fetchLevel();

      emit(
        state.copyWith(
          fetchLevelStatus: SubmissionStatus.success,
          levels: levels,
        ),
      );
    } catch (e) {
      /// emit new state with new values and status failure
      emit(
        state.copyWith(
          fetchLevelStatus: SubmissionStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  /// This function [_onLevelOnTap] is called when the user taps on a Level.
  Future _onLevelOnTap(
    LevelOnTap event,
    Emitter<LevelState> emit,
  ) async {
    /// emit new state with new values and index
    emit(state.copyWith(index: event.index));
  }
}
