import 'package:equatable/equatable.dart';

abstract class ExerciseEvent extends Equatable {
  const ExerciseEvent();

  @override
  List<Object> get props => [];
}

class ExerciseOnTap extends ExerciseEvent {
  ExerciseOnTap(this.index);

  final int index;

  @override
  List<Object> get props => [index];
}

class ExerciseFetchBenefitData extends ExerciseEvent {}

class ExerciseFetchExerciseData extends ExerciseEvent {}

class ExerciseFetchExerciseDataByBenefitID extends ExerciseEvent {
  ExerciseFetchExerciseDataByBenefitID(this.benefitID, this.index);

  final int benefitID;
  final int index;

  @override
  List<Object> get props => [benefitID, index];
}
