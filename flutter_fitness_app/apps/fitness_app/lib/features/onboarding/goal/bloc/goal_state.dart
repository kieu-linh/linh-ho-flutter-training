import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/features/home/model/goal.dart';

class GoalState extends Equatable {
  const GoalState({
    this.fetchGoalStatus = SubmissionStatus.initial,
    this.goals = const [],
    this.errorMessage = '',
    this.index = 0,
  });

  final SubmissionStatus fetchGoalStatus;
  final List<Goal>? goals;

  final int index;
  final String errorMessage;

  GoalState copyWith({
    SubmissionStatus? fetchGoalStatus,
    List<Goal>? goals,
    String? errorMessage,
    int? index,
  }) {
    return GoalState(
      fetchGoalStatus: fetchGoalStatus ?? this.fetchGoalStatus,
      goals: goals ?? this.goals,
      index: index ?? this.index,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        fetchGoalStatus,
        goals,
        index,
        errorMessage,
      ];
}
