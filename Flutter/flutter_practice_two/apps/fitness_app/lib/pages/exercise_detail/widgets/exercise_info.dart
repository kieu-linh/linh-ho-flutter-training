import 'package:fitness_app/pages/exercise_detail/exercise_detail.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:fitness_ui/l10n/l10n_generated/l10n.dart';
import 'package:flutter/material.dart';

class FAExerciseInfo extends StatelessWidget {
  const FAExerciseInfo({
    required this.widget,
    super.key,
  });

  final ExerciseDetailPage widget;

  @override
  Widget build(BuildContext context) {
    final s = FAUiS.of(context);
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ItemContainer(
          widget: widget,
          title: s.levelTitle,
          text: widget.exercise.level,
        ),
        const SizedBox(height: 15),
        ItemContainer(
          widget: widget,
          title: s.category,
          text: widget.exercise.category,
        ),
        const SizedBox(height: 15),
        ItemContainer(
          widget: widget,
          title: s.weight,
          text: widget.exercise.weight,
        ),
      ],
    );
  }
}

class ItemContainer extends StatelessWidget {
  const ItemContainer({
    required this.widget,
    this.title,
    this.text,
    super.key,
  });

  final ExerciseDetailPage widget;
  final String? title;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title ?? '',
          style: context.textTheme.labelMedium?.copyWith(fontSize: 10),
        ),
        const SizedBox(height: 6),
        Container(
          margin: const EdgeInsets.only(right: 13),
          padding: context.padding(vertical: 12, horizontal: 25),
          decoration: BoxDecoration(
            color: context.colorScheme.onSurfaceVariant.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            text ?? '',
            style: context.textTheme.bodySmall,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
