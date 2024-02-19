abstract class ExerciseEvent {}

class OnTapExercise extends ExerciseEvent {
  OnTapExercise(this.index);

  final int index;
}
