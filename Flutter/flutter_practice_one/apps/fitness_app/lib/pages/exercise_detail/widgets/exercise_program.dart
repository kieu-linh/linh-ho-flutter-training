import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/data/models/add_exercise_data.dart';

class FAExerciseProgram extends StatefulWidget {
  const FAExerciseProgram({
    required this.s,
    super.key,
  });

  final FAUiS s;

  @override
  State<FAExerciseProgram> createState() => _FAExerciseProgramState();
}

class _FAExerciseProgramState extends State<FAExerciseProgram> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 35),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.s.exerciseProgram,
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
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 25,
                    ),
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
