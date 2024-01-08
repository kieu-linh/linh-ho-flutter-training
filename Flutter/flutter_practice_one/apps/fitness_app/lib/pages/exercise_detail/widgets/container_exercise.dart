// ignore_for_file: deprecated_member_use

import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/constant/icons.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice_one/pages/exercise_detail/exercise_detail.dart';
import 'package:flutter_svg/svg.dart';

class FAContainerExercise extends StatelessWidget {
  const FAContainerExercise({
    required this.widget,
    super.key,
  });

  final ExerciseDetailPage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              FAIcons.iconCalories,
              color: context.colorScheme.tertiary,
              height: 22,
            ),
            const SizedBox(width: 8),
            FAText.bodyMedium(context, text: '${widget.exercise.kcal} kcal'),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              width: 1,
              height: 16,
              color: context.colorScheme.outlineVariant,
            ),
            SvgPicture.asset(
              FAIcons.iconClock,
              color: context.colorScheme.tertiary,
              height: 22,
            ),
            const SizedBox(width: 8),
            FAText.bodyMedium(context, text: '${widget.exercise.min} min'),
          ],
        ),
      ),
    );
  }
}
