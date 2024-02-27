import 'package:fitness_app/features/exercise/bloc/exercise_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, int> {
  ExerciseBloc() : super(0) {
    on<ExerciseOnTap>((event, emit) => emit(event.index));
  }
}
