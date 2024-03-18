import 'package:fitness_app/features/exercise_detail/exercise_detail.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FADescriptionExercise extends StatelessWidget {
  const FADescriptionExercise({
    required this.widget,
    super.key,
  });

  final ExerciseDetailPage widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
          context.sizedBox(height: 34),
          Row(
            children: [
              Text(
                context.l10n.exerciseDetail(
                  widget.exercise.weeks ?? 0,
                  widget.exercise.exerciseNumber ?? 0,
                ),
                style: context.textTheme.bodyLarge,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => context.goNamed(AppRoutes.scheduleScreen.name),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                  height: context.sizeHeight(38),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: context.colorScheme.tertiary,
                  ),
                  child: Text(
                    context.l10n.schedule,
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontSize: 12,
                      color: context.colorScheme.secondary,
                    ),
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
