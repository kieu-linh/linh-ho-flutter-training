import 'package:equatable/equatable.dart';
import 'package:fitness_app/features/exercise/model/add_exercise.dart';

enum ExerciseStatus {
  initial,
  loading,
  fetchExerciseData,
  success,
  failure,
  cancel,
}

abstract class ExerciseState extends Equatable {
  const ExerciseState({
    required this.exerciseViewModel,
  });

  final ExerciseViewModel exerciseViewModel;

  @override
  List<Object> get props => [exerciseViewModel];
}


class ExerciseViewModel extends Equatable {
  const ExerciseViewModel({
    this.status = ExerciseStatus.initial,
    this.exercises = const [],
    this.errorMessage = '',
  });

  final ExerciseStatus status;
  final List<AddExerciseModel>? exercises;
  final String errorMessage;

  ExerciseViewModel copyWith({
    ExerciseStatus? status,
    List<AddExerciseModel>? exercises,
    String? errorMessage,

  }) {
    return ExerciseViewModel(
      status: status ?? this.status,
      exercises: exercises ?? this.exercises,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exercises,
        errorMessage,
      ];
}
