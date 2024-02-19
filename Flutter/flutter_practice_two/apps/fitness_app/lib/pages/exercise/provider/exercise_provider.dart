import 'package:fitness_app/pages/exercise/bloc/exercise_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseProvider extends StatelessWidget {
  const ExerciseProvider({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExerciseBloc(),
      child: child,
    );
  }
}
