import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/utils/status.dart';
import 'package:fitness_app/features/exercise/model/benefit.dart';
import 'package:fitness_app/features/home/model/exercise.dart';
class ExerciseState extends Equatable {
  const ExerciseState({
    this.fetchBenefitStatus = SubmissionStatus.initial,
    this.benefits = const [],
    this.errorMessage = '',
    this.index = 0,
    this.fetchExercisesStatus = SubmissionStatus.initial,
    this.exercises = const [],
  });

  final SubmissionStatus fetchBenefitStatus;
  final List<Benefit>? benefits;
  final int index;

  final SubmissionStatus fetchExercisesStatus;
  final List<Exercise>? exercises;

  final String errorMessage;

  ExerciseState copyWith({
    SubmissionStatus? fetchBenefitStatus,
    List<Benefit>? benefits,
    int? index,
    SubmissionStatus? fetchExercisesStatus,
    List<Exercise>? exercises,
    String? errorMessage,
  }) {
    return ExerciseState(
        fetchBenefitStatus: fetchBenefitStatus ?? this.fetchBenefitStatus,
        benefits: benefits ?? this.benefits,
        index: index ?? this.index,
        errorMessage: errorMessage ?? this.errorMessage,
        fetchExercisesStatus: fetchExercisesStatus ?? this.fetchExercisesStatus,
        exercises: exercises ?? this.exercises);
  }

  @override
  List<Object?> get props => [
        fetchBenefitStatus,
        fetchExercisesStatus,
        benefits,
        index,
        exercises,
        errorMessage,
      ];
}
