import 'package:fitness_app/pages/exercise_detail/exercise_detail.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';

class FADescriptionExercise extends StatelessWidget {
  const FADescriptionExercise({
    required this.widget,
    required this.s,
    super.key,
  });

  final ExerciseDetailPage widget;
  final FAUiS s;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.exercise.title ?? '',
            style: context.textTheme.displaySmall?.copyWith(
              color: context.colorScheme.tertiary,
            ),
          ),
          const SizedBox(height: 9),
          Text(
            widget.exercise.description ?? '',
            style: context.textTheme.titleSmall?.copyWith(fontSize: 12),
          ),
          const SizedBox(height: 34),
          Row(
            children: [
              Text(
                s.exerciseDetail(
                  widget.exercise.weeks ?? 0,
                  widget.exercise.exerciseNumber ?? 0,
                ),
                style: context.textTheme.bodyLarge,
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 12,
                ),
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: context.colorScheme.tertiary,
                ),
                child: Text(
                  s.schedule,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontSize: 12,
                    color: context.colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
