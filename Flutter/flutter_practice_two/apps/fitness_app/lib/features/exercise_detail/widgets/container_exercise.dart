// ignore_for_file: deprecated_member_use
import 'package:fitness_app/features/exercise_detail/exercise_detail.dart';
import 'package:fitness_ui/components/icons.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';

class FAContainerExercise extends StatelessWidget {
  const FAContainerExercise({
    required this.widget,
    super.key,
  });

  final ExerciseDetailPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.sizeHeight(60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      child: Padding(
        padding: context.padding(horizontal: 50, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FAIcons.calories(),
            const SizedBox(width: 8),
            FAText.bodyMedium(context, text: '${widget.exercise.kcal} kcal'),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              width: 1,
              height: context.sizeHeight(16),
              color: context.colorScheme.outlineVariant,
            ),
            FAIcons.clock(),
            const SizedBox(width: 8),
            FAText.bodyMedium(context, text: '${widget.exercise.min} min'),
          ],
        ),
      ),
    );
  }
}
