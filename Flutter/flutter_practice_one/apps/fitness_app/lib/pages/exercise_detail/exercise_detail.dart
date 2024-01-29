// ignore_for_file: deprecated_member_use
import 'package:fitness_app/data/models/add_exercise_data.dart';
import 'package:fitness_app/pages/exercise_detail/widgets/container_exercise.dart';
import 'package:fitness_app/pages/exercise_detail/widgets/description_exercise.dart';
import 'package:fitness_app/pages/exercise_detail/widgets/exercise_info.dart';
import 'package:fitness_app/pages/exercise_detail/widgets/exercise_program.dart';
import 'package:fitness_app/pages/home/widgets/add_exercise.dart';
import 'package:fitness_ui/components/button.dart';
import 'package:fitness_ui/components/top_navigation.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExerciseDetailPage extends StatefulWidget {
  const ExerciseDetailPage({
    required this.exercise,
    super.key,
  });

  final AddExerciseModel exercise;
  @override
  State<ExerciseDetailPage> createState() => _ExerciseDetailPageState();
}

class _ExerciseDetailPageState extends State<ExerciseDetailPage> {
  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  widget.exercise.backgroundImage ?? '',
                  width: MediaQuery.sizeOf(context).width,
                  height: 379,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Column(
                    children: [
                      FAExerciseInfo(widget: widget),
                      FADescriptionExercise(widget: widget),
                      const FAExerciseProgram(),
                      const FAAddExercise(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 35, 20, 20),
                        child: FAButton(
                          text: s.startNow,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              left: 24,
              right: 24,
              child: FATopNavigation(
                onLeadingPress: () =>
                    GoRouter.of(context).go('/exerciseScreen'),
              ),
            ),
            Positioned(
              top: 349,
              left: 20,
              right: 20,
              child: FAContainerExercise(widget: widget),
            ),
          ],
        ),
      ),
    );
  }
}
