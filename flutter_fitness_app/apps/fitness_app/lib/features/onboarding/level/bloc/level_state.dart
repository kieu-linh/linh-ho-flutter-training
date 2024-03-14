import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/features/onboarding/level/model/level.dart';

class LevelState extends Equatable {
  const LevelState({
    this.fetchLevelStatus = SubmissionStatus.initial,
    this.levels = const [],
    this.errorMessage = '',
    this.index = 0,
  });

  final SubmissionStatus fetchLevelStatus;
  final List<Level>? levels;

  final int index;
  final String errorMessage;

  LevelState copyWith({
    SubmissionStatus? fetchLevelStatus,
    List<Level>? levels,
    String? searchKey,
    String? errorMessage,
    int? index,
  }) {
    return LevelState(
      fetchLevelStatus: fetchLevelStatus ?? this.fetchLevelStatus,
      levels: levels ?? this.levels,
      index: index ?? this.index,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        fetchLevelStatus,
        levels,
        index,
        errorMessage,
      ];
}
