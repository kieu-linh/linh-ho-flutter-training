import 'package:fitness_app/features/home/model/exercise.dart';
import 'package:fitness_ui/components/icons.dart';
import 'package:fitness_ui/components/text.dart';
import 'package:fitness_ui/core/extension/device_info.dart';
import 'package:fitness_ui/core/extension/extension.dart';
import 'package:flutter/material.dart';

class FACardContainer extends StatelessWidget {
  const FACardContainer({
    required this.addExercise,
    super.key,
    this.onPressed,
  });

  final Exercise addExercise;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Image.asset(
            addExercise.image ?? '',
            height: context.sizeHeight(91),
            width: context.sizeWidth(91),
            fit: BoxFit.fill,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FAText.bodySmall(context, text: addExercise.title ?? ''),
                const SizedBox(height: 13),
                Row(
                  children: [
                    FAIcons.calories(),
                    const SizedBox(width: 7),
                    Text(
                      '${addExercise.kcal} kcal',
                      style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 10,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 1,
                      height: 8,
                      color: context.colorScheme.outlineVariant,
                    ),
                    FAIcons.clock(),
                    const SizedBox(width: 6),
                    Text(
                      '${addExercise.min} min',
                      style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 9),
                Text(
                  addExercise.level ?? '',
                  style: context.textTheme.bodySmall?.copyWith(fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
