import 'package:fitness_app/features/exercise_detail/exercise_detail.dart';
import 'package:fitness_app/seeds/add_exercise.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';

class FAExerciseProgram extends StatefulWidget {
  const FAExerciseProgram({
    required this.widget,
    super.key,
  });

  final ExerciseDetailPage widget;

  @override
  State<FAExerciseProgram> createState() => _FAExerciseProgramState();
}

class _FAExerciseProgramState extends State<FAExerciseProgram> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 35),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s.exerciseProgram,
                style: context.textTheme.labelSmall?.copyWith(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(listCategoryExercise.length, (index) {
                return GestureDetector(
                  onTap: () {
                    _selectIndex = index;
                    setState(() {});
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 13),
                    padding: context.padding(vertical: 12, horizontal: 25),
                    decoration: BoxDecoration(
                      color: _selectIndex == index
                          ? context.colorScheme.tertiary
                          : context.colorScheme.onSurfaceVariant
                              .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      listCategoryExercise[index],
                      style: _selectIndex == index
                          ? context.textTheme.titleLarge?.copyWith(
                              fontSize: 12,
                              color: context.colorScheme.secondary,
                            )
                          : context.textTheme.titleLarge
                              ?.copyWith(fontSize: 12),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
